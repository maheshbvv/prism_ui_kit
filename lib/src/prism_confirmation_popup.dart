import 'package:flutter/material.dart';
import 'prism_colors.dart';
import 'prism_typography.dart';
import 'prism_spacing.dart';
import 'prism_variant.dart';
import 'prism_size.dart';
import 'prism_button.dart';

class PrismConfirmationPopup extends StatelessWidget {
  const PrismConfirmationPopup({
    super.key,
    required this.title,
    required this.message,
    this.confirmLabel = 'Confirm',
    this.cancelLabel = 'Cancel',
    this.isDestructive = false,
  });

  final String title;
  final String message;
  final String confirmLabel;
  final String cancelLabel;
  final bool isDestructive;

  static Future<bool?> show(
    BuildContext context, {
    required String title,
    required String message,
    String confirmLabel = 'Confirm',
    String cancelLabel = 'Cancel',
    bool isDestructive = false,
  }) {
    return showGeneralDialog<bool>(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Dismiss',
      barrierColor: PrismColors.ink.withValues(alpha: 0.85),
      transitionDuration: const Duration(milliseconds: 200),
      transitionBuilder: (context, animation, _, child) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.95, end: 1.0).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOut),
            ),
            child: child,
          ),
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) => Center(
        child: PrismConfirmationPopup(
          title: title,
          message: message,
          confirmLabel: confirmLabel,
          cancelLabel: cancelLabel,
          isDestructive: isDestructive,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final accent = isDestructive ? PrismColors.coral : PrismColors.amber;

    return Material(
      color: Colors.transparent,
      child: Container(
        width: 360,
        margin: const EdgeInsets.all(PrismSpacing.px24),
        decoration: BoxDecoration(
          color: PrismColors.surface1,
          border: Border.all(color: PrismColors.border, width: 1),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(PrismSpacing.px20),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: PrismColors.border, width: 1),
                  left: BorderSide(color: accent, width: 3),
                ),
              ),
              child: Text(title, style: PrismTypography.headingM),
            ),
            Padding(
              padding: const EdgeInsets.all(PrismSpacing.px20),
              child: Text(
                message,
                style: PrismTypography.bodyM.copyWith(
                  color: PrismColors.chalk.withValues(alpha: 0.7),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(PrismSpacing.px16),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: PrismColors.border, width: 1),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  PrismButton(
                    label: cancelLabel,
                    variant: PrismVariant.ghost,
                    size: PrismSize.sm,
                    onPressed: () => Navigator.of(context).pop(false),
                  ),
                  const SizedBox(width: PrismSpacing.px8),
                  PrismButton(
                    label: confirmLabel,
                    variant: isDestructive
                        ? PrismVariant.danger
                        : PrismVariant.primary,
                    size: PrismSize.sm,
                    onPressed: () => Navigator.of(context).pop(true),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
