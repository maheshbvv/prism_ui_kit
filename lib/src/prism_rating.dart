import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'prism_colors.dart';
import 'prism_icon.dart';
import 'prism_icons.dart';

class PrismRating extends StatelessWidget {
  const PrismRating({
    super.key,
    required this.rating,
    required this.onChanged,
    this.maxRating = 5,
    this.size = 24,
  });

  final double rating;
  final ValueChanged<double> onChanged;
  final int maxRating;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(maxRating, (i) {
        final starValue = i + 1.0;
        final filled = starValue <= rating;
        return GestureDetector(
          onTap: () {
            HapticFeedback.selectionClick();
            onChanged(starValue);
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 2),
            child: PrismIcon(
              PrismIcons.star,
              size: size,
              color: filled ? PrismColors.amber : PrismColors.surface3,
            ),
          ),
        );
      }),
    );
  }
}
