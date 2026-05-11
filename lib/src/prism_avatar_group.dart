import 'package:flutter/material.dart';
import 'prism_colors.dart';
import 'prism_typography.dart';

class PrismAvatarGroup extends StatelessWidget {
  const PrismAvatarGroup({
    super.key,
    this.urls = const [],
    this.initials = const [],
    this.size = 32,
    this.max = 4,
    this.gap = 0.7,
    this.accentColor = PrismColors.amber,
  });

  final List<String> urls;
  final List<String> initials;
  final double size;
  final int max;
  final double gap;
  final Color accentColor;

  @override
  Widget build(BuildContext context) {
    final total = urls.length > initials.length ? urls.length : initials.length;
    final displayCount = total > max ? max : total;
    final overflow = total - max;

    return SizedBox(
      height: size,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ...List.generate(displayCount, (i) {
            final offset = i * (size * gap);
            return Transform.translate(
              offset: Offset(-offset, 0),
              child: Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  color: PrismColors.surface2,
                  border: Border.all(color: accentColor, width: 1.5),
                  image: i < urls.length
                      ? DecorationImage(
                          image: NetworkImage(urls[i]),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: i >= urls.length && i < initials.length
                    ? Center(
                        child: Text(
                          initials[i].toUpperCase(),
                          style: PrismTypography.headingS.copyWith(
                            fontSize: size * 0.35,
                            color: accentColor,
                          ),
                        ),
                      )
                    : null,
              ),
            );
          }),
          if (overflow > 0)
            Transform.translate(
              offset: Offset(-(displayCount * size * gap), 0),
              child: Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  color: PrismColors.surface3,
                  border: Border.all(color: PrismColors.border, width: 1.5),
                ),
                child: Center(
                  child: Text(
                    '+$overflow',
                    style: PrismTypography.label.copyWith(
                      fontSize: size * 0.3,
                      color: PrismColors.chalk.withValues(alpha: 0.5),
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
