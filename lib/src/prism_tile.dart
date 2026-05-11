import 'package:flutter/material.dart';
import 'prism_colors.dart';
import 'prism_typography.dart';
import 'prism_spacing.dart';

class PrismTile extends StatelessWidget {
  const PrismTile({
    super.key,
    required this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
  });

  final String title;
  final String? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: PrismSpacing.px16,
          vertical: PrismSpacing.px12,
        ),
        decoration: const BoxDecoration(
          color: PrismColors.surface1,
          border: Border(
            bottom: BorderSide(color: PrismColors.border, width: 1),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: PrismTypography.bodyM.copyWith(
                      fontWeight: FontWeight.w600,
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
            if (trailing != null) ...[
              const SizedBox(width: PrismSpacing.px12),
              trailing!,
            ],
          ],
        ),
      ),
    );
  }
}
