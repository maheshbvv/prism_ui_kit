import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'prism_colors.dart';
import 'prism_icon.dart';
import 'prism_typography.dart';

class PrismNavBarItem {
  const PrismNavBarItem({
    required this.icon,
    required this.selectedIcon,
    required this.label,
  });

  final IconData icon;
  final IconData selectedIcon;
  final String label;
}

class PrismNavBar extends StatelessWidget {
  const PrismNavBar({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
  });

  final List<PrismNavBarItem> items;
  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64 + MediaQuery.of(context).padding.bottom,
      decoration: const BoxDecoration(
        color: PrismColors.surface1,
        border: Border(
          top: BorderSide(color: PrismColors.border, width: 1),
        ),
      ),
      child: Row(
        children: List.generate(items.length, (i) {
          final item = items[i];
          final selected = i == currentIndex;
          return Expanded(
            child: GestureDetector(
              onTap: () {
                HapticFeedback.selectionClick();
                onTap(i);
              },
              behavior: HitTestBehavior.opaque,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: selected
                          ? PrismColors.amber.withValues(alpha: 0.12)
                          : Colors.transparent,
                      border: selected
                          ? Border.all(
                              color: PrismColors.amber.withValues(alpha: 0.3),
                              width: 1,
                            )
                          : null,
                    ),
                    child: PrismIcon(
                      selected ? item.selectedIcon : item.icon,
                      color: selected
                          ? PrismColors.amber
                          : PrismColors.chalk.withValues(alpha: 0.35),
                      size: 20,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.label.toUpperCase(),
                    style: PrismTypography.label.copyWith(
                      fontSize: 9,
                      color: selected
                          ? PrismColors.amber
                          : PrismColors.chalk.withValues(alpha: 0.35),
                      letterSpacing: 0.8,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
