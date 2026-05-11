import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PrismBrandIcon extends StatelessWidget {
  const PrismBrandIcon(
    this.icon, {
    super.key,
    this.size = 24,
  });

  final String icon;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon,
      package: 'prism_ui_kit',
      width: size,
      height: size,
    );
  }
}
