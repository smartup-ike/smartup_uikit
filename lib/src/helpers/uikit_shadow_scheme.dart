import 'package:flutter/material.dart';

class UIKitShadowScheme {
  factory UIKitShadowScheme({
    List<BoxShadow>? defaultShadow,
    List<BoxShadow>? hoverShadow,
    List<BoxShadow>? focusedShadow,
    List<BoxShadow>? activeShadow,
    List<BoxShadow>? disabledShadow,
    List<BoxShadow>? errorShadow,
  }) {
    return UIKitShadowScheme._(
      defaultShadow: defaultShadow,
      hoverShadow: hoverShadow,
      focusedShadow: focusedShadow,
      activeShadow: activeShadow,
      disabledShadow: disabledShadow,
      errorShadow: errorShadow,
    );
  }

  UIKitShadowScheme._({
    this.defaultShadow,
    this.hoverShadow,
    this.focusedShadow,
    this.activeShadow,
    this.disabledShadow,
    this.errorShadow,
  });

  UIKitShadowScheme.defaultScheme() {
    defaultShadow = [];
    hoverShadow = [];
    focusedShadow = [];
    activeShadow = [];
    disabledShadow = [];
    errorShadow = [];
  }

  UIKitShadowScheme copyWith({
    List<BoxShadow>? defaultShadow,
    List<BoxShadow>? hoverShadow,
    List<BoxShadow>? focusedShadow,
    List<BoxShadow>? activeShadow,
    List<BoxShadow>? disabledShadow,
    List<BoxShadow>? errorShadow,
  }) {
    return UIKitShadowScheme._(
      defaultShadow: defaultShadow ?? this.defaultShadow,
      hoverShadow: hoverShadow ?? this.hoverShadow,
      focusedShadow: focusedShadow ?? this.focusedShadow,
      activeShadow: activeShadow ?? this.activeShadow,
      disabledShadow: disabledShadow ?? this.disabledShadow,
      errorShadow: errorShadow ?? this.errorShadow,
    );
  }

  List<BoxShadow>? defaultShadow;
  List<BoxShadow>? hoverShadow;
  List<BoxShadow>? focusedShadow;
  List<BoxShadow>? activeShadow;
  List<BoxShadow>? disabledShadow;
  List<BoxShadow>? errorShadow;
}
