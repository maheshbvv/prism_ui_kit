import 'package:flutter/material.dart';
import 'prism_colors.dart';
import 'prism_icon.dart';
import 'prism_icons.dart';
import 'prism_typography.dart';
import 'prism_spacing.dart';

class PrismTag extends StatelessWidget {
  const PrismTag({super.key, required this.label, this.onRemove});

  final String label;
  final VoidCallback? onRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: PrismSpacing.px8,
        vertical: PrismSpacing.px4,
      ),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: PrismColors.border, width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: PrismTypography.mono.copyWith(
              fontSize: 11,
              color: PrismColors.chalk.withValues(alpha: 0.7),
            ),
          ),
          if (onRemove != null) ...[
            const SizedBox(width: 6),
            GestureDetector(
              onTap: onRemove,
              child: PrismIcon(
                PrismIcons.close,
                size: 12,
                color: PrismColors.chalk.withValues(alpha: 0.4),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
