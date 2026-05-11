import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'prism_colors.dart';
import 'prism_icon.dart';


class PrismTappableIcon extends StatefulWidget {
  const PrismTappableIcon({
    super.key,
    required this.icon,
    required this.onPressed,
    this.size = 20,
    this.color,
    this.tooltip,
  });

  final String icon;
  final VoidCallback onPressed;
  final double size;
  final Color? color;
  final String? tooltip;

  @override
  State<PrismTappableIcon> createState() => _PrismTappableIconState();
}

class _PrismTappableIconState extends State<PrismTappableIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _press;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 80),
    );
    _press = Tween<double>(begin: 1.0, end: 0.85).animate(
      CurvedAnimation(parent: _ctrl, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = widget.color ?? PrismColors.chalk;

    return GestureDetector(
      onTapDown: (_) => _ctrl.forward(),
      onTapUp: (_) => _ctrl.reverse(),
      onTapCancel: () => _ctrl.reverse(),
      onTap: () {
        HapticFeedback.lightImpact();
        widget.onPressed();
      },
      child: Tooltip(
        message: widget.tooltip ?? '',
        child: ScaleTransition(
          scale: _press,
          child: PrismIcon(widget.icon, size: widget.size, color: color),
        ),
      ),
    );
  }
}
