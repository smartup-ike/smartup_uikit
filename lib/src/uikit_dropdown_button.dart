import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smartup_uikit/src/theme/uikit_dropdown_button_theme_data.dart';
import 'helpers/uikit_sizes.dart';
import 'helpers/uikit_text_input_style.dart';
import 'helpers/uikit_helper_functions.dart';
import 'helpers/uikit_color_scheme.dart';
import 'helpers/uikit_shadow_scheme.dart';
import 'helpers/uikit_size_scheme.dart';
import 'helpers/uikit_states.dart';
import 'theme/uikit_theme.dart';
import 'helpers/uikit_icon_theme.dart';

class UIKitDropdownButton extends HookWidget {
  const UIKitDropdownButton({
    super.key,
    this.onTap,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
    required this.isDisabled,
    required this.trailing,
    this.leading,
    this.label,
    this.input,
    this.childSize,
  })  : styleType = null,
        size = UIKitSizes.medium;

  const UIKitDropdownButton.largeFilled({
    super.key,
    this.onTap,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
    required this.isDisabled,
    required this.trailing,
    this.leading,
    this.label,
    this.input,
    this.childSize,
  })  : styleType = TextInputStyleType.filled,
        size = UIKitSizes.large;

  const UIKitDropdownButton.mediumFilled({
    super.key,
    this.onTap,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
    required this.isDisabled,
    required this.trailing,
    this.leading,
    this.label,
    this.input,
    this.childSize,
  })  : styleType = TextInputStyleType.filled,
        size = UIKitSizes.medium;

  const UIKitDropdownButton.smallFilled({
    super.key,
    this.onTap,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
    required this.isDisabled,
    required this.trailing,
    this.leading,
    this.label,
    this.input,
    this.childSize,
  })  : styleType = TextInputStyleType.filled,
        size = UIKitSizes.small;

  const UIKitDropdownButton.largeLine({
    super.key,
    this.onTap,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
    required this.isDisabled,
    required this.trailing,
    this.leading,
    this.label,
    this.input,
    this.childSize,
  })  : styleType = TextInputStyleType.line,
        size = UIKitSizes.large;

  const UIKitDropdownButton.mediumLine({
    super.key,
    this.onTap,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
    required this.isDisabled,
    required this.trailing,
    this.leading,
    this.label,
    this.input,
    this.childSize,
  })  : styleType = TextInputStyleType.line,
        size = UIKitSizes.medium;

  const UIKitDropdownButton.smallLine({
    super.key,
    this.onTap,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
    required this.isDisabled,
    required this.trailing,
    this.leading,
    this.label,
    this.input,
    this.childSize,
  })  : styleType = TextInputStyleType.line,
        size = UIKitSizes.small;

  final void Function(RelativeRect position, Size size)? onTap;
  final UIKitColorScheme? colorScheme;
  final UIKitSizeScheme? sizeScheme;
  final UIKitShadowScheme? shadowScheme;
  final bool isDisabled;
  final Widget trailing;
  final Widget? leading;
  final Widget? label;
  final Widget? input;
  final Size? childSize;
  final TextInputStyleType? styleType;
  final UIKitSizes? size;

  @override
  Widget build(BuildContext context) {
    final state$ = useState(
      isDisabled ? UIKitState.disabled : UIKitState.defaultState,
    );
    final isHovered$ = useState(false);

    final themeData = UIKitTheme.of(context).dropdownButtonThemeData;

    useEffect(() {
      state$.value = isDisabled ? UIKitState.disabled : UIKitState.defaultState;
      return;
    }, [isDisabled]);

    final colors = define(colorScheme, findColors(themeData));
    final size = define(sizeScheme, findSize(themeData));
    final shadows = define(shadowScheme, findShadows(themeData));

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
          height: size.height,
          width: size.width,
          padding: size.padding,
          decoration: BoxDecoration(
            color: colorHelper.backgroundColor,
            borderRadius: styleType == TextInputStyleType.filled
                ? BorderRadius.circular(size.borderRadius ?? 8)
                : null,
            border: styleType == TextInputStyleType.filled
                ? Border.all(
                    color: colorHelper.borderColor ?? Colors.transparent,
                    width: size.borderSize ?? 1,
                  )
                : Border(
                    bottom: BorderSide(
                      color: colorHelper.borderColor ?? Colors.transparent,
                      width: size.borderSize ?? 1,
                    ),
                  ),
            boxShadow: colorHelper.shadows,
          ),
          child: Row(
            children: [
              if (leading != null)
                UIKitIconTheme(
                  color: colorHelper.contentColor,
                  size: size.leadingSize,
                  child: leading!,
                ),
              SizedBox(width: size.spacing),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (label != null)
                      DefaultTextStyle(
                        style: size.labelStyle
                                ?.copyWith(color: colorHelper.contentColor) ??
                            TextStyle(
                              color: colorHelper.contentColor,
                            ),
                        child: label ?? const Text(''),
                      ),
                    DefaultTextStyle(
                      style: size.inputStyle
                              ?.copyWith(color: colorHelper.contentColor) ??
                          TextStyle(color: colorHelper.contentColor),
                      child: input ?? const Text(''),
                    ),
                  ],
                ),
              ),
              UIKitIconTheme(
                color: colorHelper.secondaryContentColor,
                size: size.trailingSize,
                child: trailing,
              ),
            ],
          ),
        ),
      ),
    );
  }

  UIKitColorScheme findColors(UIKitDropdownButtonThemeData themeData) {
    UIKitColorScheme colorScheme;

    if (styleType == TextInputStyleType.filled) {
      colorScheme = themeData.filledInputColorScheme;
    } else {
      colorScheme = themeData.lineInputColorScheme;
    }

    return colorScheme;
  }

  UIKitSizeScheme findSize(UIKitDropdownButtonThemeData themeData) {
    UIKitSizeScheme sizeScheme;

    switch (size) {
      case UIKitSizes.small:
        if (styleType == TextInputStyleType.filled) {
          sizeScheme = themeData.smallFilledDropDownSizeScheme;
        } else {
          sizeScheme = themeData.smallLineInputSizeScheme;
        }
        break;
      case UIKitSizes.medium:
        if (styleType == TextInputStyleType.filled) {
          sizeScheme = themeData.mediumFilledDropDownSizeScheme;
        } else {
          sizeScheme = themeData.mediumLineInputSizeScheme;
        }
        break;
      default:
        if (styleType == TextInputStyleType.filled) {
          sizeScheme = themeData.largeFilledDropDownSizeScheme;
        } else {
          sizeScheme = themeData.largeLineInputSizeScheme;
        }
        break;
    }

    return sizeScheme;
  }

  UIKitShadowScheme findShadows(UIKitDropdownButtonThemeData themeData) {
    UIKitShadowScheme shadowScheme;

    if (styleType == TextInputStyleType.filled) {
      shadowScheme = themeData.filledInputShadowScheme;
    } else {
      shadowScheme = themeData.lineInputShadowScheme;
    }

    return shadowScheme;
  }
}
