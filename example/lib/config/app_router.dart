import 'package:example/drop_down_menu.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import '../buttons.dart';
import '../date_picker.dart';
import '../main.dart';
import '../radio_toggle_and_checkbox.dart';
import '../text_input.dart';

final GoRouter router = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: "/",
      builder: (BuildContext context, GoRouterState state) {
        return const MyHomePage(
          title: 'UIKitDemo',
        );
      },
      routes: [
        GoRoute(
          path: "buttons",
          builder: (BuildContext context, GoRouterState state) {
            return const Buttons();
          },
        ),
        GoRoute(
          path: "datePicker",
          builder: (BuildContext context, GoRouterState state) {
            return const DatePicker();
          },
        ),
        GoRoute(
          path: "dropDownMenuPage",
          builder: (BuildContext context, GoRouterState state) {
            return const DropDownMenuPage();
          },
        ),
        GoRoute(
          path: "textInput",
          builder: (BuildContext context, GoRouterState state) {
            return const TextInput();
          },
        ),
        GoRoute(
          path: "radioToggleAndCheckBox",
          builder: (BuildContext context, GoRouterState state) {
            return const RadioToggleAndCheckBox();
          },
        )
      ],
    ),
  ],
);