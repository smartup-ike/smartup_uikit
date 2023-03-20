import '../helpers/uikit_color_scheme.dart';
import '../helpers/uikit_shadow_scheme.dart';
import '../helpers/uikit_size_scheme.dart';

class UIKitCalendarButtonThemeData {
  final UIKitColorScheme colorScheme;
  final UIKitSizeScheme sizeScheme;
  final UIKitShadowScheme shadowScheme;

  const UIKitCalendarButtonThemeData.raw({
    required this.colorScheme,
    required this.sizeScheme,
    required this.shadowScheme,
  });

  factory UIKitCalendarButtonThemeData({
    UIKitColorScheme? colorScheme,
    UIKitSizeScheme? sizeScheme,
    UIKitShadowScheme? shadowScheme,
  }) {
    colorScheme ??= UIKitColorScheme.defaultScheme();
    sizeScheme ??= UIKitSizeScheme.defaultScheme();
    shadowScheme ??= UIKitShadowScheme.defaultScheme();

    return UIKitCalendarButtonThemeData.raw(
      colorScheme: colorScheme,
      sizeScheme: sizeScheme,
      shadowScheme: shadowScheme,
    );
  }

  UIKitCalendarButtonThemeData copyWith({
    UIKitColorScheme? colorScheme,
    UIKitSizeScheme? sizeScheme,
    UIKitShadowScheme? shadowScheme,
  }) {
    return UIKitCalendarButtonThemeData.raw(
      colorScheme: colorScheme ?? this.colorScheme,
      sizeScheme: sizeScheme ?? this.sizeScheme,
      shadowScheme: shadowScheme ?? this.shadowScheme,
    );
  }
}
