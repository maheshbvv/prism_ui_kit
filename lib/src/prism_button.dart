import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'prism_colors.dart';
import 'prism_typography.dart';
import 'prism_variant.dart';
import 'prism_size.dart';
import 'prism_spinner.dart';

class PrismButton extends StatefulWidget {
  const PrismButton({
    super.key,
    required this.label,
    this.onPressed,
    this.variant = PrismVariant.primary,
    this.size = PrismSize.md,
    this.leading,
    this.trailing,
    this.isLoading = false,
    this.isFullWidth = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final PrismVariant variant;
  final PrismSize size;
  final Widget? leading;
  final Widget? trailing;
  final bool isLoading;
  final bool isFullWidth;

  @override
  State<PrismButton> createState() => _PrismButtonState();
}

class _PrismButtonState extends State<PrismButton>
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
    _press = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _ctrl, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  void _onTapDown(_) => _ctrl.forward();
  void _onTapUp(_) => _ctrl.reverse();
  void _onTapCancel() => _ctrl.reverse();

  @override
  Widget build(BuildContext context) {
    final disabled = widget.onPressed == null || widget.isLoading;

    final Color bg;
    final Color fg;
    final Color border;
    (bg, fg, border) = switch (widget.variant) {
      PrismVariant.primary => (
          disabled ? PrismColors.surface3 : PrismColors.amber,
          disabled ? PrismColors.surface3 : PrismColors.ink,
          disabled ? PrismColors.surface3 : PrismColors.amber,
        ),
      PrismVariant.ghost => (
          Colors.transparent,
          disabled ? PrismColors.surface3 : PrismColors.chalk,
          disabled ? PrismColors.surface3 : PrismColors.chalk,
        ),
      PrismVariant.danger => (
          disabled ? PrismColors.surface3 : PrismColors.coral,
          disabled ? PrismColors.surface3 : PrismColors.chalk,
          disabled ? PrismColors.surface3 : PrismColors.coral,
        ),
      PrismVariant.flat => (
          Colors.transparent,
          disabled ? PrismColors.surface3 : PrismColors.amber,
          Colors.transparent,
        ),
    };

    final double h;
    final double hPad;
    final TextStyle textStyle;
    (h, hPad, textStyle) = switch (widget.size) {
      PrismSize.sm => (32.0, 14.0, PrismTypography.label),
      PrismSize.md => (44.0, 20.0, PrismTypography.headingS),
      PrismSize.lg =>
        (56.0, 28.0, PrismTypography.bodyL.copyWith(fontWeight: FontWeight.w700)),
    };

    return GestureDetector(
      onTapDown: disabled ? null : _onTapDown,
      onTapUp: disabled ? null : _onTapUp,
      onTapCancel: disabled ? null : _onTapCancel,
      onTap: disabled
          ? null
          : () {
              HapticFeedback.lightImpact();
              widget.onPressed!();
            },
      child: ScaleTransition(
        scale: _press,
        child: SizedBox(
          height: h,
          width: widget.isFullWidth ? double.infinity : null,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: hPad),
            decoration: BoxDecoration(
              color: bg,
              border: Border.all(color: border, width: 1.5),
            ),
            child: Row(
              mainAxisSize: widget.isFullWidth
                  ? MainAxisSize.max
                  : MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (widget.isLoading) ...[
                  PrismSpinner(color: fg, size: 14),
                  const SizedBox(width: 8),
                ] else if (widget.leading != null) ...[
                  IconTheme(
                    data: IconThemeData(color: fg, size: 16),
                    child: widget.leading!,
                  ),
                  const SizedBox(width: 8),
                ],
                Text(
                  widget.label.toUpperCase(),
                  style: textStyle.copyWith(
                    color: fg,
                    letterSpacing: 1.2,
                  ),
                ),
                if (widget.trailing != null) ...[
                  const SizedBox(width: 8),
                  IconTheme(
                    data: IconThemeData(color: fg, size: 16),
                    child: widget.trailing!,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
