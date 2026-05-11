import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'prism_colors.dart';
import 'prism_typography.dart';

class PrismTabs extends StatelessWidget {
  const PrismTabs({
    super.key,
    required this.tabs,
    required this.selectedIndex,
    required this.onTap,
  });

  final List<String> tabs;
  final int selectedIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: PrismColors.border, width: 1),
        ),
      ),
      child: Row(
        children: List.generate(tabs.length, (i) {
          final selected = i == selectedIndex;
          return Expanded(
            child: GestureDetector(
              onTap: () {
                HapticFeedback.selectionClick();
                onTap(i);
              },
              behavior: HitTestBehavior.opaque,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 14),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: selected ? PrismColors.amber : Colors.transparent,
                      width: 2,
                    ),
                  ),
                ),
                child: Text(
                  tabs[i].toUpperCase(),
                  style: PrismTypography.label.copyWith(
                    color: selected
                        ? PrismColors.amber
                        : PrismColors.chalk.withValues(alpha: 0.35),
                    fontSize: 10,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
