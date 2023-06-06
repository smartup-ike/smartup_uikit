import '../helpers/uikit_color_scheme.dart';
import '../helpers/uikit_shadow_scheme.dart';
import '../helpers/uikit_size_scheme.dart';


class UIKitCheckBoxListTileThemeData {
  final UIKitColorScheme primaryColors;
  final UIKitSizeScheme smallSize;
  final UIKitSizeScheme mediumSize;
  final UIKitSizeScheme largeSize;
  final UIKitShadowScheme primaryShadows;

  const UIKitCheckBoxListTileThemeData.raw({
    required final UIKitColorScheme primaryColors,
    required final UIKitSizeScheme smallSize,
    required final UIKitSizeScheme mediumSize,
    required final UIKitSizeScheme largeSize,
    required final UIKitShadowScheme primaryShadows,
  });

  factory UIKitCheckBoxListTileThemeData({
    UIKitColorScheme? primaryColors,
    UIKitSizeScheme? smallSize,
    UIKitSizeScheme? mediumSize,
    UIKitSizeScheme? largeSize,
    UIKitShadowScheme? primaryShadows,
  }) {
    // Sets default color schemes.
    primaryColors ?? UIKitColorScheme.defaultScheme();
    smallSize ?? UIKitSizeScheme.defaultScheme();
    mediumSize ??= UIKitSizeScheme.defaultScheme();
    largeSize ??= UIKitSizeScheme.defaultScheme();
    primaryShadows ??= UIKitShadowScheme.defaultScheme();

    return UIKitCheckBoxListTileThemeData.raw(
      primaryColors: primaryColors,
      smallSize: smallSize,
      mediumSize: mediumSize,
      largeSize: largeSize,
      primaryShadows: primaryShadows,
    );
  }


  UIKitCheckBoxListTileThemeData copyWith({
    UIKitColorScheme? primaryColors,
    UIKitShadowScheme? primaryShadows,
    UIKitSizeScheme? smallSize,
    UIKitSizeScheme? mediumSize,
    UIKitSizeScheme? largeSize,
  }) {
    return UIKitCheckBoxListTileThemeData.raw(
      primaryColors: primaryColors ?? this.primaryColors,
      primaryShadows: primaryShadows ?? this.primaryShadows,
      smallSize: smallSize ?? this.smallSize,
      mediumSize: mediumSize ?? this.mediumSize,
      largeSize: largeSize ?? this.largeSize,
    );

  }

}