import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'prism_colors.dart';
import 'prism_typography.dart';

class PrismLinearProgress extends StatelessWidget {
  const PrismLinearProgress({
    super.key,
    required this.value,
    this.label,
    this.showPercent = true,
    this.accentColor = PrismColors.amber,
    this.height = 6,
    this.segments,
  });

  final double value;
  final String? label;
  final bool showPercent;
  final Color accentColor;
  final double height;
  final int? segments;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null || showPercent)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (label != null)
                Text(
                  label!.toUpperCase(),
                  style: PrismTypography.label.copyWith(
                    color: PrismColors.chalk.withValues(alpha: 0.5),
                  ),
                ),
              if (showPercent)
                Text(
                  '${(value * 100).toStringAsFixed(0)}%',
                  style: PrismTypography.mono.copyWith(
                    fontSize: 11,
                    color: accentColor,
                  ),
                ),
            ],
          ),
        if (label != null || showPercent) const SizedBox(height: 6),
        LayoutBuilder(builder: (context, constraints) {
          return Stack(
            children: [
              Container(
                width: constraints.maxWidth,
                height: height,
                color: PrismColors.surface2,
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeOut,
                width: constraints.maxWidth * value.clamp(0.0, 1.0),
                height: height,
                color: accentColor,
              ),
              if (segments != null)
                ...List.generate(segments! - 1, (i) {
                  final x = constraints.maxWidth * (i + 1) / segments!;
                  return Positioned(
                    left: x - 1,
                    top: 0,
                    child: Container(
                      width: 2,
                      height: height,
                      color: PrismColors.surface1,
                    ),
                  );
                }),
            ],
          );
        }),
      ],
    );
  }
}

class PrismCircularProgress extends StatefulWidget {
  const PrismCircularProgress({
    super.key,
    required this.value,
    this.size = 64,
    this.strokeWidth = 4,
    this.accentColor = PrismColors.amber,
    this.label,
    this.indeterminate = false,
  });

  final double value;
  final double size;
  final double strokeWidth;
  final Color accentColor;
  final String? label;
  final bool indeterminate;

  @override
  State<PrismCircularProgress> createState() =>
      _PrismCircularProgressState();
}

class _PrismCircularProgressState extends State<PrismCircularProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    if (widget.indeterminate) _ctrl.repeat();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: widget.size,
          height: widget.size,
          child: widget.indeterminate
              ? RotationTransition(
                  turns: _ctrl,
                  child: CustomPaint(
                    painter: _CircularProgressPainter(
                      value: 0.3,
                      color: widget.accentColor,
                      strokeWidth: widget.strokeWidth,
                    ),
                  ),
                )
              : CustomPaint(
                  painter: _CircularProgressPainter(
                    value: widget.value,
                    color: widget.accentColor,
                    strokeWidth: widget.strokeWidth,
                  ),
                  child: Center(
                    child: Text(
                      '${(widget.value * 100).toInt()}',
                      style: PrismTypography.mono.copyWith(
                        fontSize: widget.size * 0.2,
                        color: widget.accentColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
        ),
        if (widget.label != null) ...[
          const SizedBox(height: 6),
          Text(
            widget.label!.toUpperCase(),
            style: PrismTypography.label.copyWith(
              color: PrismColors.chalk.withValues(alpha: 0.4),
              fontSize: 10,
            ),
          ),
        ],
      ],
    );
  }
}

class _CircularProgressPainter extends CustomPainter {
  const _CircularProgressPainter({
    required this.value,
    required this.color,
    required this.strokeWidth,
  });

  final double value;
  final Color color;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      0,
      math.pi * 2,
      false,
      Paint()
        ..color = PrismColors.surface2
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.square,
    );

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      math.pi * 2 * value,
      false,
      Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.square,
    );
  }

  @override
  bool shouldRepaint(_CircularProgressPainter old) =>
      old.value != value || old.color != color;
}
