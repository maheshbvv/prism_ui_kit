import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'prism_colors.dart';

class PrismSpinner extends StatefulWidget {
  const PrismSpinner({
    super.key,
    this.color = PrismColors.amber,
    this.size = 16,
  });

  final Color color;
  final double size;

  @override
  State<PrismSpinner> createState() => _PrismSpinnerState();
}

class _PrismSpinnerState extends State<PrismSpinner>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _ctrl,
      child: CustomPaint(
        size: Size(widget.size, widget.size),
        painter: _PrismSpinnerPainter(widget.color),
      ),
    );
  }
}

class _PrismSpinnerPainter extends CustomPainter {
  _PrismSpinnerPainter(this.color);
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.square;
    canvas.drawArc(
      Rect.fromLTWH(0, 0, size.width, size.height),
      -math.pi / 2,
      math.pi * 1.4,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(_) => false;
}
