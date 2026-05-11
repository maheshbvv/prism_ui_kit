import 'package:flutter/material.dart';
import 'prism_colors.dart';
import 'prism_typography.dart';
import 'prism_presence.dart';

class PrismAvatar extends StatelessWidget {
  const PrismAvatar({
    super.key,
    this.imageUrl,
    this.initials,
    this.size = 40,
    this.presence,
    this.accentColor = PrismColors.amber,
  });

  final String? imageUrl;
  final String? initials;
  final double size;
  final PrismPresence? presence;
  final Color accentColor;

  @override
  Widget build(BuildContext context) {
    final presenceColor = presence == null
        ? null
        : switch (presence!) {
            PrismPresence.online => PrismColors.lime,
            PrismPresence.away => PrismColors.amber,
            PrismPresence.busy => PrismColors.coral,
            PrismPresence.offline => PrismColors.surface3,
          };

    return Stack(
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: PrismColors.surface2,
            border: Border.all(color: accentColor, width: 1.5),
            image: imageUrl != null
                ? DecorationImage(
                    image: NetworkImage(imageUrl!),
                    fit: BoxFit.cover,
                  )
                : null,
          ),
          child: imageUrl == null
              ? Center(
                  child: Text(
                    (initials ?? '?').toUpperCase(),
                    style: PrismTypography.headingS.copyWith(
                      fontSize: size * 0.3,
                      color: accentColor,
                    ),
                  ),
                )
              : null,
        ),
        if (presenceColor != null)
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: size * 0.28,
              height: size * 0.28,
              decoration: BoxDecoration(
                color: presenceColor,
                border: Border.all(color: PrismColors.surface1, width: 2),
              ),
            ),
          ),
      ],
    );
  }
}
