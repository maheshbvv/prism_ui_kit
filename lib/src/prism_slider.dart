import 'package:flutter/material.dart';
import 'prism_colors.dart';
import 'prism_typography.dart';
import 'prism_spacing.dart';

class PrismSlider extends StatelessWidget {
  const PrismSlider({
    super.key,
    required this.value,
    required this.onChanged,
    this.min = 0.0,
    this.max = 1.0,
    this.label,
    this.showValue = true,
    this.divisions,
    this.accentColor = PrismColors.amber,
  });

  final double value;
  final ValueChanged<double> onChanged;
  final double min;
  final double max;
  final String? label;
  final bool showValue;
  final int? divisions;
  final Color accentColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null || showValue)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (label != null)
                Text(
                  label!.toUpperCase(),
                  style: PrismTypography.label
                      .copyWith(color: PrismColors.chalk.withValues(alpha: 0.5)),
                ),
              if (showValue)
                Text(
                  value.toStringAsFixed(0),
                  style: PrismTypography.mono
                      .copyWith(color: accentColor, fontSize: 12),
                ),
            ],
          ),
        if (label != null || showValue)
          const SizedBox(height: PrismSpacing.px8),
        SliderTheme(
          data: SliderThemeData(
            trackHeight: 2,
            activeTrackColor: accentColor,
            inactiveTrackColor: PrismColors.border,
            thumbColor: accentColor,
            overlayColor: accentColor.withValues(alpha: 0.1),
            thumbShape: _SquareThumbShape(accentColor),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 12),
            trackShape: const RectangularSliderTrackShape(),
            valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
            valueIndicatorColor: accentColor,
          ),
          child: Slider(
            value: value,
            min: min,
            max: max,
            divisions: divisions,
            onChanged: onChanged,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              min.toStringAsFixed(0),
              style: PrismTypography.label.copyWith(
                color: PrismColors.chalk.withValues(alpha: 0.3),
                fontSize: 10,
              ),
            ),
            Text(
              max.toStringAsFixed(0),
              style: PrismTypography.label.copyWith(
                color: PrismColors.chalk.withValues(alpha: 0.3),
                fontSize: 10,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _SquareThumbShape extends SliderComponentShape {
  const _SquareThumbShape(this.color);
  final Color color;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) =>
      const Size(16, 16);

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final canvas = context.canvas;
    canvas.drawRect(
      Rect.fromCenter(center: center, width: 14, height: 14),
      Paint()..color = color,
    );
    canvas.drawRect(
      Rect.fromCenter(center: center, width: 14, height: 14),
      Paint()
        ..color = PrismColors.ink
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2,
    );
  }
}
