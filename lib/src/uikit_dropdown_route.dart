import 'package:flutter/material.dart';

class UIKitDropdownRoute<T> extends PopupRoute<T> {
  final Widget child;
  final RelativeRect position;
  final Size size;

  UIKitDropdownRoute({
    required this.child,
    required this.position,
    required this.size,
  });
  @override
  Color? get barrierColor => Colors.transparent;

  @override
  bool get barrierDismissible => true;

  @override
  String? get barrierLabel => 'Click to dismiss';

  @override
  Duration get transitionDuration => const Duration(milliseconds: 200);

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return CustomSingleChildLayout(
      delegate: _DropdownRouteChildDelegate(position, size),
      child: ScaleTransition(
        alignment: Alignment.topCenter,
        scale: animation,
        child: child,
      ),
    );
  }
}

class _DropdownRouteChildDelegate extends SingleChildLayoutDelegate {
  final RelativeRect position;
  final Size size;

  _DropdownRouteChildDelegate(this.position, this.size);

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    // size: The size of the overlay.
    // childSize: The size of the menu, when fully open, as determined by
    // getConstraintsForChild.

    final double buttonHeight = size.height - position.top - position.bottom;
    // Find the ideal vertical position.
    double y;
    if (position.top > position.bottom) {
      // Menu button is closer to the bottom edge
      if (childSize.height > position.bottom) {
        // Child can not fit to the bottom, so grow to the top, aligned to the top edge.
        y = position.top - childSize.height - 3;
      } else {
        // Child can fit to the bottom, so grow to the bottom, aligned to the bottom edge.
        y = position.top + buttonHeight + 3;
      }
    } else {
      // Menu button is closer to the top edge, so grow to the bottom, aligned to the bottom edge.
      y = position.top + buttonHeight + 3;
    }
    // Find the ideal horizontal position.
    double x;
    if (position.left >= position.right) {
      // Menu button is closer to the right edge, so grow to the left, aligned to the right edge.
      x = size.width - position.right - childSize.width;
    } else {
      // Menu button is closer to the left edge, so grow to the right, aligned to the left edge.
      x = position.left;
    }
    final Offset wantedPosition = Offset(x, y);
    final Offset originCenter = position.toRect(Offset.zero & size).center;
    final Iterable<Rect> subScreens =
        DisplayFeatureSubScreen.subScreensInBounds(Offset.zero & size, []);
    final Rect subScreen = _closestScreen(subScreens, originCenter);
    return _fitInsideScreen(subScreen, childSize, wantedPosition);
  }

  Rect _closestScreen(Iterable<Rect> screens, Offset point) {
    Rect closest = screens.first;
    for (final Rect screen in screens) {
      if ((screen.center - point).distance <
          (closest.center - point).distance) {
        closest = screen;
      }
    }
    return closest;
  }

  Offset _fitInsideScreen(Rect screen, Size childSize, Offset wantedPosition) {
    double x = wantedPosition.dx;
    double y = wantedPosition.dy;
    // Avoid going outside an area defined as the rectangle 8.0 pixels from the
    // edge of the screen in every direction.
    if (x < screen.left) {
      x = screen.left;
    } else if (x + childSize.width > screen.right) {
      x = screen.right - childSize.width;
    }
    if (y < screen.top) {
      y = screen.top - 8;
    } else if (y + childSize.height > screen.bottom) {
      y = screen.bottom - childSize.height;
    }

    return Offset(x, y);
  }

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return BoxConstraints(
      maxWidth: size.width,
      maxHeight:
          (position.top > position.bottom ? position.top : position.bottom) -
              16,
    );
    // BoxConstraints.loose(constraints.biggest).deflate(
    //   const EdgeInsets.all(16),
    // );
  }

  @override
  bool shouldRelayout(covariant _DropdownRouteChildDelegate oldDelegate) {
    return position != oldDelegate.position;
  }
}
