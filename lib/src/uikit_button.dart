import 'package:flutter/material.dart';
import 'helpers/uikit_color_scheme.dart';
import 'helpers/uikit_states.dart';
import 'helpers/size_scheme.dart';
import 'uikit_icon_theme.dart';

/// [UIKitButton] is a button that can have a leading [Widget], a trailing [Widget]
/// and a label [Widget].
class UIKitButton extends StatefulWidget {
  const UIKitButton({
    super.key,
    this.onTap,
    this.labelText,
    this.leading,
    this.trailing,
    this.sizeScheme,
    this.hasShadow,
    this.colorScheme,
    this.removePadding,
  });

  /// Function that is called on button tap.
  ///
  /// Set onTap = null if the button is disabled
  final VoidCallback? onTap;

  /// [Widget] for the label text.
  ///
  /// If the widget contains [Text], the style changes automatically.
  final Widget? labelText;

  /// [Widget] for the leading icon.
  ///
  /// If the widget contains [SvgPicture], the style changes automatically.
  final Widget? leading;

  /// [Widget] for the trailing icon.
  ///
  /// If the widget contains [SvgPicture], the style changes automatically.
  final Widget? trailing;

  /// [SizeScheme] an object containing info for the button's height, icon size and text style
  final SizeScheme? sizeScheme;

  /// [UIKitColorScheme] an object containing different colors for all the button's states
  final UIKitColorScheme? colorScheme;

  /// Boolean indicating wether the button has shadow
  final bool? hasShadow;

  /// Boolean of the button to remove initial padding.
  final bool? removePadding;

  @override
  State<UIKitButton> createState() => _UIKitButtonState();
}

class _UIKitButtonState extends State<UIKitButton> {
  late UIKitState state;
  bool isHovering = false;

  @override
  void initState() {
    state =
        widget.onTap == null ? UIKitState.disabled : UIKitState.defaultState;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color? backgroundColor;
    Color? contentColor;
    Color? borderColor;

    switch (state) {
      case UIKitState.defaultState:
        backgroundColor = widget.colorScheme?.defaultBackgroundColor;
        contentColor = widget.colorScheme?.defaultContentColor;
        borderColor = widget.colorScheme?.defaultBorderColor;
        break;
      case UIKitState.hover:
        backgroundColor = widget.colorScheme?.hoverBackgroundColor;
        contentColor = widget.colorScheme?.hoverContentColor;
        borderColor = widget.colorScheme?.hoverBorderColor;
        break;
      case UIKitState.focused:
        backgroundColor = widget.colorScheme?.focusedBackgroundColor;
        contentColor = widget.colorScheme?.focusedContentColor;
        borderColor = widget.colorScheme?.focusedBorderColor;
        break;
      case UIKitState.active:
        backgroundColor = widget.colorScheme?.activeBackgroundColor;
        contentColor = widget.colorScheme?.activeContentColor;
        borderColor = widget.colorScheme?.activeBorderColor;
        break;
      case UIKitState.disabled:
        backgroundColor = widget.colorScheme?.disabledBackgroundColor;
        contentColor = widget.colorScheme?.disabledContentColor;
        borderColor = widget.colorScheme?.disabledBorderColor;
        break;
      default:
        break;
    }

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onHover: (_) {
        if (widget.onTap != null) {
          setState(() {
            state = UIKitState.hover;
            isHovering = true;
          });
        }
      },
      onExit: (_) {
        if (widget.onTap != null) {
          setState(() {
            state = UIKitState.defaultState;
            isHovering = false;
          });
        }
      },
      child: GestureDetector(
        onTap: widget.onTap,
        onTapDown: (_) {
          if (widget.onTap != null) {
            setState(() => state = UIKitState.focused);
          }
        },
        onTapUp: (_) {
          if (widget.onTap != null) {
            setState(
              () => state =
                  isHovering ? UIKitState.hover : UIKitState.defaultState,
            );
          }
        },
        onTapCancel: () {
          if (widget.onTap != null) {
            setState(
              () => state =
                  isHovering ? UIKitState.hover : UIKitState.defaultState,
            );
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              strokeAlign: StrokeAlign.outside,
              width: 2,
              color: borderColor ?? Colors.transparent,
            ),
          ),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                strokeAlign: StrokeAlign.outside,
                width: 1,
                color: borderColor ?? Colors.transparent,
              ),
              boxShadow: widget.onTap == null || !(widget.hasShadow ?? true)
                  ? []
                  : state == UIKitState.focused
                      ? [
                          BoxShadow(
                            offset: const Offset(0, 0),
                            blurRadius: 4,
                            spreadRadius: 0,
                            color: const Color(0xFF0D1556).withOpacity(.75),
                          ),
                        ]
                      : [
                          BoxShadow(
                            offset: const Offset(0, 1),
                            blurRadius: 2,
                            spreadRadius: 0,
                            color: const Color(0xFF0D1556).withOpacity(.33),
                          ),
                          BoxShadow(
                            offset: const Offset(0, 4),
                            blurRadius: 8,
                            spreadRadius: 0,
                            color: const Color(0xFF201E8D).withOpacity(.25),
                          ),
                        ],
            ),
            height: widget.sizeScheme?.height,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (!widget.removePadding!) const SizedBox(width: 10),
                if (widget.leading != null) ...[
                  UIKitIconTheme(
                    color: contentColor,
                    size: widget.sizeScheme?.height,
                    child: widget.leading!,
                  ),
                  const SizedBox(width: 10),
                ],
                DefaultTextStyle(
                  style: widget.sizeScheme?.labelTextStyle ?? const TextStyle(),
                  child: widget.labelText ?? const Text('Button'),
                ),
                if (!widget.removePadding!) const SizedBox(width: 10),
                if (widget.trailing != null) ...[
                  UIKitIconTheme(
                    color: contentColor,
                    size: widget.sizeScheme?.height,
                    child: widget.trailing!,
                  ),
                  if (!widget.removePadding!) const SizedBox(width: 10),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
