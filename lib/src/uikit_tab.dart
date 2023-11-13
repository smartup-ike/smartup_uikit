import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'helpers/uikit_helper_functions.dart';
import 'helpers/uikit_shadow_scheme.dart';
import 'helpers/uikit_color_scheme.dart';
import 'helpers/uikit_size_scheme.dart';
import 'helpers/uikit_states.dart';
import 'theme/uikit_theme.dart';
import 'helpers/uikit_icon_theme.dart';

enum UIKitTabType { page, line }

class UIKitTab extends HookWidget {
  const UIKitTab({
    super.key,
    this.leading,
    this.label,
    this.trailing,
    this.onTap,
    required this.isActive,
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
    this.onTap,
    required this.isActive,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
  })  : tabType = UIKitTabType.page,
        trailing = null;

  const UIKitTab.line({
    super.key,
    this.leading,
    this.label,
    this.trailing,
    this.onTap,
    required this.isActive,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
  }) : tabType = UIKitTabType.line;

  /// [Widget]
  /// Leftmost widget of this tab.
  final Widget? leading;

  /// [Widget]
  /// Middle widget of this tab.
  final Widget? label;

  /// [Widget]
  /// Rightmost widget of this tab.
  final Widget? trailing;

  /// [VoidCallback] that is called when widget is tapped.
  final VoidCallback? onTap;

  /// [bool] indicating whether this tab is active. In most cases, only one tab
  /// is active at a time. Handle the logic of which tab is active in your code.
  final bool isActive;

  /// [UIKitColorScheme]
  /// If given, overwrites the apps theme.
  final UIKitColorScheme? colorScheme;

  /// [UIKitSizeScheme]
  /// If given, overwrites the apps theme.
  final UIKitSizeScheme? sizeScheme;

  /// [UIKitShadowScheme]
  /// If given, overwrites the apps theme.
  final UIKitShadowScheme? shadowScheme;

  /// [UIKitTabType]
  /// Must be null. Use one of the named constructors to set it to either
  /// page or line for the corresponding look.
  final UIKitTabType? tabType;

  @override
  Widget build(BuildContext context) {
    final state$ = useState<UIKitState>(
      onTap == null
          ? UIKitState.disabled
          : isActive
              ? UIKitState.active
              : UIKitState.defaultState,
    );
    final isHovered$ = useState(false);
    final themeData = UIKitTheme.of(context).tabThemeData;
    final colors = tabType == UIKitTabType.line
        ? define(colorScheme, themeData.lineTabColorScheme)
        : define(colorScheme, themeData.pageTabColorScheme);
    final size = tabType == UIKitTabType.line
        ? define(sizeScheme, themeData.lineTabSizeScheme)
        : define(sizeScheme, themeData.pageTabSizeScheme);
    final shadows = tabType == UIKitTabType.line
        ? define(shadowScheme, themeData.lineTabShadowScheme)
        : define(shadowScheme, themeData.pageTabShadowScheme);

    useEffect(() {
      state$.value = onTap == null
          ? UIKitState.disabled
          : isActive
              ? UIKitState.active
              : UIKitState.defaultState;
      return;
    }, [isActive]);

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
        if(!isActive)
          {
            if (onTap != null && e.kind != PointerDeviceKind.touch) {
              state$.value = UIKitState.hover;
              isHovered$.value = true;
            }
          }
      },
      onExit: (_) {
        if (onTap != null) {
          state$.value = isActive ? UIKitState.active : UIKitState.defaultState;
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
                : isActive
                    ? UIKitState.active
                    : UIKitState.defaultState;
          }
        },
        onTapCancel: () {
          if (onTap != null) {
            state$.value = isHovered$.value
                ? UIKitState.hover
                : isActive
                    ? UIKitState.active
                    : UIKitState.defaultState;
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: size.padding,
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
            color: colorHelper.backgroundColor,
            borderRadius: tabType == UIKitTabType.page
                ? BorderRadius.circular(size.borderRadius ?? 8)
                : null,
            boxShadow: colorHelper.shadows,
            border: tabType == UIKitTabType.page
                ? Border.all(
                    color: colorHelper.borderColor ?? Colors.transparent,
                    width: size.borderSize ?? 1,
                  )
                : Border(
                    bottom: BorderSide(
                      color: colorHelper.borderColor ?? Colors.transparent,
                      width: isActive == true
                          ? (size.borderSize ?? 1) * 2
                          : size.borderSize ?? 1,
                    ),
                  ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (leading != null) ...[
                UIKitIconTheme(
                  color: colorHelper.secondaryContentColor,
                  size: size.leadingSize,
                  child: leading!,
                ),
                SizedBox(width: size.spacing),
              ],
              DefaultTextStyle(
                style: state$.value == UIKitState.active
                    ? size.focusedLabelStyle
                            ?.copyWith(color: colorHelper.contentColor) ??
                        TextStyle(color: colorHelper.contentColor)
                    : size.labelStyle
                            ?.copyWith(color: colorHelper.contentColor) ??
                        TextStyle(color: colorHelper.contentColor),
                child: label ?? const SizedBox(),
              ),
              if (trailing != null) ...[
                SizedBox(width: size.secondarySpacing),
                trailing!,
              ],
            ],
          ),
        ),
      ),
    );
  }
}
