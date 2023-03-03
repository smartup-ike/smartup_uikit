import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'helpers/uikit_helper_functions.dart';
import 'helpers/uikit_color_scheme.dart';
import 'helpers/uikit_shadow_scheme.dart';
import 'helpers/uikit_size_scheme.dart';
import 'helpers/uikit_states.dart';
import 'theme/uikit_theme.dart';
import 'helpers/uikit_icon_theme.dart';

class UIKitDropdownButton<T> extends HookWidget {
  const UIKitDropdownButton({
    Key? key,
    required this.child,
    this.onTap,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
    required this.isDisabled,
    required this.trailing,
    this.label,
    this.input,
    this.childSize,
  }) : super(key: key);

  final Widget child;
  final Future<T?> Function(RelativeRect position, Size size)? onTap;
  final UIKitColorScheme? colorScheme;
  final UIKitSizeScheme? sizeScheme;
  final UIKitShadowScheme? shadowScheme;
  final bool isDisabled;
  final Widget trailing;
  final Widget? label;
  final Widget? input;
  final Size? childSize;

  @override
  Widget build(BuildContext context) {
    final state$ = useState(
      isDisabled ? UIKitState.disabled : UIKitState.defaultState,
    );
    final isHovered$ = useState(false);

    final themeData$ = useState(UIKitTheme.of(context).textInputThemeData);

    useEffect(() {
      state$.value = isDisabled ? UIKitState.disabled : UIKitState.defaultState;
      return;
    }, [isDisabled]);

    final colors$ =
        useState(define(colorScheme, themeData$.value.filledInputColorScheme));
    final size$ = useState(
        define(sizeScheme, themeData$.value.smallFilledInputSizeScheme));
    final shadows$ = useState(
        define(shadowScheme, themeData$.value.filledInputShadowScheme));

    final colorHelper = findStateAttributes(
      colors$.value,
      shadows$.value,
      state$.value,
    );

    return MouseRegion(
      cursor: state$.value == UIKitState.disabled
          ? SystemMouseCursors.basic
          : SystemMouseCursors.click,
      onHover: (e) {
        if (!isDisabled && e.kind != PointerDeviceKind.touch) {
          state$.value = UIKitState.hover;
          isHovered$.value = true;
        }
      },
      onExit: (_) {
        if (!isDisabled) {
          state$.value = UIKitState.defaultState;
          isHovered$.value = false;
        }
      },
      child: GestureDetector(
        onTap: isDisabled
            ? null
            : () async {
                const offset = Offset.zero;
                final box = context.findRenderObject()! as RenderBox;
                final RenderBox overlay = Navigator.of(context)
                    .overlay!
                    .context
                    .findRenderObject()! as RenderBox;
                final RelativeRect position = RelativeRect.fromRect(
                  Rect.fromPoints(
                    box.localToGlobal(offset, ancestor: overlay),
                    box.localToGlobal(
                      box.size.bottomRight(offset) + offset,
                      ancestor: overlay,
                    ),
                  ),
                  offset & overlay.size,
                );
                final size = Size.copy(childSize ?? box.size);
                onTap?.call(position, size);
              },
        onTapDown: (_) {
          if (!isDisabled) {
            state$.value = UIKitState.focused;
          }
        },
        onTapUp: (_) {
          if (!isDisabled) {
            state$.value =
                isHovered$.value ? UIKitState.hover : UIKitState.defaultState;
          }
        },
        onTapCancel: () {
          if (!isDisabled) {
            state$.value =
                isHovered$.value ? UIKitState.hover : UIKitState.defaultState;
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: size$.value.height,
          width: size$.value.width,
          padding: size$.value.padding,
          decoration: BoxDecoration(
            color: colorHelper.backgroundColor,
            borderRadius: BorderRadius.circular(size$.value.borderRadius ?? 8),
            border: Border.all(
              color: colorHelper.borderColor ?? Colors.transparent,
              width: size$.value.borderSize ?? 1,
            ),
            boxShadow: colorHelper.shadows,
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DefaultTextStyle(
                      style: size$.value.labelStyle
                              ?.copyWith(color: colorHelper.contentColor) ??
                          TextStyle(color: colorHelper.contentColor),
                      child: label ?? const SizedBox(),
                    ),
                    DefaultTextStyle(
                      style: size$.value.inputStyle
                              ?.copyWith(color: colorHelper.contentColor) ??
                          TextStyle(color: colorHelper.contentColor),
                      child: input ?? const SizedBox(),
                    ),
                  ],
                ),
              ),
              UIKitIconTheme(
                color: colorHelper.secondaryContentColor,
                size: size$.value.trailingSize,
                child: trailing,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
