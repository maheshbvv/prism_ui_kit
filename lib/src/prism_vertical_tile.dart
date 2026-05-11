import 'package:flutter/material.dart';
import 'prism_colors.dart';
import 'prism_icon.dart';
import 'prism_icons.dart';
import 'prism_typography.dart';
import 'prism_spacing.dart';

class PrismVerticalTile extends StatelessWidget {
  const PrismVerticalTile({
    super.key,
    required this.title,
    this.subtitle,
    this.imageUrl,
    this.onTap,
    this.width = 160,
    this.imageHeight = 120,
  });

  final String title;
  final String? subtitle;
  final String? imageUrl;
  final VoidCallback? onTap;
  final double width;
  final double imageHeight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        decoration: BoxDecoration(
          color: PrismColors.surface1,
          border: Border.all(color: PrismColors.border, width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: width,
              height: imageHeight,
              color: PrismColors.surface2,
              child: imageUrl != null
                  ? Image.network(imageUrl!, fit: BoxFit.cover)
                  : Center(
                      child: PrismIcon(
                        PrismIcons.image,
                        size: 32,
                        color: PrismColors.chalk.withValues(alpha: 0.2),
                      ),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(PrismSpacing.px12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: PrismTypography.bodyM.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      subtitle!,
                      style: PrismTypography.bodyS.copyWith(
                        color: PrismColors.chalk.withValues(alpha: 0.45),
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
