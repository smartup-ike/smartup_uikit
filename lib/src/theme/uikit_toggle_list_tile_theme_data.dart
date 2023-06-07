import '../helpers/uikit_color_scheme.dart';
import '../helpers/uikit_shadow_scheme.dart';
import '../helpers/uikit_size_scheme.dart';

class UIKitToggleListTileThemeData {
  final UIKitColorScheme primaryColors;
  final UIKitSizeScheme smallSize;
  final UIKitSizeScheme mediumSize;
  final UIKitSizeScheme largeSize;
  final UIKitShadowScheme primaryShadows;

  const UIKitToggleListTileThemeData.raw({
    required this.primaryColors,
    required this.smallSize,
    required this.mediumSize,
    required this.largeSize,
    required this.primaryShadows,
  });

  factory UIKitToggleListTileThemeData({
    UIKitColorScheme? primaryColors,
    UIKitSizeScheme? smallSize,
    UIKitSizeScheme? mediumSize,
    UIKitSizeScheme? largeSize,
    UIKitShadowScheme? primaryShadows,
  }) {
    // Sets default color schemes.
    primaryColors ??= UIKitColorScheme.defaultScheme();
    smallSize ??= UIKitSizeScheme.defaultScheme();
    mediumSize ??= UIKitSizeScheme.defaultScheme();
    largeSize ??= UIKitSizeScheme.defaultScheme();
    primaryShadows ??= UIKitShadowScheme.defaultScheme();

    return UIKitToggleListTileThemeData.raw(
      primaryColors: primaryColors,
      smallSize: smallSize,
      mediumSize: mediumSize,
      largeSize: largeSize,
      primaryShadows: primaryShadows,
    );
  }

  UIKitToggleListTileThemeData copyWith({
    UIKitColorScheme? primaryColors,
    UIKitShadowScheme? primaryShadows,
    UIKitSizeScheme? smallSize,
    UIKitSizeScheme? mediumSize,
    UIKitSizeScheme? largeSize,
  }) {
    return UIKitToggleListTileThemeData.raw(
      primaryColors: primaryColors ?? this.primaryColors,
      primaryShadows: primaryShadows ?? this.primaryShadows,
      smallSize: smallSize ?? this.smallSize,
      mediumSize: mediumSize ?? this.mediumSize,
      largeSize: largeSize ?? this.largeSize,
    );
  }
}