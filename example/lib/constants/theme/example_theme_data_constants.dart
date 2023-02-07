import 'package:example/constants/example_colors.dart';
import 'package:flutter/material.dart';
import 'package:smartup_uikit/smartup_uikit.dart';

UIKitThemeData kitThemeData = UIKitThemeData(
    buttonThemeData: UIKitButtonThemeData(
  primaryColors: UIKitColorScheme(
    defaultBackgroundColor: ExampleColors.primary700,
    hoverBackgroundColor: ExampleColors.primary800,
    focusedBackgroundColor: ExampleColors.primary800,
    activeBackgroundColor: ExampleColors.primary800,
    disabledBackgroundColor: ExampleColors.secondary50,
    defaultBorderColor: Colors.transparent,
    hoverBorderColor: Colors.transparent,
    focusedBorderColor: Colors.transparent,
    activeBorderColor: Colors.transparent,
    disabledBorderColor: Colors.transparent,
    defaultContentColor: ExampleColors.secondaryW,
    hoverContentColor: ExampleColors.secondaryW,
    focusedContentColor: ExampleColors.secondaryW,
    activeContentColor: ExampleColors.secondaryW,
    disabledContentColor: ExampleColors.secondary300,
  ),
  secondaryColors: UIKitColorScheme(
    defaultBackgroundColor: ExampleColors.primary50,
    hoverBackgroundColor: ExampleColors.primary100,
    focusedBackgroundColor: ExampleColors.primary100,
    activeBackgroundColor: ExampleColors.primary100,
    disabledBackgroundColor: ExampleColors.secondary50,
    defaultBorderColor: Colors.transparent,
    hoverBorderColor: Colors.transparent,
    focusedBorderColor: Colors.transparent,
    activeBorderColor: Colors.transparent,
    disabledBorderColor: Colors.transparent,
    defaultContentColor: ExampleColors.primary700,
    hoverContentColor: ExampleColors.primary700,
    focusedContentColor: ExampleColors.primary900,
    activeContentColor: ExampleColors.primary900,
    disabledContentColor: ExampleColors.primary700,
  ),
  secondaryWhiteColors: UIKitColorScheme(
    defaultBackgroundColor: ExampleColors.secondaryW,
    hoverBackgroundColor: ExampleColors.secondaryW,
    focusedBackgroundColor: ExampleColors.secondaryW,
    activeBackgroundColor: ExampleColors.secondaryW,
    disabledBackgroundColor: ExampleColors.secondaryW,
    defaultBorderColor: Colors.transparent,
    hoverBorderColor: Colors.transparent,
    focusedBorderColor: Colors.transparent,
    activeBorderColor: Colors.transparent,
    disabledBorderColor: Colors.transparent,
    defaultContentColor: ExampleColors.primary700,
    hoverContentColor: ExampleColors.primary700,
    focusedContentColor: ExampleColors.primary900,
    activeContentColor: ExampleColors.primary900,
    disabledContentColor: ExampleColors.primary700,
  ),
  tertiaryColors: UIKitColorScheme(
    defaultBackgroundColor: ExampleColors.secondary50,
    hoverBackgroundColor: ExampleColors.secondary50,
    focusedBackgroundColor: ExampleColors.secondary200,
    activeBackgroundColor: ExampleColors.secondary50,
    disabledBackgroundColor: ExampleColors.secondary50,
    defaultBorderColor: Colors.transparent,
    hoverBorderColor: Colors.transparent,
    focusedBorderColor: Colors.transparent,
    activeBorderColor: Colors.transparent,
    disabledBorderColor: Colors.transparent,
    defaultContentColor: ExampleColors.secondary700,
    hoverContentColor: ExampleColors.secondary800,
    focusedContentColor: ExampleColors.secondary800,
    activeContentColor: ExampleColors.secondaryK,
    disabledContentColor: ExampleColors.secondary700,
  ),
  outlineColors: UIKitColorScheme(
    defaultBackgroundColor: ExampleColors.secondaryW,
    hoverBackgroundColor: ExampleColors.secondaryW,
    focusedBackgroundColor: ExampleColors.primary50,
    activeBackgroundColor: ExampleColors.primary50,
    disabledBackgroundColor: ExampleColors.secondaryW,
    defaultBorderColor: ExampleColors.primary700,
    hoverBorderColor: ExampleColors.primary800,
    focusedBorderColor: ExampleColors.primary900,
    activeBorderColor: ExampleColors.primary800,
    disabledBorderColor: ExampleColors.primary700.withOpacity(0.3),
    defaultContentColor: ExampleColors.primary700,
    hoverContentColor: ExampleColors.primary800,
    focusedContentColor: ExampleColors.primary900,
    activeContentColor: ExampleColors.primary800,
    disabledContentColor: ExampleColors.primary700.withOpacity(0.3),
  ),
  ghostColors: UIKitColorScheme(
    defaultBackgroundColor: Colors.transparent,
    hoverBackgroundColor: Colors.transparent,
    focusedBackgroundColor: Colors.transparent,
    activeBackgroundColor: Colors.transparent,
    disabledBackgroundColor: Colors.transparent,
    defaultBorderColor: Colors.transparent,
    hoverBorderColor: Colors.transparent,
    focusedBorderColor: ExampleColors.secondary300,
    activeBorderColor: Colors.transparent,
    disabledBorderColor: Colors.transparent,
    defaultContentColor: ExampleColors.primary700,
    hoverContentColor: ExampleColors.primary800,
    focusedContentColor: ExampleColors.primary700,
    activeContentColor: ExampleColors.primary900,
    disabledContentColor: ExampleColors.primary700.withOpacity(0.3),
  ),
  solidIconColors: UIKitColorScheme(
    defaultBackgroundColor: ExampleColors.primary700,
    hoverBackgroundColor: ExampleColors.primary800,
    focusedBackgroundColor: ExampleColors.primary800,
    activeBackgroundColor: ExampleColors.primary800,
    disabledBackgroundColor: ExampleColors.primary700.withOpacity(0.3),
    defaultBorderColor: ExampleColors.primary800,
    hoverBorderColor: ExampleColors.primary900,
    focusedBorderColor: ExampleColors.primary900,
    activeBorderColor: ExampleColors.primary900,
    disabledBorderColor: ExampleColors.primary800.withOpacity(0.3),
    defaultContentColor: ExampleColors.secondaryW,
    hoverContentColor: ExampleColors.secondaryW,
    focusedContentColor: ExampleColors.secondaryW,
    activeContentColor: ExampleColors.secondaryW,
    disabledContentColor: ExampleColors.secondaryW.withOpacity(0.3),
  ),
  ghostIconColors: UIKitColorScheme(
    defaultBackgroundColor: Colors.transparent,
    hoverBackgroundColor: ExampleColors.primary50,
    focusedBackgroundColor: ExampleColors.primary100,
    activeBackgroundColor: ExampleColors.primary100,
    disabledBackgroundColor: ExampleColors.primary700.withOpacity(0.3),
    defaultBorderColor: Colors.transparent,
    hoverBorderColor: Colors.transparent,
    focusedBorderColor: Colors.transparent,
    activeBorderColor: Colors.transparent,
    disabledBorderColor: Colors.transparent,
    defaultContentColor: ExampleColors.primary700,
    hoverContentColor: ExampleColors.primary800,
    focusedContentColor: ExampleColors.primary700,
    activeContentColor: ExampleColors.primary900,
    disabledContentColor: ExampleColors.primary700.withOpacity(0.3),
  ),
));

UIKitTextInputThemeData kitTextInputThemeData = UIKitTextInputThemeData(
  filledInputcolorScheme: UIKitColorScheme(
    defaultBackgroundColor: ExampleColors.secondary50,
    hoverBackgroundColor: ExampleColors.secondary100,
    focusedBackgroundColor: ExampleColors.secondaryW,
    activeBackgroundColor: ExampleColors.secondary50,
    disabledBackgroundColor: ExampleColors.secondary30,
    defaultBorderColor: ExampleColors.primary800,
    hoverBorderColor: ExampleColors.primary900,
    focusedBorderColor: ExampleColors.primary900,
    activeBorderColor: ExampleColors.primary900,
    disabledBorderColor: ExampleColors.primary800.withOpacity(0.3),
    defaultContentColor: ExampleColors.secondaryW,
    hoverContentColor: ExampleColors.secondaryW,
    focusedContentColor: ExampleColors.secondaryW,
    activeContentColor: ExampleColors.secondaryW,
    disabledContentColor: ExampleColors.secondaryW.withOpacity(0.3),
  ),
  lineInputcolorScheme: UIKitColorScheme(),
  filledSearchcolorScheme: UIKitColorScheme(),
  lineSearchcolorScheme: UIKitColorScheme(),
  inputSizeScheme: UIKitSizeScheme(),
  searchSizeScheme: UIKitSizeScheme(),
  shadowScheme: UIKitShadowScheme(),
);
