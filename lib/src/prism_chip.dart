import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'prism_colors.dart';
import 'prism_icon.dart';
import 'prism_typography.dart';
import 'prism_spacing.dart';

class PrismChip extends StatelessWidget {
  const PrismChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onToggle,
    this.icon,
  });

  final String label;
  final bool selected;
  final VoidCallback onToggle;
  final String? icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.selectionClick();
        onToggle();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 120),
        padding: const EdgeInsets.symmetric(
          horizontal: PrismSpacing.px12,
          vertical: PrismSpacing.px6,
        ),
        decoration: BoxDecoration(
          color: selected ? PrismColors.amber : Colors.transparent,
          border: Border.all(
            color: selected ? PrismColors.amber : PrismColors.border,
            width: 1.5,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              PrismIcon(
                icon!,
                size: 14,
                color: selected
                    ? PrismColors.ink
                    : PrismColors.chalk.withValues(alpha: 0.5),
              ),
              const SizedBox(width: 6),
            ],
            Text(
              label,
              style: PrismTypography.headingS.copyWith(
                color: selected
                    ? PrismColors.ink
                    : PrismColors.chalk.withValues(alpha: 0.6),
                letterSpacing: 0.3,
                fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
