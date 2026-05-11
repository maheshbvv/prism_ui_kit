import 'package:flutter/material.dart';
import 'prism_colors.dart';
import 'prism_spacing.dart';

class PrismSkeleton extends StatefulWidget {
  const PrismSkeleton({
    super.key,
    this.width,
    this.height,
    this.borderRadius = 0,
  });

  final double? width;
  final double? height;
  final double borderRadius;

  @override
  State<PrismSkeleton> createState() => _PrismSkeletonState();
}

class _PrismSkeletonState extends State<PrismSkeleton>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);
    _opacity = Tween<double>(begin: 0.3, end: 0.7).animate(_ctrl);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _opacity,
      builder: (context, child) => Opacity(
        opacity: _opacity.value,
        child: child,
      ),
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: PrismColors.surface2,
          borderRadius: widget.borderRadius > 0
              ? BorderRadius.circular(widget.borderRadius)
              : null,
        ),
      ),
    );
  }
}

class PrismSkeletonGroup extends StatelessWidget {
  const PrismSkeletonGroup({
    super.key,
    this.lines = 3,
    this.lineHeight = 14,
    this.spacing = PrismSpacing.px10,
    this.width,
    this.lastLineWidth = 0.6,
  });

  final int lines;
  final double lineHeight;
  final double spacing;
  final double? width;
  final double lastLineWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(lines, (i) {
        final isLast = i == lines - 1;
        return Padding(
          padding: EdgeInsets.only(bottom: isLast ? 0 : spacing),
          child: PrismSkeleton(
            width: width != null
                ? (isLast ? width! * lastLineWidth : width)
                : isLast
                    ? 120
                    : null,
            height: lineHeight,
          ),
        );
      }),
    );
  }
}
