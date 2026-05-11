import 'package:flutter/material.dart';
import 'prism_colors.dart';
import 'prism_typography.dart';
import 'prism_spacing.dart';
import 'prism_badge_variant.dart';

class PrismBadge extends StatelessWidget {
  const PrismBadge({
    super.key,
    required this.label,
    this.variant = PrismBadgeVariant.neutral,
    this.dot = false,
  });

  final String label;
  final PrismBadgeVariant variant;
  final bool dot;

  @override
  Widget build(BuildContext context) {
    final (bg, fg) = switch (variant) {
      PrismBadgeVariant.success =>
        (PrismColors.lime.withValues(alpha: 0.15), PrismColors.lime),
      PrismBadgeVariant.error =>
        (PrismColors.coral.withValues(alpha: 0.15), PrismColors.coral),
      PrismBadgeVariant.warning =>
        (PrismColors.amber.withValues(alpha: 0.15), PrismColors.amber),
      PrismBadgeVariant.info =>
        (PrismColors.sky.withValues(alpha: 0.15), PrismColors.sky),
      PrismBadgeVariant.neutral =>
        (PrismColors.surface2, PrismColors.chalk.withValues(alpha: 0.6)),
      PrismBadgeVariant.accent => (PrismColors.amber, PrismColors.ink),
    };

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: PrismSpacing.px8,
        vertical: PrismSpacing.px4,
      ),
      decoration: BoxDecoration(
        color: bg,
        border: Border.all(color: fg.withValues(alpha: 0.3), width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (dot) ...[
            Container(width: 5, height: 5, color: fg),
            const SizedBox(width: 5),
          ],
          Text(
            label.toUpperCase(),
            style: PrismTypography.label.copyWith(
              color: fg,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
