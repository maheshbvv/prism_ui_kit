import 'package:flutter/material.dart';
import 'prism_colors.dart';
import 'prism_spacing.dart';

class PrismCardBox extends StatelessWidget {
  const PrismCardBox({
    super.key,
    required this.child,
    this.padding,
    this.onTap,
    this.color,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding ?? const EdgeInsets.all(PrismSpacing.px20),
        decoration: BoxDecoration(
          color: color ?? PrismColors.surface1,
          border: Border.all(color: PrismColors.border, width: 1),
        ),
        child: child,
      ),
    );
  }
}
