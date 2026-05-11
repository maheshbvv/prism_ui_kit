import 'package:flutter/material.dart';
import 'prism_colors.dart';

class PrismTypography {
  PrismTypography._();

  static const fontDisplay = 'serif';
  static const fontMono = 'monospace';
  static const fontSans = 'sans-serif';

  static const TextStyle displayXL = TextStyle(
    fontSize: 64,
    fontWeight: FontWeight.w900,
    letterSpacing: -3.0,
    height: 0.92,
    color: PrismColors.chalk,
  );

  static const TextStyle displayL = TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.w900,
    letterSpacing: -2.0,
    height: 0.95,
    color: PrismColors.chalk,
  );

  static const TextStyle displayM = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w800,
    letterSpacing: -1.5,
    height: 1.0,
    color: PrismColors.chalk,
  );

  static const TextStyle headingL = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.5,
    height: 1.15,
    color: PrismColors.chalk,
  );

  static const TextStyle headingM = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.3,
    height: 1.2,
    color: PrismColors.chalk,
  );

  static const TextStyle headingS = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.5,
    height: 1.3,
    color: PrismColors.chalk,
  );

  static const TextStyle bodyL = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.1,
    height: 1.6,
    color: PrismColors.chalk,
  );

  static const TextStyle bodyM = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.1,
    height: 1.55,
    color: PrismColors.chalk,
  );

  static const TextStyle bodyS = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.2,
    height: 1.5,
    color: PrismColors.chalk,
  );

  static const TextStyle label = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w700,
    letterSpacing: 1.5,
    height: 1.3,
    color: PrismColors.chalk,
  );

  static const TextStyle mono = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.0,
    height: 1.5,
    fontFamily: 'monospace',
    color: PrismColors.chalk,
  );
}
