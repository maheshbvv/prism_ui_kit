import 'package:flutter/material.dart';
import 'prism_colors.dart';
import 'prism_typography.dart';
import 'prism_spacing.dart';

class PrismTooltip extends StatefulWidget {
  const PrismTooltip({
    super.key,
    required this.message,
    required this.child,
    this.duration = const Duration(seconds: 2),
  });

  final String message;
  final Widget child;
  final Duration duration;

  @override
  State<PrismTooltip> createState() => _PrismTooltipState();
}

class _PrismTooltipState extends State<PrismTooltip>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _fade;
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    _fade = Tween<double>(begin: 0, end: 1).animate(_ctrl);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  void _show() {
    setState(() => _visible = true);
    _ctrl.forward();
    Future.delayed(widget.duration, () {
      if (mounted) {
        _ctrl.reverse().then((_) {
          if (mounted) setState(() => _visible = false);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: _show,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          widget.child,
          if (_visible)
            Positioned(
              top: -36,
              left: 0,
              right: 0,
              child: FadeTransition(
                opacity: _fade,
                child: Material(
                  color: Colors.transparent,
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: PrismSpacing.px8,
                        vertical: PrismSpacing.px4,
                      ),
                      decoration: BoxDecoration(
                        color: PrismColors.ink,
                        border: Border.all(color: PrismColors.amber, width: 1),
                      ),
                      child: Text(
                        widget.message.toUpperCase(),
                        style: PrismTypography.label.copyWith(
                          fontSize: 9,
                          color: PrismColors.amber,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
