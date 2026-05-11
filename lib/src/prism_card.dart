import 'package:flutter/material.dart';
import 'prism_colors.dart';
import 'prism_typography.dart';
import 'prism_spacing.dart';

class PrismCard extends StatelessWidget {
  const PrismCard({
    super.key,
    required this.child,
    this.accent,
    this.label,
    this.onTap,
    this.padding,
  });

  final Widget child;
  final Color? accent;
  final String? label;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final accentColor = accent ?? PrismColors.amber;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: PrismColors.surface1,
          border: Border(
            left: BorderSide(color: accentColor, width: 3),
            top: const BorderSide(color: PrismColors.border, width: 1),
            right: const BorderSide(color: PrismColors.border, width: 1),
            bottom: const BorderSide(color: PrismColors.border, width: 1),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (label != null)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: PrismSpacing.px16,
                  vertical: PrismSpacing.px8,
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: accentColor.withValues(alpha: 0.3), width: 1),
                  ),
                ),
                child: Text(
                  label!.toUpperCase(),
                  style: PrismTypography.label.copyWith(color: accentColor),
                ),
              ),
            Padding(
              padding: padding ?? const EdgeInsets.all(PrismSpacing.px20),
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
