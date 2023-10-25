import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'helpers/uikit_helper_functions.dart';
import 'theme/uikit_theme.dart';
import 'helpers/uikit_states.dart';
import 'helpers/uikit_color_scheme.dart';
import 'helpers/uikit_shadow_scheme.dart';
import 'helpers/uikit_size_scheme.dart';

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
    final themeData = UIKitTheme.of(context).calendarButtonThemeData;
    final colors = define(colorScheme, themeData.colorScheme);
    final size = define(sizeScheme, themeData.sizeScheme);
    final shadows = define(shadowScheme, themeData.shadowScheme);
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
      colors,
      shadows,
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
          width: size.width,
          height: size.height,
          duration: const Duration(milliseconds: 200),
          padding: size.padding,
          decoration: BoxDecoration(
            color: isBetweenSelected
                ? colorHelper.secondaryContentColor
                : colorHelper.backgroundColor,
            border: Border.all(
              color: colorHelper.borderColor ?? Colors.transparent,
              width: size.borderSize ?? 0,
            ),
            borderRadius: BorderRadius.circular(size.borderRadius ?? 12),
            boxShadow: colorHelper.shadows,
          ),
          child: Center(
            child: Text(
              date.day.toString(),
              style: size.labelStyle?.copyWith(
                color: colorHelper.contentColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
