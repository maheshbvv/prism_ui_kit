import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'prism_colors.dart';
import 'prism_icon.dart';
import 'prism_icons.dart';
import 'prism_typography.dart';
import 'prism_spacing.dart';

class PrismCheckbox extends StatelessWidget {
  const PrismCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.label,
    this.indeterminate = false,
  });

  final bool value;
  final ValueChanged<bool> onChanged;
  final String? label;
  final bool indeterminate;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.selectionClick();
        onChanged(!value);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: value || indeterminate
                  ? PrismColors.amber
                  : Colors.transparent,
              border: Border.all(
                color: value || indeterminate
                    ? PrismColors.amber
                    : PrismColors.border,
                width: 1.5,
              ),
            ),
            child: (value || indeterminate)
                ? Center(
                    child: indeterminate
                        ? Container(
                            width: 10,
                            height: 2,
                            color: PrismColors.ink,
                          )
                        : PrismIcon(
                            PrismIcons.check,
                            size: 14,
                            color: PrismColors.ink,
                          ),
                  )
                : null,
          ),
          if (label != null) ...[
            const SizedBox(width: PrismSpacing.px10),
            Text(
              label!,
              style: PrismTypography.bodyM,
            ),
          ],
        ],
      ),
    );
  }
}
