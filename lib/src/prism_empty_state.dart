import 'package:flutter/material.dart';
import 'prism_colors.dart';
import 'prism_icon.dart';
import 'prism_typography.dart';
import 'prism_spacing.dart';
import 'prism_variant.dart';
import 'prism_size.dart';
import 'prism_button.dart';

class PrismEmptyState extends StatelessWidget {
  const PrismEmptyState({
    super.key,
    required this.icon,
    required this.title,
    this.message,
    this.actionLabel,
    this.onAction,
  });

  final String icon;
  final String title;
  final String? message;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(PrismSpacing.px32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            PrismIcon(icon, size: 48, color: PrismColors.chalk.withValues(alpha: 0.2)),
            const SizedBox(height: PrismSpacing.px20),
            Text(
              title.toUpperCase(),
              style: PrismTypography.headingM.copyWith(
                color: PrismColors.chalk.withValues(alpha: 0.5),
              ),
              textAlign: TextAlign.center,
            ),
            if (message != null) ...[
              const SizedBox(height: PrismSpacing.px8),
              Text(
                message!,
                style: PrismTypography.bodyM.copyWith(
                  color: PrismColors.chalk.withValues(alpha: 0.3),
                ),
                textAlign: TextAlign.center,
              ),
            ],
            if (actionLabel != null && onAction != null) ...[
              const SizedBox(height: PrismSpacing.px24),
              PrismButton(
                label: actionLabel!,
                onPressed: onAction,
                variant: PrismVariant.primary,
                size: PrismSize.sm,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
