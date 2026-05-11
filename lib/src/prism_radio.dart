import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'prism_colors.dart';
import 'prism_typography.dart';
import 'prism_spacing.dart';

class PrismRadioOption<T> {
  const PrismRadioOption({
    required this.value,
    required this.label,
    this.description,
  });

  final T value;
  final String label;
  final String? description;
}

class PrismRadioGroup<T> extends StatelessWidget {
  const PrismRadioGroup({
    super.key,
    required this.options,
    required this.value,
    required this.onChanged,
  });

  final List<PrismRadioOption<T>> options;
  final T value;
  final ValueChanged<T> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: options.map((opt) {
        final selected = opt.value == value;
        return GestureDetector(
          onTap: () {
            HapticFeedback.selectionClick();
            onChanged(opt.value);
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: PrismSpacing.px8),
            padding: const EdgeInsets.all(PrismSpacing.px16),
            decoration: BoxDecoration(
              color: selected
                  ? PrismColors.amber.withValues(alpha: 0.07)
                  : PrismColors.surface1,
              border: Border.all(
                color: selected ? PrismColors.amber : PrismColors.border,
                width: selected ? 1.5 : 1,
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: selected ? PrismColors.amber : PrismColors.border,
                      width: 1.5,
                    ),
                  ),
                  child: selected
                      ? Center(
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: PrismColors.amber,
                            ),
                          ),
                        )
                      : null,
                ),
                const SizedBox(width: PrismSpacing.px12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        opt.label,
                        style: PrismTypography.bodyM.copyWith(
                          fontWeight: FontWeight.w600,
                          color: selected
                              ? PrismColors.amber
                              : PrismColors.chalk,
                        ),
                      ),
                      if (opt.description != null)
                        Text(
                          opt.description!,
                          style: PrismTypography.bodyS.copyWith(
                            color: PrismColors.chalk.withValues(alpha: 0.45),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
