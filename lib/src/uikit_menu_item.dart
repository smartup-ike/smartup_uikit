import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smartup_uikit/src/helpers/uikit_shadow_scheme.dart';
import 'helpers/uikit_color_scheme.dart';
import 'helpers/uikit_size_scheme.dart';
import 'uikit_icon_theme.dart';

class UIKitMenuItem extends HookWidget {
  const UIKitMenuItem({
    super.key,
    this.icon,
    this.label,
    required this.isActive,
    required this.isExpanded,
    this.sizeScheme,
    this.colorScheme,
    this.shadowScheme,
  });

  final Widget? icon;
  final Widget? label;
  final bool isExpanded;
  final bool isActive;
  final UIKitSizeScheme? sizeScheme;
  final UIKitColorScheme? colorScheme;
  final UIKitShadowScheme? shadowScheme;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: isActive
          ? colorScheme?.activeBackgroundColor ?? Colors.transparent
          : colorScheme?.defaultBackgroundColor ?? Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            UIKitIconTheme(
              color: isActive
                  ? colorScheme?.activeContentColor
                  : colorScheme?.defaultContentColor,
              size: sizeScheme?.iconSize,
              child: icon ?? const SizedBox(),
            ),
            if (isExpanded) ...[
              const SizedBox(width: 8),
              label ?? const SizedBox(),
            ],
          ],
        ),
      ),
    );
  }
}
