import 'package:flutter/material.dart';

class UIKitShadowScheme {
  factory UIKitShadowScheme({
    List<BoxShadow>? defaultShadow,
    List<BoxShadow>? hoverShadow,
    List<BoxShadow>? focusedShadow,
    List<BoxShadow>? activeShadow,
    List<BoxShadow>? disabledShadow,
  }) {
    return UIKitShadowScheme._(
      defaultShadow: defaultShadow,
      hoverShadow: hoverShadow,
      focusedShadow: focusedShadow,
      activeShadow: activeShadow,
      disabledShadow: disabledShadow,
    );
  }

  UIKitShadowScheme._({
    this.defaultShadow,
    this.hoverShadow,
    this.focusedShadow,
    this.activeShadow,
    this.disabledShadow,
  });

  UIKitShadowScheme.defaultScheme() {
    defaultShadow = [];
    hoverShadow = [];
    focusedShadow = [];
    activeShadow = [];
    disabledShadow = [];
  }

  UIKitShadowScheme copyWith({
    List<BoxShadow>? defaultShadow,
    List<BoxShadow>? hoverShadow,
    List<BoxShadow>? focusedShadow,
    List<BoxShadow>? activeShadow,
    List<BoxShadow>? disabledShadow,
  }) {
    return UIKitShadowScheme._(
      defaultShadow: defaultShadow ?? this.defaultShadow,
      hoverShadow: hoverShadow ?? this.hoverShadow,
      focusedShadow: focusedShadow ?? this.focusedShadow,
      activeShadow: activeShadow ?? this.activeShadow,
      disabledShadow: disabledShadow ?? this.disabledShadow,
    );
  }

  List<BoxShadow>? defaultShadow;
  List<BoxShadow>? hoverShadow;
  List<BoxShadow>? focusedShadow;
  List<BoxShadow>? activeShadow;
  List<BoxShadow>? disabledShadow;
}
