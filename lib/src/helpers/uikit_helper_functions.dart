import 'package:smartup_uikit/src/helpers/uikit_states.dart';
import 'uikit_color_scheme.dart';
import 'uikit_color_helper.dart';
import 'uikit_shadow_scheme.dart';

T define<T>(T? passedData, T themeData) {
  T temp;
  if (passedData != null) {
    temp = passedData;
  } else {
    temp = themeData;
  }
  return temp;
}

ColorHelper findStateAttributes(
  UIKitColorScheme colorScheme,
  UIKitShadowScheme shadowScheme,
  UIKitState state,
) {
  ColorHelper colorHelper = ColorHelper();

  switch (state) {
    case UIKitState.hover:
      colorHelper.backgroundColor = colorScheme.hoverBackgroundColor;
      colorHelper.contentColor = colorScheme.hoverContentColor;
      colorHelper.secondaryContentColor =
          colorScheme.hoverSecondaryContentColor;
      colorHelper.borderColor = colorScheme.hoverBorderColor;
      colorHelper.shadows = shadowScheme.hoverShadow;
      break;
    case UIKitState.focused:
      colorHelper.backgroundColor = colorScheme.focusedBackgroundColor;
      colorHelper.contentColor = colorScheme.focusedContentColor;
      colorHelper.secondaryContentColor =
          colorScheme.focusedSecondaryContentColor;
      colorHelper.borderColor = colorScheme.focusedBorderColor;
      colorHelper.shadows = shadowScheme.focusedShadow;
      break;
    case UIKitState.active:
      colorHelper.backgroundColor = colorScheme.activeBackgroundColor;
      colorHelper.contentColor = colorScheme.activeContentColor;
      colorHelper.secondaryContentColor =
          colorScheme.activeSecondaryContentColor;
      colorHelper.borderColor = colorScheme.activeBorderColor;
      colorHelper.shadows = shadowScheme.activeShadow;
      break;
    case UIKitState.disabled:
      colorHelper.backgroundColor = colorScheme.disabledBackgroundColor;
      colorHelper.contentColor = colorScheme.disabledContentColor;
      colorHelper.secondaryContentColor =
          colorScheme.disabledSecondaryContentColor;
      colorHelper.borderColor = colorScheme.disabledBorderColor;
      colorHelper.shadows = shadowScheme.disabledShadow;
      break;
    case UIKitState.error:
      colorHelper.backgroundColor = colorScheme.errorBackgroundColor;
      colorHelper.contentColor = colorScheme.errorContentColor;
      colorHelper.secondaryContentColor =
          colorScheme.errorSecondaryContentColor;
      colorHelper.borderColor = colorScheme.errorBorderColor;
      colorHelper.shadows = shadowScheme.errorShadow;
      break;
    default:
      colorHelper.backgroundColor = colorScheme.defaultBackgroundColor;
      colorHelper.contentColor = colorScheme.defaultContentColor;
      colorHelper.secondaryContentColor =
          colorScheme.defaultSecondaryContentColor;
      colorHelper.borderColor = colorScheme.defaultBorderColor;
      colorHelper.shadows = shadowScheme.defaultShadow;
      break;
  }
  return colorHelper;
}
