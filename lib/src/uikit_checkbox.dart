import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'helpers/uikit_helper_functions.dart';
import 'helpers/uikit_icon_theme.dart';
import 'theme/uikit_theme.dart';
import 'helpers/uikit_shadow_scheme.dart';
import 'helpers/uikit_color_scheme.dart';
import 'helpers/uikit_size_scheme.dart';
import 'helpers/uikit_states.dart';

class UIKitCheckbox extends HookWidget {
  const UIKitCheckbox({
    super.key,
    required this.icon,
    this.onChanged,
    required this.isChecked,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
  });

  /// [Widget] that is displayed within the checkbox.
  /// It is suggested that you pass a ternary with two different [Widget] for
  /// each of the states (checked or not checked).
  final Widget icon;

  /// [ValueChanged] called whenever the widget is tapped with the negative
  /// value of [isChecked].
  final ValueChanged<bool?>? onChanged;

  /// [bool] indicating whether the widget is checked
  final bool isChecked;

  /// [UIKitColorScheme] determining color attributes of this widget
  final UIKitColorScheme? colorScheme;

  /// [UIKitSizeScheme] determining size attributes of this widget
  final UIKitSizeScheme? sizeScheme;

  /// [UIKitShadowScheme] determining shadow attributes of this widget
  final UIKitShadowScheme? shadowScheme;

  @override
  Widget build(BuildContext context) {
    final state$ = useState<UIKitState>(
      onChanged == null
          ? UIKitState.disabled
          : isChecked
              ? UIKitState.active
              : UIKitState.defaultState,
    );
    final isHovered$ = useState(false);
    final themeData$ = useState(UIKitTheme.of(context).checkboxThemeData);
    final colors$ =
        useState(define(colorScheme, themeData$.value.checkedColorScheme));
    final shadows$ =
        useState(define(shadowScheme, themeData$.value.shadowScheme));
    final size$ = useState(define(sizeScheme, themeData$.value.sizeScheme));

    final colorHelper = findStateAttributes(
      colors$.value,
      shadows$.value,
      state$.value,
    );

    return MouseRegion(
      cursor: state$.value == UIKitState.disabled
          ? SystemMouseCursors.basic
          : SystemMouseCursors.click,
      onHover: (_) {
        if (onChanged != null) {
          state$.value = UIKitState.hover;
          isHovered$.value = true;
        }
      },
      onExit: (_) {
        if (onChanged != null) {
          state$.value = UIKitState.defaultState;
          isHovered$.value = false;
        }
      },
      child: GestureDetector(
        onTap: () => onChanged?.call(!(isChecked)),
        onTapDown: (_) {
          if (onChanged != null) {
            state$.value = UIKitState.focused;
          }
        },
        onTapUp: (_) {
          if (onChanged != null) {
            state$.value =
                isHovered$.value ? UIKitState.hover : UIKitState.defaultState;
          }
        },
        onTapCancel: () {
          if (onChanged != null) {
            state$.value =
                isHovered$.value ? UIKitState.hover : UIKitState.defaultState;
          }
        },
        child: SizedBox(
          height: size$.value.height,
          width: size$.value.width,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              color: colorHelper.backgroundColor,
              borderRadius:
                  BorderRadius.circular(size$.value.borderRadius ?? 4),
              border: Border.all(
                width: size$.value.borderSize ?? 1,
                color: colorHelper.borderColor ?? Colors.transparent,
              ),
              boxShadow: colorHelper.shadows,
            ),
            padding: size$.value.padding,
            child: isChecked
                ? UIKitIconTheme(
                    size: size$.value.iconSize,
                    color: colorHelper.contentColor,
                    child: icon,
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
