import 'package:flutter/material.dart';
import 'prism_colors.dart';
import 'prism_icon.dart';
import 'prism_icons.dart';
import 'prism_typography.dart';
import 'prism_spacing.dart';
import 'prism_toast_variant.dart';

class PrismToast {
  PrismToast._();

  static void show(
    BuildContext context, {
    required String message,
    PrismToastVariant variant = PrismToastVariant.info,
    Duration duration = const Duration(seconds: 3),
  }) {
    final (accent, icon) = switch (variant) {
      PrismToastVariant.success => (PrismColors.lime, PrismIcons.check),
      PrismToastVariant.error => (PrismColors.coral, PrismIcons.close),
      PrismToastVariant.warning => (PrismColors.amber, PrismIcons.alertTriangle),
      PrismToastVariant.info => (PrismColors.sky, PrismIcons.info),
    };

    final overlay = Overlay.of(context);
    late OverlayEntry entry;

    entry = OverlayEntry(
      builder: (_) => _PrismToastWidget(
        message: message,
        accent: accent,
        icon: icon,
        duration: duration,
        onDismiss: () => entry.remove(),
      ),
    );

    overlay.insert(entry);
  }
}

class _PrismToastWidget extends StatefulWidget {
  const _PrismToastWidget({
    required this.message,
    required this.accent,
    required this.icon,
    required this.duration,
    required this.onDismiss,
  });

  final String message;
  final Color accent;
  final String icon;
  final Duration duration;
  final VoidCallback onDismiss;

  @override
  State<_PrismToastWidget> createState() => _PrismToastWidgetState();
}

class _PrismToastWidgetState extends State<_PrismToastWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<Offset> _slide;
  late Animation<double> _fade;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _slide = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOut));
    _fade = Tween<double>(begin: 0, end: 1).animate(_ctrl);

    _ctrl.forward();

    Future.delayed(widget.duration, () async {
      await _ctrl.reverse();
      widget.onDismiss();
    });
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 40,
      left: 20,
      right: 20,
      child: SlideTransition(
        position: _slide,
        child: FadeTransition(
          opacity: _fade,
          child: Material(
            color: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: PrismSpacing.px16,
                vertical: PrismSpacing.px12,
              ),
              decoration: BoxDecoration(
                color: PrismColors.surface2,
                border: Border(
                  left: BorderSide(color: widget.accent, width: 3),
                  top: const BorderSide(color: PrismColors.border),
                  right: const BorderSide(color: PrismColors.border),
                  bottom: const BorderSide(color: PrismColors.border),
                ),
              ),
              child: Row(
                children: [
                  PrismIcon(widget.icon, color: widget.accent, size: 18),
                  const SizedBox(width: PrismSpacing.px12),
                  Expanded(
                    child: Text(
                      widget.message,
                      style: PrismTypography.bodyM.copyWith(
                        color: PrismColors.chalk.withValues(alpha: 0.85),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
