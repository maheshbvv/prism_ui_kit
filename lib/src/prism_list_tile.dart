import 'package:flutter/material.dart';
import 'prism_colors.dart';
import 'prism_icon.dart';
import 'prism_icons.dart';
import 'prism_typography.dart';
import 'prism_spacing.dart';

class PrismListTile extends StatelessWidget {
  const PrismListTile({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
    this.accentLeft,
    this.dense = false,
  });

  final String title;
  final String? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onTap;
  final Color? accentLeft;
  final bool dense;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: PrismSpacing.px16,
          vertical: dense ? PrismSpacing.px10 : PrismSpacing.px16,
        ),
        decoration: BoxDecoration(
          color: PrismColors.surface1,
          border: Border(
            left: accentLeft != null
                ? BorderSide(color: accentLeft!, width: 3)
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
              DefaultTextStyle(
                style: PrismTypography.bodyS.copyWith(
                  color: PrismColors.chalk.withValues(alpha: 0.4),
                ),
                child: trailing!,
              ),
            ] else if (onTap != null)
              PrismIcon(
                PrismIcons.arrowRight,
                size: 16,
                color: PrismColors.chalk.withValues(alpha: 0.25),
              ),
          ],
        ),
      ),
    );
  }
}
