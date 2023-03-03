import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class UIKitIcon extends StatelessWidget {
  const UIKitIcon.asset(
    this.assetPath, {
    super.key,
    this.color,
    this.size,
    this.url,
  }) : assert(url == null, 'url must be null on MRIcon.asset');

  const UIKitIcon.network(
    this.url, {
    super.key,
    this.color,
    this.size,
    this.assetPath,
  }) : assert(assetPath == null, 'asset must be null on MRIcon.network');

  final String? assetPath;
  final String? url;
  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    _UIKitIconThemeData? iconTheme;

    try {
      iconTheme = context.watch<_UIKitIconThemeData>();
      // ignore: empty_catches
    } catch (error) {}
    final svgColor = color ?? iconTheme?.color;
    if ((assetPath ?? '').isNotEmpty) {
      return SvgPicture.asset(
        assetPath!,
        width: iconTheme?.size ?? size ?? 16,
        height: iconTheme?.size ?? size ?? 16,
        colorFilter: svgColor == null
            ? null
            : ColorFilter.mode(svgColor, BlendMode.srcIn),
      );
    } else if (url != null) {
      return SvgPicture.network(
        url!,
        width: size ?? iconTheme?.size ?? 16,
        height: size ?? iconTheme?.size ?? 16,
        colorFilter: svgColor == null
            ? null
            : ColorFilter.mode(svgColor, BlendMode.srcIn),
      );
    }
    return SizedBox(
      width: size ?? iconTheme?.size ?? 16,
      height: size ?? iconTheme?.size ?? 16,
    );
  }
}

class _UIKitIconThemeData {
  _UIKitIconThemeData({this.color, this.size});

  final Color? color;
  final double? size;
}

class UIKitIconTheme extends StatelessWidget {
  const UIKitIconTheme({
    super.key,
    required this.child,
    this.color,
    this.size,
  });

  final Widget child;
  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Provider<_UIKitIconThemeData>.value(
      value: _UIKitIconThemeData(color: color, size: size),
      child: child,
    );
  }
}
