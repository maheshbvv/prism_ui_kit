import 'package:flutter/material.dart';
import 'prism_colors.dart';
import 'prism_icon.dart';
import 'prism_icons.dart';
import 'prism_typography.dart';
import 'prism_spacing.dart';
import 'prism_toast_variant.dart';

class PrismInfoBanner extends StatefulWidget {
  const PrismInfoBanner({
    super.key,
    required this.message,
    this.variant = PrismToastVariant.info,
    this.actionLabel,
    this.onAction,
    this.dismissible = true,
  });

  final String message;
  final PrismToastVariant variant;
  final String? actionLabel;
  final VoidCallback? onAction;
  final bool dismissible;

  @override
  State<PrismInfoBanner> createState() => _PrismInfoBannerState();
}

class _PrismInfoBannerState extends State<PrismInfoBanner> {
  bool _dismissed = false;

  @override
  Widget build(BuildContext context) {
    if (_dismissed) return const SizedBox.shrink();

    final (accent, icon) = switch (widget.variant) {
      PrismToastVariant.success => (PrismColors.lime, PrismIcons.checkCircle),
      PrismToastVariant.error => (PrismColors.coral, PrismIcons.alertCircle),
      PrismToastVariant.warning => (PrismColors.amber, PrismIcons.alertTriangle),
      PrismToastVariant.info => (PrismColors.sky, PrismIcons.info),
    };

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: PrismSpacing.px16,
        vertical: PrismSpacing.px12,
      ),
      decoration: BoxDecoration(
        color: PrismColors.surface1,
        border: Border(
          left: BorderSide(color: accent, width: 3),
          bottom: const BorderSide(color: PrismColors.border, width: 1),
        ),
      ),
      child: Row(
        children: [
          PrismIcon(icon, color: accent, size: 18),
          const SizedBox(width: PrismSpacing.px12),
          Expanded(
            child: Text(
              widget.message,
              style: PrismTypography.bodyM.copyWith(
                color: PrismColors.chalk.withValues(alpha: 0.85),
              ),
            ),
          ),
          if (widget.actionLabel != null && widget.onAction != null) ...[
            GestureDetector(
              onTap: widget.onAction,
              child: Text(
                widget.actionLabel!.toUpperCase(),
                style: PrismTypography.label.copyWith(color: accent),
              ),
            ),
            const SizedBox(width: PrismSpacing.px12),
          ],
          if (widget.dismissible)
            GestureDetector(
              key: const Key('prism_info_banner_dismiss'),
              behavior: HitTestBehavior.opaque,
              onTap: () => setState(() => _dismissed = true),
              child: PrismIcon(
                PrismIcons.close,
                size: 16,
                color: PrismColors.chalk.withValues(alpha: 0.4),
              ),
            ),
        ],
      ),
    );
  }
}
