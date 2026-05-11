import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'prism_colors.dart';
import 'prism_typography.dart';

class PrismSegmentBar extends StatelessWidget {
  const PrismSegmentBar({
    super.key,
    required this.segments,
    required this.selectedIndex,
    required this.onTap,
  });

  final List<String> segments;
  final int selectedIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: PrismColors.border, width: 1.5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(segments.length, (i) {
          final selected = i == selectedIndex;
          return GestureDetector(
            onTap: () {
              HapticFeedback.selectionClick();
              onTap(i);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: selected ? PrismColors.amber : Colors.transparent,
                border: i < segments.length - 1
                    ? const Border(
                        right: BorderSide(color: PrismColors.border, width: 1.5),
                      )
                    : null,
              ),
              child: Text(
                segments[i].toUpperCase(),
                style: PrismTypography.label.copyWith(
                  color: selected ? PrismColors.ink : PrismColors.chalk.withValues(alpha: 0.5),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
