import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../smartup_uikit.dart';

abstract class UIKitDropdownMenu<T> extends HookWidget {

  final List<Widget> labels;
  final List<Widget> actions;
  final List<T> options;
  final bool multiselect;
  final Widget? itemTrailing;
  final UIKitColorScheme? colorScheme;
  final UIKitSizeScheme? sizeScheme;
  final UIKitShadowScheme? shadowScheme;
  final bool? hasSearchBar;
  final void Function(String)? searchOnChange;

  const UIKitDropdownMenu({
    super.key,
    this.labels = const [],
    this.actions = const [],
    this.options = const [],
    required this.multiselect,
    this.itemTrailing,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
    this.hasSearchBar,
    this.searchOnChange,
  })  : assert(
  options.length == labels.length,
  'There must be exactly one label for each option!',
  ),
        assert(
        !((hasSearchBar ?? false) ^ (searchOnChange != null)),
        'Doesn\'t have searchBar or onChange method, must have both',
        );

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}