import 'package:flutter/material.dart';
import 'prism_colors.dart';
import 'prism_typography.dart';
import 'prism_spacing.dart';

class PrismDivider extends StatelessWidget {
  const PrismDivider({
    super.key,
    this.label,
    this.accent = false,
    this.vertical = false,
    this.height,
  });

  final String? label;
  final bool accent;
  final bool vertical;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final color = accent ? PrismColors.amber : PrismColors.border;

    if (vertical) {
      return Container(
        width: 1,
        height: height ?? double.infinity,
        color: color,
      );
    }

    if (label == null) {
      return Container(
        height: 1,
        color: color,
        margin: const EdgeInsets.symmetric(vertical: PrismSpacing.px16),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: PrismSpacing.px16),
      child: Row(
        children: [
          Expanded(child: Container(height: 1, color: color)),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: PrismSpacing.px12),
            child: Text(
              label!.toUpperCase(),
              style: PrismTypography.label.copyWith(
                color: accent
                    ? PrismColors.amber
                    : PrismColors.chalk.withValues(alpha: 0.35),
                fontSize: 10,
              ),
            ),
          ),
          Expanded(child: Container(height: 1, color: color)),
        ],
      ),
    );
  }
}
