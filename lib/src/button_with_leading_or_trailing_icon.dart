import 'package:flutter/material.dart';
import 'package:smartup_uikit/src/helpers/uikit_color_scheme.dart';
import 'package:smartup_uikit/src/helpers/uikit_states.dart';
import 'helpers/size_scheme.dart';
import 'uikit_icon_theme.dart';

class ButtonWithLeadingOrTrailingIcon extends StatefulWidget {
  const ButtonWithLeadingOrTrailingIcon({
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

  final VoidCallback? onTap;
  final Widget? labelText;
  final Widget? leading;
  final Widget? trailing;
  final SizeScheme? sizeScheme;
  final UIKitColorScheme? colorScheme;
  final bool? hasShadow;
  final bool? removePadding;

  @override
  State<ButtonWithLeadingOrTrailingIcon> createState() =>
      _ButtonWithLeadingOrTrailingIconState();
}

class _ButtonWithLeadingOrTrailingIconState
    extends State<ButtonWithLeadingOrTrailingIcon> {
  bool isPressed = false;
  late UIKitState state;

  @override
  void initState() {
    state = UIKitState.defaultState;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (_) {
        if (widget.onTap != null) {
          setState(() {
            isPressed = true;
          });
        }
      },
      onTapUp: (_) {
        if (widget.onTap != null) {
          setState(() {
            isPressed = false;
          });
        }
      },
      onTapCancel: () {
        if (widget.onTap != null) {
          setState(() {
            isPressed = false;
          });
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            strokeAlign: StrokeAlign.outside,
            width: 2,
            color: isPressed ? Colors.white : Colors.transparent,
          ),
        ),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isPressed ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              strokeAlign: StrokeAlign.outside,
              width: 1,
              color: isPressed ? Colors.white : Colors.transparent,
            ),
            boxShadow: widget.onTap == null || !(widget.hasShadow ?? true)
                ? []
                : isPressed
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
              if (!widget.removePadding!)
                const SizedBox(
                  width: 10,
                ),
              if (widget.leading != null) ...[
                UIKitIconTheme(
                  color: Colors.black,
                  size: widget.sizeScheme?.height,
                  child: widget.leading ?? Container(),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
              DefaultTextStyle(
                  style: widget.sizeScheme?.labelTextStyle ?? const TextStyle(),
                  child: widget.labelText ?? const Text('Button')),
              if (!widget.removePadding!)
                const SizedBox(
                  width: 10,
                ),
              if (widget.trailing != null) ...[
                UIKitIconTheme(
                  color: Colors.black,
                  size: widget.sizeScheme?.height,
                  child: widget.trailing!,
                ),
                if (!widget.removePadding!)
                  const SizedBox(
                    width: 10,
                  ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
