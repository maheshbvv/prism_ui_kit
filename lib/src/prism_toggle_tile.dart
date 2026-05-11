import 'package:flutter/material.dart';
import 'prism_colors.dart';
import 'prism_typography.dart';
import 'prism_spacing.dart';
import 'prism_toggle.dart';

class PrismToggleTile extends StatelessWidget {
  const PrismToggleTile({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
    this.subtitle,
    this.leading,
  });

  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;
  final String? subtitle;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          const SizedBox(width: PrismSpacing.px12),
          PrismToggle(value: value, onChanged: onChanged),
        ],
      ),
    );
  }
}
