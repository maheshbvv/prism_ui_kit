import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PrismIcon extends StatelessWidget {
  const PrismIcon(
    this.icon, {
    super.key,
    this.size = 24,
    this.color,
  });

  final String icon;
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon,
      package: 'prism_ui_kit',
      width: size,
      height: size,
      colorFilter: color != null
          ? ColorFilter.mode(color!, BlendMode.srcIn)
          : null,
    );
  }
}
