import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'prism_colors.dart';
import 'prism_icon.dart';
import 'prism_typography.dart';
import 'prism_spacing.dart';

class PrismNavigationRailDestination {
  const PrismNavigationRailDestination({
    required this.icon,
    required this.selectedIcon,
    required this.label,
  });

  final IconData icon;
  final IconData selectedIcon;
  final String label;
}

class PrismNavigationRail extends StatelessWidget {
  const PrismNavigationRail({
    super.key,
    required this.destinations,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  final List<PrismNavigationRailDestination> destinations;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72,
      decoration: const BoxDecoration(
        color: PrismColors.surface1,
        border: Border(
          right: BorderSide(color: PrismColors.border, width: 1),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(destinations.length, (i) {
          final dest = destinations[i];
          final selected = i == selectedIndex;
          return GestureDetector(
            onTap: () {
              HapticFeedback.selectionClick();
              onDestinationSelected(i);
            },
            behavior: HitTestBehavior.opaque,
            child: Container(
              width: 72,
              padding: const EdgeInsets.symmetric(vertical: PrismSpacing.px12),
              decoration: BoxDecoration(
                border: Border(
                  left: selected
                      ? BorderSide(color: PrismColors.amber, width: 2)
                      : BorderSide.none,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  PrismIcon(
                    selected ? dest.selectedIcon : dest.icon,
                    color: selected
                        ? PrismColors.amber
                        : PrismColors.chalk.withValues(alpha: 0.35),
                    size: 22,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    dest.label.toUpperCase(),
                    style: PrismTypography.label.copyWith(
                      fontSize: 9,
                      color: selected
                          ? PrismColors.amber
                          : PrismColors.chalk.withValues(alpha: 0.35),
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
