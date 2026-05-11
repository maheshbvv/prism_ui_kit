import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'prism_colors.dart';
import 'prism_typography.dart';
import 'prism_spacing.dart';

class PrismToggle extends StatelessWidget {
  const PrismToggle({
    super.key,
    required this.value,
    required this.onChanged,
    this.label,
    this.description,
  });

  final bool value;
  final ValueChanged<bool> onChanged;
  final String? label;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact();
        onChanged(!value);
      },
      child: Row(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            width: 44,
            height: 24,
            decoration: BoxDecoration(
              color: value ? PrismColors.amber : PrismColors.surface2,
              border: Border.all(
                color: value ? PrismColors.amber : PrismColors.border,
                width: 1.5,
              ),
            ),
            child: AnimatedAlign(
              duration: const Duration(milliseconds: 150),
              curve: Curves.easeOut,
              alignment:
                  value ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                width: 16,
                height: 16,
                margin: const EdgeInsets.symmetric(horizontal: 3),
                color: value
                    ? PrismColors.ink
                    : PrismColors.chalk.withValues(alpha: 0.3),
              ),
            ),
          ),
          if (label != null) ...[
            const SizedBox(width: PrismSpacing.px12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label!,
                  style:
                      PrismTypography.bodyM.copyWith(fontWeight: FontWeight.w600),
                ),
                if (description != null)
                  Text(
                    description!,
                    style: PrismTypography.bodyS.copyWith(
                      color: PrismColors.chalk.withValues(alpha: 0.4),
                    ),
                  ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
