import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'helpers/uikit_shadow_scheme.dart';
import 'theme/uikit_tab_theme_data.dart';
import 'helpers/uikit_color_scheme.dart';
import 'helpers/uikit_size_scheme.dart';
import 'helpers/uikit_states.dart';
import 'theme/su_theme.dart';

enum UIKitTabType { page, line }

class UIKitTab extends HookWidget {
  const UIKitTab({
    super.key,
    this.leading,
    this.label,
    this.trailing,
    this.onTap,
    this.isActive,
    this.colorScheme,
    this.sizeScheme,
    this.tabType,
    this.shadowScheme,
  }) : assert(
          tabType == null,
          'tabType has to be null on default constructor. Use one of the named constructors instead.',
        );

  const UIKitTab.page({
    super.key,
    this.leading,
    this.label,
    this.trailing,
    this.onTap,
    this.isActive,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
  }) : tabType = UIKitTabType.page;

  const UIKitTab.line({
    super.key,
    this.leading,
    this.label,
    this.trailing,
    this.onTap,
    this.isActive,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
  }) : tabType = UIKitTabType.line;

  final Widget? leading;
  final Widget? label;
  final Widget? trailing;
  final VoidCallback? onTap;
  final bool? isActive;
  final UIKitColorScheme? colorScheme;
  final UIKitSizeScheme? sizeScheme;
  final UIKitShadowScheme? shadowScheme;
  final UIKitTabType? tabType;

  @override
  Widget build(BuildContext context) {
    final state$ = useState<UIKitState>(
      onTap == null
          ? UIKitState.disabled
          : isActive ?? false
              ? UIKitState.active
              : UIKitState.defaultState,
    );
    final isHovered$ = useState(false);
    final tabTheme = SUTheme.of(context).tabThemeData;

    UIKitColorScheme tabColors = _defineColors(context, tabTheme);
    UIKitSizeScheme tabSize = _defineSize(context, tabTheme);
    UIKitShadowScheme tabShadow = _defineShadow(context, tabTheme);

    Color? backgroundColor;
    Color? contentColor;
    Color? borderColor;
    List<BoxShadow>? shadows;

    switch (state$.value) {
      case UIKitState.defaultState:
        backgroundColor = tabColors.defaultBackgroundColor;
        contentColor = tabColors.defaultContentColor;
        borderColor = tabColors.defaultBorderColor;
        shadows = tabShadow.defaultShadow;
        break;
      case UIKitState.hover:
        backgroundColor = tabColors.hoverBackgroundColor;
        contentColor = tabColors.hoverContentColor;
        borderColor = tabColors.hoverBorderColor;
        shadows = tabShadow.hoverShadow;
        break;
      case UIKitState.focused:
        backgroundColor = tabColors.focusedBackgroundColor;
        contentColor = tabColors.focusedContentColor;
        borderColor = tabColors.focusedBorderColor;
        shadows = tabShadow.focusedShadow;
        break;
      case UIKitState.active:
        backgroundColor = tabColors.activeBackgroundColor;
        contentColor = tabColors.activeContentColor;
        borderColor = tabColors.activeBorderColor;
        shadows = tabShadow.activeShadow;
        break;
      case UIKitState.disabled:
        backgroundColor = tabColors.disabledBackgroundColor;
        contentColor = tabColors.disabledContentColor;
        borderColor = tabColors.disabledBorderColor;
        shadows = tabShadow.disabledShadow;
        break;
      default:
        break;
    }

    return Center(
      child: MouseRegion(
        cursor: state$.value == UIKitState.disabled
            ? SystemMouseCursors.basic
            : SystemMouseCursors.click,
        onHover: (_) {
          if (onTap != null) {
            state$.value = UIKitState.hover;
            isHovered$.value = true;
          }
        },
        onExit: (_) {
          if (onTap != null) {
            state$.value =
                isActive ?? false ? UIKitState.active : UIKitState.defaultState;
            isHovered$.value = false;
          }
        },
        child: GestureDetector(
          onTap: onTap,
          onTapDown: (_) {
            if (onTap != null) {
              state$.value = UIKitState.focused;
            }
          },
          onTapUp: (_) {
            if (onTap != null) {
              state$.value = isHovered$.value
                  ? UIKitState.hover
                  : isActive ?? false
                      ? UIKitState.active
                      : UIKitState.defaultState;
            }
          },
          onTapCancel: () {
            if (onTap != null) {
              state$.value = isHovered$.value
                  ? UIKitState.hover
                  : isActive ?? false
                      ? UIKitState.active
                      : UIKitState.defaultState;
            }
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: tabSize.padding,
            height: tabSize.height,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: tabType == UIKitTabType.page
                  ? BorderRadius.circular(tabSize.borderRadius ?? 8)
                  : state$.value == UIKitState.focused
                      ? BorderRadius.only(
                          topLeft: Radius.circular(tabSize.borderRadius ?? 8),
                          topRight: Radius.circular(tabSize.borderRadius ?? 8),
                        )
                      : null,
              boxShadow: shadows,
              border: tabType == UIKitTabType.page
                  ? Border.all(
                      color: borderColor ?? Colors.transparent,
                      width: tabSize.borderSize ?? 1,
                    )
                  : state$.value == UIKitState.focused
                      ? Border.all(
                          color: borderColor ?? Colors.transparent,
                          width: tabSize.borderSize ?? 1,
                        )
                      : Border(
                          bottom: BorderSide(
                            color: borderColor ?? Colors.transparent,
                            width: tabSize.borderSize ?? 1,
                          ),
                        ),
            ),
            child: Row(
              children: [
                if (leading != null) ...[
                  leading!,
                  SizedBox(width: tabSize.spacing),
                ],
                DefaultTextStyle(
                  style:
                      tabSize.labelTextStyle?.copyWith(color: contentColor) ??
                          TextStyle(color: contentColor ?? Colors.transparent),
                  child: label ?? const SizedBox(),
                ),
                if (trailing != null) ...[
                  SizedBox(width: tabSize.spacing),
                  trailing!,
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  UIKitColorScheme _defineColors(
    BuildContext context,
    UIKitTabThemeData tabThemeData,
  ) {
    UIKitColorScheme tabColors;

    if (colorScheme == null) {
      switch (tabType) {
        case UIKitTabType.page:
          tabColors = tabThemeData.pageTabColorScheme;
          break;
        case UIKitTabType.line:
          tabColors = tabThemeData.lineTabColorScheme;
          break;
        default:
          tabColors = tabThemeData.pageTabColorScheme;
          break;
      }
    } else {
      tabColors = colorScheme!;
    }

    return tabColors;
  }

  UIKitSizeScheme _defineSize(
    BuildContext context,
    UIKitTabThemeData tabThemeData,
  ) {
    UIKitSizeScheme tabSize;

    if (sizeScheme == null) {
      tabSize = tabThemeData.sizeScheme;
    } else {
      tabSize = sizeScheme!;
    }
    return tabSize;
  }

  UIKitShadowScheme _defineShadow(
    BuildContext context,
    UIKitTabThemeData tabThemeData,
  ) {
    UIKitShadowScheme tabShadow;

    if (shadowScheme == null) {
      tabShadow = tabThemeData.shadowScheme;
    } else {
      tabShadow = shadowScheme!;
    }
    return tabShadow;
  }
}
