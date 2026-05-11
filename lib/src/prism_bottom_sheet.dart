import 'package:flutter/material.dart';
import 'prism_colors.dart';
import 'prism_icon.dart';
import 'prism_icons.dart';
import 'prism_typography.dart';
import 'prism_spacing.dart';
import 'prism_divider.dart';

class PrismBottomSheet extends StatelessWidget {
  const PrismBottomSheet({
    super.key,
    required this.title,
    required this.children,
  });

  final String title;
  final List<Widget> children;

  static Future<T?> show<T>(
    BuildContext context, {
    required String title,
    required List<Widget> children,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      backgroundColor: Colors.transparent,
      barrierColor: PrismColors.ink.withValues(alpha: 0.8),
      builder: (_) => PrismBottomSheet(title: title, children: children),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: PrismColors.surface1,
        border: Border(
          top: BorderSide(color: PrismColors.amber, width: 2),
          left: BorderSide(color: PrismColors.border),
          right: BorderSide(color: PrismColors.border),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              PrismSpacing.px20,
              PrismSpacing.px20,
              PrismSpacing.px20,
              PrismSpacing.px12,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(title, style: PrismTypography.headingM),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: PrismIcon(
                    PrismIcons.close,
                    color: PrismColors.chalk.withValues(alpha: 0.4),
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
          const PrismDivider(),
          ...children,
          SizedBox(height: MediaQuery.of(context).padding.bottom + 16),
        ],
      ),
    );
  }
}

class PrismBottomSheetAction extends StatelessWidget {
  const PrismBottomSheetAction({
    super.key,
    required this.label,
    required this.onTap,
    this.icon,
    this.isDestructive = false,
  });

  final String label;
  final VoidCallback onTap;
  final String? icon;
  final bool isDestructive;

  @override
  Widget build(BuildContext context) {
    final color = isDestructive ? PrismColors.coral : PrismColors.chalk;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: PrismSpacing.px20,
          vertical: PrismSpacing.px16,
        ),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: PrismColors.border, width: 1),
          ),
        ),
        child: Row(
          children: [
            if (icon != null) ...[
              PrismIcon(icon!, size: 18, color: color.withValues(alpha: 0.6)),
              const SizedBox(width: PrismSpacing.px12),
            ],
            Text(
              label,
              style: PrismTypography.bodyM.copyWith(
                color: color,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
