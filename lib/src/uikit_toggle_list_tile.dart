import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../smartup_uikit.dart';
import 'helpers/uikit_helper_functions.dart';
import 'helpers/uikit_sizes.dart';

import 'helpers/uikit_states.dart';

class UIKitToggleListTile extends HookWidget {
  const UIKitToggleListTile.smallWithLeading({
    super.key,
    this.leading,
    this.onTap,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
  })  : toggleSize = UIKitSizes.small,
        trailing = null;

  const UIKitToggleListTile.mediumWithLeading({
    super.key,
    this.leading,
    this.onTap,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
  })  : toggleSize = UIKitSizes.medium,
        trailing = null;

  const UIKitToggleListTile.largeWithLeading({
    super.key,
    this.leading,
    this.onTap,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
  })  : toggleSize = UIKitSizes.large,
        trailing = null;

  const UIKitToggleListTile.smallWithTrailing({
    super.key,
    this.trailing,
    this.onTap,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
  })  : toggleSize = UIKitSizes.small,
        leading = null;

  const UIKitToggleListTile.mediumWithTrailing({
    super.key,
    this.trailing,
    this.onTap,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
  })  : toggleSize = UIKitSizes.medium,
        leading = null;

  const UIKitToggleListTile.largeWithTrailing({
    super.key,
    this.trailing,
    this.onTap,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
  })  : toggleSize = UIKitSizes.large,
        leading = null;

  /// [UIKitToggleListTile] is a toggle that can have a leading label [Widget] or a trailing label [Widget]
  ///
  /// * Recommended type for label [Text]
  ///

  /// Function that is called on tile tap.
  ///
  /// Set onTap = null if the toggle is disabled
  final VoidCallback? onTap;

  /// [Widget] for the leading label.
  ///
  final Widget? leading;

  /// [Widget] for the trailing label.
  ///
  final Widget? trailing;

  /// [UIKitColorScheme] containing information about the colors for all the
  /// different states.
  final UIKitColorScheme? colorScheme;

  /// [UIKitSizeScheme] containing information about the size elements
  /// for all the different states.
  final UIKitSizeScheme? sizeScheme;

  /// [UIKitShadowScheme] containing information about the shadows for all the
  /// different states.
  final UIKitShadowScheme? shadowScheme;

  /// [UIKitSizes] size of this toggle.
  final UIKitSizes? toggleSize;

  /// the height of the toggle is iconSize / 2
  /// and the width of the toggle is equal to iconSize
  /// secondaryRadius is the radius used for the actual toggle

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> toggleIsOn$ = useState(false);
    final ValueNotifier<bool> isActive = useState(false);
    final state$ = useState<UIKitState>(
        onTap == null ? UIKitState.disabled : UIKitState.defaultState);
    final isHovered$ = useState(false);
    final theme$ = 
        UIKitTheme.of(context).toggleSwitchListTileThemeData;
    final colors = findColors(theme$);
    final size = findSize(theme$);
    final shadows = findShadows(theme$);

    useEffect(() {
      if (onTap == null) {
        state$.value = UIKitState.disabled;
      } else {
        state$.value = UIKitState.defaultState;
      }
      return null;
    }, [onTap == null]);

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
        if (onTap != null && e.kind != PointerDeviceKind.touch) {
          state$.value = UIKitState.hover;
          isHovered$.value = true;
        }
      },
      onExit: (_) {
        if (onTap != null) {
          state$.value = UIKitState.defaultState;
          isHovered$.value = false;
        }
      },
      child: GestureDetector(
        onTap: () {
          if (state$.value != UIKitState.disabled) {
            toggleIsOn$.value = !toggleIsOn$.value;
            isActive.value = !isActive.value;
            onTap?.call();
            state$.value =
                isHovered$.value ? UIKitState.hover : UIKitState.defaultState;
          }
        },
        onTapUp: (_) {
          if (onTap != null) {
            state$.value =
                isHovered$.value ? UIKitState.hover : UIKitState.defaultState;
          }
        },
        onTapCancel: () {
          if (onTap != null) {
            state$.value =
                isHovered$.value ? UIKitState.hover : UIKitState.defaultState;
          }
        },
        onTapDown: (_) {
          if (onTap != null) {
            state$.value = UIKitState.focused;
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: size.padding,
          decoration: BoxDecoration(
            color: colorHelper.backgroundColor,
            borderRadius: BorderRadius.circular(size.borderRadius ?? 8),
            border: Border.all(
              strokeAlign: BorderSide.strokeAlignInside,
              width: size.borderSize ?? 0,
              color: colorHelper.borderColor ?? Colors.transparent,
            ),
            boxShadow: colorHelper.shadows,
          ),
          height: size.height,
          width: size.width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (leading != null) ...[
                DefaultTextStyle(
                  style: toggleIsOn$.value
                      ? size.focusedLabelStyle
                      ?.copyWith(color: colorHelper.contentColor) ??
                      TextStyle(color: colorHelper.contentColor)
                      : size.labelStyle
                      ?.copyWith(color: colorHelper.contentColor) ??
                      TextStyle(color: colorHelper.contentColor),
                  child: leading!,
                ),
                SizedBox(width: size.spacing),
              ],
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  color: colors.activeBackgroundColor,
                  borderRadius: BorderRadius.circular(
                    size.secondaryRadius ?? 18,
                  ),
                ),
                height: size.iconSize ?? 30 / 2,
                width: size.iconSize,
                //color: colorHelper.secondaryContentColor,

                child: Row(
                  mainAxisAlignment: toggleIsOn$.value
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: colors.activeContentColor,
                        borderRadius: BorderRadius.circular(
                          size.secondaryRadius ?? 18,
                        ),
                      ),
                      height: size.iconSize! / 2,
                      width: size.iconSize! / 2,
                    )
                  ],
                ),
              ),
              if (trailing != null) ...[
                SizedBox(width: size.spacing),
                DefaultTextStyle(
                  style: toggleIsOn$.value
                      ? size.focusedLabelStyle
                      ?.copyWith(color: colorHelper.contentColor) ??
                      TextStyle(color: colorHelper.contentColor)
                      : size.labelStyle
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

  UIKitColorScheme findColors(UIKitToggleSwitchListTileThemeData themeData) {
    UIKitColorScheme colorScheme;
    if (this.colorScheme != null) {
      colorScheme = this.colorScheme!;
    } else {
      colorScheme = themeData.colorScheme;
    }
    return colorScheme;
  }

  UIKitShadowScheme findShadows(UIKitToggleSwitchListTileThemeData themeData) {
    UIKitShadowScheme shadowScheme;
    if (this.shadowScheme != null) {
      shadowScheme = this.shadowScheme!;
    } else {
      shadowScheme = themeData.shadowScheme;
    }
    return shadowScheme;
  }

  UIKitSizeScheme findSize(UIKitToggleSwitchListTileThemeData themeData) {
    UIKitSizeScheme sizeScheme;
    if (this.sizeScheme != null) {
      sizeScheme = this.sizeScheme!;
      //if the icon size is null set 60 as default
      sizeScheme.iconSize ??= 60;
    } else {
      switch (toggleSize) {
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