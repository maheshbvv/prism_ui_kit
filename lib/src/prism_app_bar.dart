import 'package:flutter/material.dart';
import 'prism_colors.dart';
import 'prism_typography.dart';
import 'prism_spacing.dart';

class PrismAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PrismAppBar({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.actions = const [],
    this.accentLine = true,
  });

  final String title;
  final String? subtitle;
  final Widget? leading;
  final List<Widget> actions;
  final bool accentLine;

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60 + MediaQuery.of(context).padding.top,
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      decoration: BoxDecoration(
        color: PrismColors.surface1,
        border: Border(
          bottom: BorderSide(
            color: accentLine ? PrismColors.amber : PrismColors.border,
            width: accentLine ? 2 : 1,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: PrismSpacing.px20),
        child: Row(
          children: [
            if (leading != null) ...[
              leading!,
              const SizedBox(width: PrismSpacing.px12),
            ],
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: PrismTypography.headingM),
                  if (subtitle != null)
                    Text(
                      subtitle!,
                      style: PrismTypography.bodyS.copyWith(
                        color: PrismColors.chalk.withValues(alpha: 0.4),
                      ),
                    ),
                ],
              ),
            ),
            ...actions,
          ],
        ),
      ),
    );
  }
}
