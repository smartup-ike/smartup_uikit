import '../helpers/uikit_color_scheme.dart';
import '../helpers/uikit_shadow_scheme.dart';
import '../helpers/uikit_size_scheme.dart';

class UIKitCheckboxThemeData {
  final UIKitColorScheme checkedColorScheme;
  final UIKitColorScheme uncheckedColorScheme;
  final UIKitSizeScheme sizeScheme;
  final UIKitShadowScheme shadowScheme;

  const UIKitCheckboxThemeData.raw({
    required this.checkedColorScheme,
    required this.uncheckedColorScheme,
    required this.sizeScheme,
    required this.shadowScheme,
  });

  factory UIKitCheckboxThemeData({
    UIKitColorScheme? checkedColorScheme,
    UIKitColorScheme? uncheckedColorScheme,
    UIKitSizeScheme? sizeScheme,
    UIKitShadowScheme? shadowScheme,
  }) {
    checkedColorScheme ??= UIKitColorScheme.defaultScheme();
    uncheckedColorScheme ??= UIKitColorScheme.defaultScheme();
    sizeScheme ??= UIKitSizeScheme.defaultScheme();
    shadowScheme ??= UIKitShadowScheme.defaultScheme();

    return UIKitCheckboxThemeData.raw(
      checkedColorScheme: checkedColorScheme,
      uncheckedColorScheme: uncheckedColorScheme,
      sizeScheme: sizeScheme,
      shadowScheme: shadowScheme,
    );
  }

  UIKitCheckboxThemeData copyWith({
    UIKitColorScheme? checkedColorScheme,
    UIKitColorScheme? uncheckedColorScheme,
    UIKitSizeScheme? sizeScheme,
    UIKitShadowScheme? shadowScheme,
  }) {
    return UIKitCheckboxThemeData.raw(
      checkedColorScheme: checkedColorScheme ?? this.checkedColorScheme,
      uncheckedColorScheme: uncheckedColorScheme ?? this.uncheckedColorScheme,
      sizeScheme: sizeScheme ?? this.sizeScheme,
      shadowScheme: shadowScheme ?? this.shadowScheme,
    );
  }
}
