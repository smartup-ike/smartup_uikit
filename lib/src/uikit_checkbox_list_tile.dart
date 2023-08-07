import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smartup_uikit/src/theme/uikit_checkbox_list_tile_theme_data.dart';
import 'helpers/uikit_helper_functions.dart';
import 'helpers/uikit_sizes.dart';
import 'helpers/uikit_color_scheme.dart';
import 'helpers/uikit_states.dart';
import 'helpers/uikit_size_scheme.dart';
import 'helpers/uikit_shadow_scheme.dart';
import 'theme/uikit_theme.dart';

class UIKitCheckBoxListTile extends HookWidget {
  const UIKitCheckBoxListTile.smallWithLeading({
    super.key,
    this.leading,
    this.onChanged,
    required this.isChecked,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
  }) : checkBoxSize = UIKitSizes.small,
        trailing = null;

  const UIKitCheckBoxListTile.mediumWithLeading({
    super.key,
    this.leading,
    this.onChanged,
    required this.isChecked,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
  }) : checkBoxSize = UIKitSizes.medium,
        trailing = null;

  const UIKitCheckBoxListTile.largeWithLeading({
    super.key,
    this.leading,
    this.onChanged,
    required this.isChecked,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
  }) : checkBoxSize = UIKitSizes.large,
        trailing = null;

  const UIKitCheckBoxListTile.smallWithTrailing({
    super.key,
    this.trailing,
    this.onChanged,
    required this.isChecked,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
  }) : checkBoxSize = UIKitSizes.small,
        leading = null;

  const UIKitCheckBoxListTile.mediumWithTrailing({
    super.key,
    this.trailing,
    this.onChanged,
    required this.isChecked,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
  }) : checkBoxSize = UIKitSizes.medium,
        leading = null;

  const UIKitCheckBoxListTile.largeWithTrailing({
    super.key,
    this.trailing,
    this.onChanged,
    required this.isChecked,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
  }) : checkBoxSize = UIKitSizes.large,
        leading = null;

  /// [UIKitCheckBoxListTile] is a checkbox that can have a leading label [Widget] or a trailing label [Widget]
  ///
  /// * Recommended type for label [Text]
  ///

  /// Function that is called on tile tap.
  ///
  /// Set onTap = null if the checkbox-ListTile is disabled
  final ValueChanged<bool>? onChanged;

  /// [Widget] for the leading label.
  ///
  final Widget? leading;

  /// [Widget] for the trailing label.
  ///
  final Widget? trailing;

  final bool isChecked;

  /// [UIKitColorScheme] containing information about the colors for all the
  /// different states.
  final UIKitColorScheme? colorScheme;

  /// [UIKitSizeScheme] containing information about the size elements
  /// for all the different states.
  /// secondary spacing is the width of the checkbox (inner) border
  final UIKitSizeScheme? sizeScheme;

  /// [UIKitShadowScheme] containing information about the shadows for all the
  /// different states.
  final UIKitShadowScheme? shadowScheme;

  /// [UIKitSizes] size of this checkBox.
  final UIKitSizes? checkBoxSize;

  @override
  Widget build(BuildContext context) {
    final isActive$ = useState(isChecked);
    final state$ = useState<UIKitState>(
        onChanged == null ? UIKitState.disabled : UIKitState.defaultState);
    final isHovered$ = useState(false);
    final theme$ = useState<UIKitCheckBoxListTileThemeData>(
        UIKitTheme.of(context).checkboxListTileThemeData);
    final colors$ = useState<UIKitColorScheme>(findColors(theme$.value));
    final size$ = useState<UIKitSizeScheme>(findSize(theme$.value));
    final shadows$ = useState<UIKitShadowScheme>(findShadows(theme$.value));

    useEffect(() {
      if (onChanged == null) {
        state$.value = UIKitState.disabled;
      } else {
        state$.value = UIKitState.defaultState;
      }
      return null;
    }, [onChanged == null]);

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
        if (onChanged != null && e.kind != PointerDeviceKind.touch) {
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
        onTap: () {
          if (state$.value != UIKitState.disabled) {
            isActive$.value = !isActive$.value;
            onChanged?.call(isActive$.value);
            state$.value =
                isHovered$.value ? UIKitState.hover : UIKitState.defaultState;
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
        onTapDown: (_) {
          if (onChanged != null) {
            state$.value = UIKitState.focused;
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: size$.value.padding,
          decoration: BoxDecoration(
            color: colorHelper.backgroundColor,
            borderRadius: BorderRadius.circular(size$.value.borderRadius ?? 8),
            border: Border.all(
              width: size$.value.secondarySpacing ?? 0,
              color: Colors.transparent,
            ),
            boxShadow: colorHelper.shadows,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (leading != null) ...[
                DefaultTextStyle(
                  style: size$.value.labelStyle
                          ?.copyWith(color: colorHelper.contentColor) ??
                      TextStyle(color: colorHelper.contentColor),
                  child: leading!,
                ),
                SizedBox(width: size$.value.spacing),
              ],
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: size$.value.borderSize ?? 1,
                    color: colorHelper.borderColor ?? Colors.black,
                  ),
                  color: colorHelper.secondaryContentColor,
                ),
                height: size$.value.iconSize,
                width: size$.value.iconSize,
                child: Center(
                  child: isActive$.value
                      ? Icon(
                          Icons.check,
                          size: size$.value.iconSize,
                          color: colorHelper.contentColor,
                        )
                      : SizedBox(height: size$.value.iconSize, width: size$.value.iconSize,),
                ),
              ),
              if (trailing != null) ...[
                SizedBox(width: size$.value.spacing),
                DefaultTextStyle(
                  style: size$.value.labelStyle
                          ?.copyWith(color: colorHelper.contentColor) ??
                      TextStyle(color: colorHelper.contentColor),
                  child: trailing!,
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }

  UIKitColorScheme findColors(UIKitCheckBoxListTileThemeData themeData) {
    UIKitColorScheme colorScheme;
    if (this.colorScheme != null) {
      colorScheme = this.colorScheme!;
    } else {
      colorScheme = themeData.primaryColors;
    }
    return colorScheme;
  }

  UIKitShadowScheme findShadows(UIKitCheckBoxListTileThemeData themeData) {
    UIKitShadowScheme shadowScheme;
    if (this.shadowScheme != null) {
      shadowScheme = this.shadowScheme!;
    } else {
      shadowScheme = themeData.primaryShadows;
    }
    return shadowScheme;
  }

  UIKitSizeScheme findSize(UIKitCheckBoxListTileThemeData themeData) {
    UIKitSizeScheme sizeScheme;
    if (this.sizeScheme != null) {
      sizeScheme = this.sizeScheme!;
      //if the icon size is null set 10 as default
      sizeScheme.iconSize ??= 10;
    } else {
      switch (checkBoxSize) {
        case UIKitSizes.small:
          sizeScheme = themeData.smallSize;
          break;
        case UIKitSizes.large:
          sizeScheme = themeData.largeSize;
          break;
        default:
          sizeScheme = themeData.mediumSize;
          break;
      }
    }
    return sizeScheme;
  }
}