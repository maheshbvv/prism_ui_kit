import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'prism_colors.dart';
import 'prism_typography.dart';
import 'prism_spacing.dart';

class PrismSingleChoiceTile extends StatelessWidget {
  const PrismSingleChoiceTile({
    super.key,
    required this.title,
    required this.selected,
    required this.onTap,
    this.subtitle,
    this.leading,
  });

  final String title;
  final bool selected;
  final VoidCallback onTap;
  final String? subtitle;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.selectionClick();
        onTap();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: PrismSpacing.px16,
          vertical: PrismSpacing.px12,
        ),
        decoration: BoxDecoration(
          color: PrismColors.surface1,
          border: Border(
            left: selected
                ? BorderSide(color: PrismColors.amber, width: 3)
                : BorderSide.none,
            bottom: const BorderSide(color: PrismColors.border, width: 1),
          ),
        ),
        child: Row(
          children: [
            if (leading != null) ...[
              leading!,
              const SizedBox(width: PrismSpacing.px12),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: PrismTypography.bodyM.copyWith(
                      fontWeight: FontWeight.w600,
                      color: selected ? PrismColors.amber : PrismColors.chalk,
                    ),
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 2),
                    Text(
                      subtitle!,
                      style: PrismTypography.bodyS.copyWith(
                        color: PrismColors.chalk.withValues(alpha: 0.45),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: selected ? PrismColors.amber : PrismColors.border,
                  width: 1.5,
                ),
              ),
              child: selected
                  ? Center(
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: PrismColors.amber,
                        ),
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
