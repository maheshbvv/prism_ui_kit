import 'package:flutter/material.dart';
import 'prism_colors.dart';
import 'prism_icon.dart';
import 'prism_icons.dart';
import 'prism_typography.dart';
import 'prism_spacing.dart';

class PrismPickerItem<T> {
  const PrismPickerItem({
    required this.value,
    required this.label,
    this.description,
  });

  final T value;
  final String label;
  final String? description;
}

class PrismPicker<T> {
  PrismPicker._();

  static Future<T?> show<T>(
    BuildContext context, {
    required String title,
    required List<PrismPickerItem<T>> items,
    T? value,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      backgroundColor: Colors.transparent,
      barrierColor: PrismColors.ink.withValues(alpha: 0.8),
      builder: (_) => _PrismPickerSheet<T>(
        title: title,
        items: items,
        selectedValue: value,
      ),
    );
  }
}

class _PrismPickerSheet<T> extends StatelessWidget {
  const _PrismPickerSheet({
    required this.title,
    required this.items,
    required this.selectedValue,
  });

  final String title;
  final List<PrismPickerItem<T>> items;
  final T? selectedValue;

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
          const Divider(height: 1, color: PrismColors.border),
          ...items.map((item) {
            final selected = item.value == selectedValue;
            return GestureDetector(
              onTap: () => Navigator.of(context).pop(item.value),
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
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.label,
                            style: PrismTypography.bodyM.copyWith(
                              fontWeight:
                                  selected ? FontWeight.w700 : FontWeight.w500,
                              color: selected
                                  ? PrismColors.amber
                                  : PrismColors.chalk,
                            ),
                          ),
                          if (item.description != null)
                            Text(
                              item.description!,
                              style: PrismTypography.bodyS.copyWith(
                                color: PrismColors.chalk.withValues(alpha: 0.45),
                              ),
                            ),
                        ],
                      ),
                    ),
                    if (selected)
                      PrismIcon(
                        PrismIcons.check,
                        size: 18,
                        color: PrismColors.amber,
                      ),
                  ],
                ),
              ),
            );
          }),
          SizedBox(height: MediaQuery.of(context).padding.bottom + 16),
        ],
      ),
    );
  }
}
