import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'uikit_helper_functions.dart';
import '../theme/uikit_theme.dart';
import 'uikit_states.dart';
import 'uikit_color_scheme.dart';
import 'uikit_shadow_scheme.dart';
import 'uikit_size_scheme.dart';

class UIKitCalendarButton extends HookWidget {
  const UIKitCalendarButton({
    super.key,
    required this.date,
    this.isSelected = false,
    this.isBetweenSelected = false,
    this.onTap,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
  }) : assert(
          (isSelected && isBetweenSelected) == false,
          'Widget can not be selected and between selected at the same time!',
        );

  final DateTime date;
  final bool isSelected;
  final bool isBetweenSelected;
  final ValueChanged<DateTime>? onTap;
  final UIKitColorScheme? colorScheme;
  final UIKitSizeScheme? sizeScheme;
  final UIKitShadowScheme? shadowScheme;

  @override
  Widget build(BuildContext context) {
    final state$ = useState(
      isSelected || isBetweenSelected
          ? UIKitState.active
          : onTap == null
              ? UIKitState.disabled
              : UIKitState.defaultState,
    );
    final isHovered$ = useState(false);
    final themeData$ = useState(UIKitTheme.of(context).calendarButtonThemeData);
    final colors$ = useState(define(colorScheme, themeData$.value.colorScheme));
    final size$ = useState(define(sizeScheme, themeData$.value.sizeScheme));
    final shadows$ = useState(
      define(shadowScheme, themeData$.value.shadowScheme),
    );
    useEffect(
      () {
        state$.value = isSelected || isBetweenSelected
            ? UIKitState.active
            : onTap == null
                ? UIKitState.disabled
                : UIKitState.defaultState;
        return;
      },
      [isSelected, isBetweenSelected, onTap == null],
    );
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
        if (state$.value != UIKitState.active &&
            state$.value != UIKitState.disabled &&
            e.kind != PointerDeviceKind.touch) {
          state$.value = UIKitState.hover;
          isHovered$.value = true;
        }
      },
      onExit: (_) {
        if (state$.value != UIKitState.active &&
            state$.value != UIKitState.disabled) {
          state$.value = UIKitState.defaultState;
          isHovered$.value = false;
        }
      },
      child: GestureDetector(
        onTap: () {
          if (state$.value != UIKitState.disabled) {
            state$.value = UIKitState.active;
            onTap?.call(date);
          }
        },
        onTapDown: (_) {
          if (state$.value != UIKitState.active &&
              state$.value != UIKitState.disabled) {
            state$.value = UIKitState.focused;
          }
        },
        onTapUp: (_) {
          if (state$.value != UIKitState.active &&
              state$.value != UIKitState.disabled) {
            state$.value =
                isHovered$.value ? UIKitState.hover : UIKitState.defaultState;
          }
        },
        onTapCancel: () {
          if (state$.value != UIKitState.active &&
              state$.value != UIKitState.disabled) {
            state$.value =
                isHovered$.value ? UIKitState.hover : UIKitState.defaultState;
          }
        },
        child: AnimatedContainer(
          width: size$.value.width,
          height: size$.value.height,
          duration: const Duration(milliseconds: 200),
          padding: size$.value.padding,
          decoration: BoxDecoration(
            color: isBetweenSelected
                ? colorHelper.secondaryContentColor
                : colorHelper.backgroundColor,
            border: Border.all(
              color: colorHelper.borderColor ?? Colors.transparent,
              width: size$.value.borderSize ?? 0,
            ),
            borderRadius: BorderRadius.circular(size$.value.borderRadius ?? 12),
            boxShadow: colorHelper.shadows,
          ),
          child: Center(
            child: Text(
              date.day.toString(),
              style: size$.value.labelStyle?.copyWith(
                color: colorHelper.contentColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}