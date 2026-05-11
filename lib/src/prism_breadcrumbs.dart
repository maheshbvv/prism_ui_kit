import 'package:flutter/material.dart';
import 'prism_colors.dart';
import 'prism_typography.dart';

class PrismBreadcrumbs extends StatelessWidget {
  const PrismBreadcrumbs({
    super.key,
    required this.items,
    this.separator = '/',
    this.onTapItem,
  });

  final List<PrismBreadcrumbItem> items;
  final String separator;
  final ValueChanged<int>? onTapItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(items.length, (i) {
        final item = items[i];
        final isLast = i == items.length - 1;
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: isLast ? null : () => onTapItem?.call(i),
              child: Text(
                item.label.toUpperCase(),
                style: PrismTypography.label.copyWith(
                  fontSize: 10,
                  color: isLast
                      ? PrismColors.amber
                      : PrismColors.chalk.withValues(alpha: 0.4),
                ),
              ),
            ),
            if (!isLast) ...[
              const SizedBox(width: 8),
              Text(
                separator,
                style: PrismTypography.label.copyWith(
                  fontSize: 10,
                  color: PrismColors.chalk.withValues(alpha: 0.2),
                ),
              ),
              const SizedBox(width: 8),
            ],
          ],
        );
      }),
    );
  }
}

class PrismBreadcrumbItem {
  const PrismBreadcrumbItem({required this.label});

  final String label;
}
