import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'prism_colors.dart';
import 'prism_icon.dart';
import 'prism_icons.dart';
import 'prism_typography.dart';
import 'prism_spacing.dart';

class PrismCopyButton extends StatefulWidget {
  const PrismCopyButton({
    super.key,
    required this.text,
    this.label = 'Copy',
    this.copiedLabel = 'Copied',
  });

  final String text;
  final String label;
  final String copiedLabel;

  @override
  State<PrismCopyButton> createState() => _PrismCopyButtonState();
}

class _PrismCopyButtonState extends State<PrismCopyButton> {
  bool _copied = false;

  void _copy() {
    Clipboard.setData(ClipboardData(text: widget.text));
    HapticFeedback.lightImpact();
    setState(() => _copied = true);
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) setState(() => _copied = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _copy,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: PrismSpacing.px10,
          vertical: PrismSpacing.px6,
        ),
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: PrismColors.border, width: 1.5),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            PrismIcon(
              _copied ? PrismIcons.check : PrismIcons.copy,
              size: 14,
              color: _copied ? PrismColors.lime : PrismColors.chalk.withValues(alpha: 0.5),
            ),
            const SizedBox(width: 6),
            Text(
              _copied ? widget.copiedLabel.toUpperCase() : widget.label.toUpperCase(),
              style: PrismTypography.label.copyWith(
                fontSize: 10,
                color: _copied ? PrismColors.lime : PrismColors.chalk.withValues(alpha: 0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
