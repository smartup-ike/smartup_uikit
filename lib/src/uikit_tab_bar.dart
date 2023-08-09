import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smartup_uikit/smartup_uikit.dart';

class UIKitTabBar extends HookWidget {
  /// UIKit sizeScheme for the Tab Bar
  final UIKitSizeScheme sizeScheme;

  /// A list of widgets to use as labels for each tab.
  /// The first on this list will be the first label to be shown,
  /// the second label will be shown second etc.
  final List<Widget> labels;

  /// A list of children to be shown when a tab is selected.
  /// The first child is for the first tab.
  /// The second child is for the second tab etc.
  final List<Widget> children;

  const UIKitTabBar(
      {super.key,
      required this.labels,
      required this.sizeScheme,
      required this.children})
      : assert(
          (children.length == labels.length),
          'The number of children must be equal to the number of labels.',
        );

  @override
  Widget build(BuildContext context) {
    // Index for the tabs. It controls which tab will be selected.
    final tabIndex$ = useState(0);
    // Direction is used to detect the swipe detection on the calendar.
    String direction = '';

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // For every child we make UIKitTab.
              for (int i = 0; i < children.length; i++) ...[
                UIKitTab.line(
                  key: ValueKey<int>(i),
                  isActive: tabIndex$.value == i,
                  onTap: () => tabIndex$.value = i,
                  label: labels[i],
                ),
              ],
            ],
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onPanEnd: (details) {
              // We only want swipe to work if we are not on a web platform.
              if (!kIsWeb) {
                // We change the tab index to change which child is shown.
                // We do children.length - 1 because lists start from 0.
                // If we reach 0 or the end of the list of children, then we cycle to the other end.
                if (direction == 'right') {
                  tabIndex$.value > 0
                      ? tabIndex$.value = tabIndex$.value - 1
                      : tabIndex$.value = children.length - 1;
                }
                if (direction == 'left') {
                  tabIndex$.value < children.length - 1
                      ? tabIndex$.value = tabIndex$.value + 1
                      : tabIndex$.value = 0;
                }
              }
            },
            onPanUpdate: (details) {
              // Swiping in right direction was detected.
              if (details.delta.dx > 0) {
                direction = 'right';
              }

              // Swiping in left direction  was detected.
              if (details.delta.dx < 0) {
                direction = 'left';
              }
            },
            // According to the selected tab we show the correct child.
            child:
              AnimatedSwitcher(
                  duration: const Duration(seconds: 3),
                  child: children[tabIndex$.value]),
            ),
        ],
      ),
    );
  }
}