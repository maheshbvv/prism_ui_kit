import 'package:flutter/material.dart';
import 'prism_colors.dart';
import 'prism_typography.dart';
import 'prism_spacing.dart';
import 'prism_variant.dart';
import 'prism_size.dart';
import 'prism_button.dart';

class PrismAlertPopup extends StatelessWidget {
  const PrismAlertPopup({
    super.key,
    required this.title,
    required this.message,
    this.buttonLabel = 'OK',
    this.isDestructive = false,
  });

  final String title;
  final String message;
  final String buttonLabel;
  final bool isDestructive;

  static Future<void> show(
    BuildContext context, {
    required String title,
    required String message,
    String buttonLabel = 'OK',
    bool isDestructive = false,
  }) {
    return showGeneralDialog(
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
        child: PrismAlertPopup(
          title: title,
          message: message,
          buttonLabel: buttonLabel,
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
        width: 320,
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
              width: double.infinity,
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
                    label: buttonLabel,
                    variant: isDestructive
                        ? PrismVariant.danger
                        : PrismVariant.primary,
                    size: PrismSize.sm,
                    onPressed: () => Navigator.of(context).pop(),
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
