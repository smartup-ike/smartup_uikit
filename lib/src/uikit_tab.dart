import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'helpers/uikit_helper_functions.dart';
import 'helpers/uikit_shadow_scheme.dart';
import 'helpers/uikit_color_scheme.dart';
import 'helpers/uikit_size_scheme.dart';
import 'helpers/uikit_states.dart';
import 'theme/uikit_theme.dart';
import 'uikit_icon_theme.dart';

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
  })  : tabType = UIKitTabType.line,
        assert(
          (leading == null) ^ (trailing == null),
          'This can either have a leading or trailing widget, but not both!',
        );

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
    final themeData$ = useState(UIKitTheme.of(context).tabThemeData);
    final colors$ = useState(
      tabType == UIKitTabType.line
          ? define(colorScheme, themeData$.value.lineTabColorScheme)
          : define(colorScheme, themeData$.value.pageTabColorScheme),
    );
    final size$ = useState(
      tabType == UIKitTabType.line
          ? define(sizeScheme, themeData$.value.lineTabSizeScheme)
          : define(sizeScheme, themeData$.value.pageTabSizeScheme),
    );
    final shadows$ = useState(
      tabType == UIKitTabType.line
          ? define(shadowScheme, themeData$.value.lineTabShadowScheme)
          : define(shadowScheme, themeData$.value.pageTabShadowScheme),
    );

    useEffect(() {
      state$.value = onTap == null
          ? UIKitState.disabled
          : isActive
              ? UIKitState.active
              : UIKitState.defaultState;
      return;
    }, [isActive]);

    Color? backgroundColor;
    Color? contentColor;
    Color? secondaryContentColor;
    Color? borderColor;
    List<BoxShadow>? shadows;

    switch (state$.value) {
      case UIKitState.defaultState:
        backgroundColor = colors$.value.defaultBackgroundColor;
        contentColor = colors$.value.defaultContentColor;
        secondaryContentColor = colors$.value.defaultSecondaryContentColor;
        borderColor = colors$.value.defaultBorderColor;
        shadows = shadows$.value.defaultShadow;
        break;
      case UIKitState.hover:
        backgroundColor = colors$.value.hoverBackgroundColor;
        contentColor = colors$.value.hoverContentColor;
        secondaryContentColor = colors$.value.hoverSecondaryContentColor;
        borderColor = colors$.value.hoverBorderColor;
        shadows = shadows$.value.hoverShadow;
        break;
      case UIKitState.focused:
        backgroundColor = colors$.value.focusedBackgroundColor;
        contentColor = colors$.value.focusedContentColor;
        secondaryContentColor = colors$.value.focusedSecondaryContentColor;
        borderColor = colors$.value.focusedBorderColor;
        shadows = shadows$.value.focusedShadow;
        break;
      case UIKitState.active:
        backgroundColor = colors$.value.activeBackgroundColor;
        contentColor = colors$.value.activeContentColor;
        secondaryContentColor = colors$.value.activeSecondaryContentColor;
        borderColor = colors$.value.activeBorderColor;
        shadows = shadows$.value.activeShadow;
        break;
      case UIKitState.disabled:
        backgroundColor = colors$.value.disabledBackgroundColor;
        contentColor = colors$.value.disabledContentColor;
        secondaryContentColor = colors$.value.disabledSecondaryContentColor;
        borderColor = colors$.value.disabledBorderColor;
        shadows = shadows$.value.disabledShadow;
        break;
      default:
        break;
    }

    return MouseRegion(
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
          padding: size$.value.padding,
          height: size$.value.height,
          width: size$.value.width,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: tabType == UIKitTabType.page
                ? BorderRadius.circular(size$.value.borderRadius ?? 8)
                : null,
            boxShadow: shadows,
            border: Border(
              bottom: BorderSide(
                color: borderColor ?? Colors.transparent,
                width: size$.value.borderSize ?? 1,
              ),
              // top: BorderSide(
              //   color: tabType == UIKitTabType.line &&
              //           state$.value == UIKitState.focused
              //       ? borderColor ?? Colors.transparent
              //       : Colors.transparent,
              //   width: size$.value.borderSize ?? 1,
              // ),
              // left: BorderSide(
              //   color: tabType == UIKitTabType.line &&
              //           state$.value == UIKitState.focused
              //       ? borderColor ?? Colors.transparent
              //       : Colors.transparent,
              //   width: size$.value.borderSize ?? 1,
              // ),
              // right: BorderSide(
              //   color: tabType == UIKitTabType.line &&
              //           state$.value == UIKitState.focused
              //       ? borderColor ?? Colors.transparent
              //       : Colors.transparent,
              //   width: size$.value.borderSize ?? 1,
              // ),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (leading != null) ...[
                UIKitIconTheme(
                  color: secondaryContentColor,
                  size: size$.value.leadingSize,
                  child: leading!,
                ),
                SizedBox(width: size$.value.spacing),
              ],
              DefaultTextStyle(
                style: size$.value.labelStyle?.copyWith(color: contentColor) ??
                    TextStyle(color: contentColor),
                child: label ?? const SizedBox(),
              ),
              if (trailing != null) ...[
                SizedBox(width: size$.value.secondarySpacing),
                trailing!,
              ],
            ],
          ),
        ),
      ),
    );
  }
}
