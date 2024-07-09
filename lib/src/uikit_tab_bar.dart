import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smartup_uikit/smartup_uikit.dart';

class UIKitTabBar extends HookWidget {
  /// A list of widgets to use as labels for each tab.
  /// The first on this list will be the first label to be shown,
  /// the second label will be shown second etc.
  final List<Widget> labels;

  /// A list of children to be shown when a tab is selected.
  /// The first child is for the first tab.
  /// The second child is for the second tab etc.
  final List<Widget> children;

  const UIKitTabBar({
    super.key,
    required this.labels,
    required this.children,
  }) : assert(
          (children.length == labels.length),
          'The number of children must be equal to the number of labels.',
        );

  @override
  Widget build(BuildContext context) {
    // Index for the tabs. It controls which tab will be selected.
    final tabIndex$ = useState(0);
    // Direction is used to detect the swipe detection on the calendar.
    final direction$ = useState('');

    List<Widget> childrenWithKeys = useMemoized(() {
      List<Widget> childrenWithKeys = [];

      // We wrap every child with a container and we add a key to it.
      // This is done because AnimatedSwitcher requires keys to distinguish children of the same type.
      // Otherwise he does not know when to do an animation.
      for (int i = 0; i < children.length; i++) {
        childrenWithKeys.add(
          Container(
            key: ValueKey(i),
            child: children[i],
          ),
        );
      }
      return childrenWithKeys;
    }, [children.length]);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // We need this SizedBox because ListView needs to know the size of it's parent.
        SizedBox(
          width: double.infinity,
          height: 45,
          child: ListView(
            // This makes the list scroll horizontally instead of vertically
            scrollDirection: Axis.horizontal,
            children: [
              // For every child we make UIKitTab.
              for (int i = 0; i < children.length; i++) ...[
                UIKitTab.line(
                  // If this condition is true the the tab is active.
                  isActive: tabIndex$.value == i,
                  onTap: () {
                    // This line is needed so the tab_bar knows the correct side for the animation even if there was no swipe and the user tapped a button.
                    tabIndex$.value > i
                        ? direction$.value = 'right'
                        : direction$.value = 'left';
                    // Each tab remembers which i it was assigned to it. The on tap it can use it.
                    tabIndex$.value = i;
                  },
                  label: labels[i],
                ),
              ],
            ],
          ),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: GestureDetector(
            // This property allows GestureDetector to detect gestures in empty space.
            behavior: HitTestBehavior.opaque,
            onPanEnd: (details) {
              // We only want swipe to work if we are not on a web platform.
              // details.velocity.pixelsPerSecond.distance is used as an improvised way to set a sensitivity threshold/
              if (!kIsWeb && details.velocity.pixelsPerSecond.distance > 150) {
                // We change the tab index to change which child is shown.
                // We do children.length - 1 because lists start from 0.
                // If we reach 0 or the end of the list of children, then we cycle to the other end.
                if (direction$.value == 'right') {
                  tabIndex$.value > 0
                      ? tabIndex$.value = tabIndex$.value - 1
                      : tabIndex$.value = children.length - 1;
                }
                if (direction$.value == 'left') {
                  tabIndex$.value < children.length - 1
                      ? tabIndex$.value = tabIndex$.value + 1
                      : tabIndex$.value = 0;
                }
              }
            },
            onPanUpdate: (details) {
              // We need to check if the direction of the swipe is more horizontal than vertical to avoid changing tabs when the user wants to scroll.
              if (details.delta.dy < 3 && details.delta.dy > -3) {
                // Swiping in right direction was detected.
                if (details.delta.dx > 0) {
                  direction$.value = 'right';
                }

                // Swiping in left direction  was detected.
                if (details.delta.dx < 0) {
                  direction$.value = 'left';
                }
              } else {
                // If we detected a vertical swipe we ignore it.
                direction$.value = '';
              }
            },
            // According to the selected tab we show the correct child.
            child: AnimatedSwitcher(
              // Curves control the pace at which the child will speed up or slow down.
              switchInCurve: Curves.decelerate,
              switchOutCurve: Curves.linear,
              // This affects how fast the exiting child will move. If it is too slow the two children "Collide"
              reverseDuration: const Duration(milliseconds: 375),
              // This affects how fast the entering child will move.
              duration: const Duration(milliseconds: 750),
              transitionBuilder: (Widget child, Animation<double> animation) {
                // We check to see if the current child is the same with the selected tab.
                // This is done so we can show separate animations for the entering and exiting children.
                // Animation for the entering child.
                if (child.key == childrenWithKeys[tabIndex$.value].key) {
                  if (direction$.value == "left") {
                    return SlideTransition(
                      position: Tween(
                        begin: const Offset(1.0, 0.0),
                        end: const Offset(0.0, 0.0),
                      ).animate(animation),
                      child: child,
                    );
                  } else {
                    return SlideTransition(
                      position: Tween(
                        begin: const Offset(-1.0, 0.0),
                        end: const Offset(0.0, 0.0),
                      ).animate(animation),
                      child: child,
                    );
                  }
                }
                // Animation for the exiting child.
                else {
                  if (direction$.value == "left") {
                    return SlideTransition(
                      position: Tween(
                        begin: const Offset(-1.0, 0.0),
                        end: const Offset(0.0, 0.0),
                      ).animate(animation),
                      child: child,
                    );
                  } else {
                    return SlideTransition(
                      position: Tween(
                        begin: const Offset(1.0, 0.0),
                        end: const Offset(0.0, 0.0),
                      ).animate(animation),
                      child: child,
                    );
                  }
                }
              },
              child: childrenWithKeys[tabIndex$.value],
            ),
          ),
        ),
      ],
    );
  }
}
