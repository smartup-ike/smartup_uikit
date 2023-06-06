import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smartup_uikit/src/theme/UIKitCheckBoxListTileThemeData.dart';
import 'helpers/uikit_helper_functions.dart';
import 'helpers/uikit_sizes.dart';
import 'helpers/uikit_color_scheme.dart';
import 'helpers/uikit_states.dart';
import 'helpers/uikit_size_scheme.dart';
import 'helpers/uikit_shadow_scheme.dart';
import 'theme/uikit_button_theme_data.dart';
import 'theme/uikit_theme.dart';
import 'helpers/uikit_icon_theme.dart';

/// [UIKitCheckBoxListTile] is a checkbox that can have a leading label [Widget] or a trailing label [Widget]
///
/// * Recommended type for label [Text]
///

// enum UIKitCheckBoxListTileType {
//   leading,
//   trailing,
// }

class UIKitCheckBoxListTile extends StatelessWidget {
  const UIKitCheckBoxListTile.WithLeading({
    super.key,
    this.leading,
    this.onTap,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
    this.checkBoxSize,
    //this.checkBoxType,
  }) : trailing = null;

  const UIKitCheckBoxListTile.WithTrailing({
    super.key,
    this.trailing,
    this.onTap,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
    this.checkBoxSize,
    //this.checkBoxType,
  }) : leading = null;

  /// Type of the button [UIKitButtonType]
  ///
  /// Use those named constructors to change the checkBoxType
  /// * leading
  /// * trailing
  //final UIKitCheckBoxListTileType? checkBoxType;

  /// Function that is called on tile tap.
  ///
  /// Set onTap = null if the checkbox-ListTile is disabled
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

  /// [UIKitSizes] size of this checkBox.
  final UIKitSizes? checkBoxSize;

  @override
  Widget build(BuildContext context) {
    final state$ = useState<UIKitState>(
        onTap == null ? UIKitState.disabled : UIKitState.defaultState);
    final isHovered$ = useState(false);
    final theme$ =
        useState<UIKitCheckBoxListTileThemeData>(UIKitTheme.of(context).checkboxThemeData);
    final colors$ = useState<UIKitColorScheme>(findColors(theme$.value));
    final size$ = useState<UIKitSizeScheme>(findSize(theme$.value));
    final shadows$ = useState<UIKitShadowScheme>(findShadows(theme$.value));

    return MouseRegion(child: ListTile());
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