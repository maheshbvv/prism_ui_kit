import 'package:flutter/material.dart';
import 'prism_colors.dart';

class PrismTheme {
  PrismTheme._();

  static ThemeData get dark => ThemeData(
        useMaterial3: false,
        scaffoldBackgroundColor: PrismColors.ink,
        colorScheme: const ColorScheme.dark(
          surface: PrismColors.surface1,
          primary: PrismColors.amber,
          secondary: PrismColors.lime,
          error: PrismColors.coral,
        ),
        splashFactory: NoSplash.splashFactory,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        fontFamily: 'sans-serif',
      );

  static ThemeData get light => ThemeData(
        useMaterial3: false,
        scaffoldBackgroundColor: PrismColors.chalk,
        colorScheme: const ColorScheme.light(
          surface: PrismColors.chalkDim,
          primary: PrismColors.ink,
          secondary: PrismColors.amber,
          error: PrismColors.coral,
        ),
        splashFactory: NoSplash.splashFactory,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        fontFamily: 'sans-serif',
      );
}
