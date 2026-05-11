import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'prism_colors.dart';
import 'prism_icon.dart';
import 'prism_icons.dart';
import 'prism_typography.dart';
import 'prism_spacing.dart';

class PrismMultiChoiceTile extends StatelessWidget {
  const PrismMultiChoiceTile({
    super.key,
    required this.title,
    required this.checked,
    required this.onChanged,
    this.subtitle,
    this.leading,
  });

  final String title;
  final bool checked;
  final ValueChanged<bool> onChanged;
  final String? subtitle;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.selectionClick();
        onChanged(!checked);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: PrismSpacing.px16,
          vertical: PrismSpacing.px12,
        ),
        decoration: BoxDecoration(
          color: PrismColors.surface1,
          border: Border(
            left: checked
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
                      color: checked ? PrismColors.amber : PrismColors.chalk,
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
                color: checked ? PrismColors.amber : Colors.transparent,
                border: Border.all(
                  color: checked ? PrismColors.amber : PrismColors.border,
                  width: 1.5,
                ),
              ),
              child: checked
                  ? PrismIcon(PrismIcons.check, size: 14, color: PrismColors.ink)
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
