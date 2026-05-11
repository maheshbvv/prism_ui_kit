import 'package:flutter/material.dart';
import 'prism_colors.dart';
import 'prism_typography.dart';
import 'prism_spacing.dart';

enum PrismPopupPosition {
  bottom,
  top,
  left,
  right,
}

class PrismPopup extends StatelessWidget {
  const PrismPopup({
    super.key,
    required this.child,
    required this.popup,
    this.showPopup = false,
    this.position = PrismPopupPosition.bottom,
    this.gap = PrismSpacing.px8,
  });

  final Widget child;
  final Widget popup;
  final bool showPopup;
  final PrismPopupPosition position;
  final double gap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        child,
        if (showPopup)
          Positioned(
            left: position == PrismPopupPosition.left
                ? -(gap + 200)
                : position == PrismPopupPosition.right
                    ? null
                    : 0,
            right: position == PrismPopupPosition.right
                ? -(gap + 200)
                : null,
            top: position == PrismPopupPosition.top
                ? -(gap + 100)
                : position == PrismPopupPosition.bottom
                    ? null
                    : 0,
            bottom: position == PrismPopupPosition.bottom
                ? -(gap + 100)
                : null,
            child: Material(
              color: Colors.transparent,
              child: Container(
                constraints: const BoxConstraints(maxWidth: 200),
                padding: const EdgeInsets.all(PrismSpacing.px12),
                decoration: BoxDecoration(
                  color: PrismColors.surface2,
                  border: Border.all(color: PrismColors.border, width: 1),
                ),
                child: DefaultTextStyle(
                  style: PrismTypography.bodyS.copyWith(
                    color: PrismColors.chalk.withValues(alpha: 0.85),
                  ),
                  child: popup,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
