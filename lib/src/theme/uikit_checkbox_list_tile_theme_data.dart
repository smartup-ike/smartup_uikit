import '../helpers/uikit_color_scheme.dart';
import '../helpers/uikit_shadow_scheme.dart';
import '../helpers/uikit_size_scheme.dart';

class UIKitCheckBoxListTileThemeData {
  final UIKitColorScheme primaryColors;
  final UIKitSizeScheme smallSize;
  final UIKitSizeScheme mediumSize;
  final UIKitSizeScheme largeSize;
  final UIKitShadowScheme primaryShadows;
  final UIKitColorScheme secondaryColors;

  const UIKitCheckBoxListTileThemeData.raw({
    required this.primaryColors,
    required this.smallSize,
    required this.mediumSize,
    required this.largeSize,
    required this.primaryShadows,
    required this.secondaryColors,
  });

  factory UIKitCheckBoxListTileThemeData({
    UIKitColorScheme? primaryColors,
    UIKitColorScheme? secondaryColors,
    UIKitSizeScheme? smallSize,
    UIKitSizeScheme? mediumSize,
    UIKitSizeScheme? largeSize,
    UIKitShadowScheme? primaryShadows,
  }) {
    // Sets default color schemes.
    primaryColors ??= UIKitColorScheme.defaultScheme();
    secondaryColors ??= UIKitColorScheme.defaultScheme();
    smallSize ??= UIKitSizeScheme.defaultScheme();
    mediumSize ??= UIKitSizeScheme.defaultScheme();
    largeSize ??= UIKitSizeScheme.defaultScheme();
    primaryShadows ??= UIKitShadowScheme.defaultScheme();

    return UIKitCheckBoxListTileThemeData.raw(
      primaryColors: primaryColors,
      secondaryColors: secondaryColors,
      smallSize: smallSize,
      mediumSize: mediumSize,
      largeSize: largeSize,
      primaryShadows: primaryShadows,
    );
  }

  UIKitCheckBoxListTileThemeData copyWith({
    UIKitColorScheme? primaryColors,
    UIKitColorScheme? secondaryColors,
    UIKitShadowScheme? primaryShadows,
    UIKitSizeScheme? smallSize,
    UIKitSizeScheme? mediumSize,
    UIKitSizeScheme? largeSize,
  }) {
    return UIKitCheckBoxListTileThemeData.raw(
      primaryColors: primaryColors ?? this.primaryColors,
      secondaryColors: secondaryColors ?? this.secondaryColors,
      primaryShadows: primaryShadows ?? this.primaryShadows,
      smallSize: smallSize ?? this.smallSize,
      mediumSize: mediumSize ?? this.mediumSize,
      largeSize: largeSize ?? this.largeSize,
    );
  }
}