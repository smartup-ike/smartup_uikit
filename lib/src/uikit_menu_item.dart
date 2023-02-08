import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'helpers/uikit_shadow_scheme.dart';
import 'helpers/uikit_states.dart';
import 'theme/uikit_menu_item_theme_data.dart';
import 'helpers/uikit_color_scheme.dart';
import 'helpers/uikit_size_scheme.dart';
import 'theme/uikit_theme.dart';
import 'uikit_icon_theme.dart';

class UIKitMenuItem extends HookWidget {
  const UIKitMenuItem({
    super.key,
    this.icon,
    this.label,
    this.onTap,
    required this.isActive,
    required this.isExpanded,
    this.sizeScheme,
    this.colorScheme,
    this.shadowScheme,
  });

  /// [Widget] that is displayed first.
  /// If it is an SVG then it takes its properties from the theme.
  final Widget? icon;

  /// [Widget] that is displayed second and only if the item is expanded.
  /// If it contains [Text] then its properties are set by the theme.
  final Widget? label;

  /// [VoidCallback] that is called when the widget is tapped.
  /// Handle the logic of which item is active in your code.
  final VoidCallback? onTap;

  /// [bool] indicating if this item is expanded.
  /// If it is, then [label] is showed.
  final bool isExpanded;

  /// [bool] indicating if this item is active.
  /// Usually only one menu item should be active at a time.
  final bool isActive;

  /// [UIKitSizeScheme]
  /// If given, overwrites the apps theme.
  final UIKitSizeScheme? sizeScheme;

  /// [UIKitColorScheme]
  /// If given, verwrites the apps theme.
  final UIKitColorScheme? colorScheme;

  /// [UIKitShadowScheme]
  /// If given, verwrites the apps theme.
  final UIKitShadowScheme? shadowScheme;

  @override
  Widget build(BuildContext context) {
    final state$ =
        useState(isActive ? UIKitState.active : UIKitState.defaultState);

    final themeData = UIKitTheme.of(context).menuItemThemeData;

    UIKitColorScheme itemColors = _defineColors(themeData);
    UIKitSizeScheme itemSize = _defineSize(themeData);
    UIKitShadowScheme itemShadow = _defineShadows(themeData);

    Color? backgroundColor;
    Color? contentColor;
    Color? borderColor;
    List<BoxShadow>? shadows;

    switch (state$.value) {
      case UIKitState.defaultState:
        backgroundColor = itemColors.defaultBackgroundColor;
        contentColor = itemColors.defaultContentColor;
        borderColor = itemColors.defaultBorderColor;
        shadows = itemShadow.defaultShadow;
        break;
      case UIKitState.hover:
        backgroundColor = itemColors.hoverBackgroundColor;
        contentColor = itemColors.hoverContentColor;
        borderColor = itemColors.hoverBorderColor;
        shadows = itemShadow.hoverShadow;
        break;
      case UIKitState.focused:
        backgroundColor = itemColors.focusedBackgroundColor;
        contentColor = itemColors.focusedContentColor;
        borderColor = itemColors.focusedBorderColor;
        shadows = itemShadow.focusedShadow;
        break;
      case UIKitState.active:
        backgroundColor = itemColors.activeBackgroundColor;
        contentColor = itemColors.activeContentColor;
        borderColor = itemColors.activeBorderColor;
        shadows = itemShadow.activeShadow;
        break;
      case UIKitState.disabled:
        backgroundColor = itemColors.disabledBackgroundColor;
        contentColor = itemColors.disabledContentColor;
        borderColor = itemColors.disabledBorderColor;
        shadows = itemShadow.disabledShadow;
        break;
      default:
        break;
    }

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onHover: (_) {
        if (!isActive) {
          state$.value = UIKitState.hover;
        }
      },
      onExit: (_) {
        if (!isActive) {
          state$.value = UIKitState.defaultState;
        }
      },
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: itemSize.padding ?? const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: backgroundColor ?? Colors.transparent,
            borderRadius: BorderRadius.circular(itemSize.borderRadius ?? 8),
            border: Border.all(
              color: borderColor ?? Colors.transparent,
              width: itemSize.borderSize ?? 0,
            ),
            boxShadow: shadows,
          ),
          child: Row(
            children: [
              UIKitIconTheme(
                color: contentColor,
                size: sizeScheme?.leadingSize,
                child: icon ?? const SizedBox(),
              ),
              if (isExpanded) ...[
                const SizedBox(width: 8),
                DefaultTextStyle(
                  style: itemSize.labelStyle?.copyWith(color: contentColor) ??
                      TextStyle(color: contentColor),
                  child: label ?? const SizedBox(),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  UIKitColorScheme _defineColors(UIKitMenuItemThemeData themeData) {
    UIKitColorScheme colorScheme;

    if (this.colorScheme == null) {
      colorScheme = themeData.colorScheme;
    } else {
      colorScheme = this.colorScheme!;
    }
    return colorScheme;
  }

  UIKitSizeScheme _defineSize(UIKitMenuItemThemeData themeData) {
    UIKitSizeScheme sizeScheme;

    if (this.sizeScheme == null) {
      sizeScheme = themeData.sizeScheme;
    } else {
      sizeScheme = this.sizeScheme!;
    }
    return sizeScheme;
  }

  UIKitShadowScheme _defineShadows(UIKitMenuItemThemeData themeData) {
    UIKitShadowScheme shadowScheme;

    if (this.shadowScheme == null) {
      shadowScheme = themeData.shadowScheme;
    } else {
      shadowScheme = this.shadowScheme!;
    }
    return shadowScheme;
  }
}
