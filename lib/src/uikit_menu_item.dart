import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'helpers/uikit_helper_functions.dart';
import 'helpers/uikit_shadow_scheme.dart';
import 'helpers/uikit_states.dart';
import 'helpers/uikit_color_scheme.dart';
import 'helpers/uikit_size_scheme.dart';
import 'theme/uikit_theme.dart';
import 'helpers/uikit_icon_theme.dart';

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

    final themeData$ = useState(UIKitTheme.of(context).menuItemThemeData);
    final colors$ = useState(define(colorScheme, themeData$.value.colorScheme));
    final size$ = useState(define(sizeScheme, themeData$.value.sizeScheme));
    final shadows$ =
        useState(define(shadowScheme, themeData$.value.shadowScheme));

    useEffect(() {
      state$.value = isActive ? UIKitState.active : UIKitState.defaultState;
      return;
    }, [isActive]);

    final colorHelper = findStateAttributes(
      colors$.value,
      shadows$.value,
      state$.value,
    );

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onHover: (e) {
        if (!isActive && e.kind != PointerDeviceKind.touch) {
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
          height: size$.value.height,
          duration: const Duration(milliseconds: 200),
          padding: size$.value.padding,
          decoration: BoxDecoration(
            color: colorHelper.backgroundColor,
            borderRadius: BorderRadius.circular(size$.value.borderRadius ?? 8),
            border: Border.all(
              color: colorHelper.borderColor ?? Colors.transparent,
              width: size$.value.borderSize ?? 0,
            ),
            boxShadow: colorHelper.shadows,
          ),
          child: Row(
            children: [
              UIKitIconTheme(
                color: colorHelper.contentColor,
                size: size$.value.leadingSize,
                child: icon ?? const SizedBox(),
              ),
              if (isExpanded) ...[
                SizedBox(width: size$.value.spacing),
                DefaultTextStyle(
                  style: size$.value.labelStyle
                          ?.copyWith(color: colorHelper.contentColor) ??
                      TextStyle(color: colorHelper.contentColor),
                  child: label ?? const Text('Label'),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
