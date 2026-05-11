import 'package:flutter/material.dart';

class PrismAdaptivePageTransition extends PageRouteBuilder {
  PrismAdaptivePageTransition({
    required Widget page,
    super.settings,
    Duration duration = const Duration(milliseconds: 250),
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.15, 0),
                end: Offset.zero,
              ).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeOut,
                ),
              ),
              child: FadeTransition(
                opacity: animation,
                child: child,
              ),
            );
          },
          transitionDuration: duration,
          reverseTransitionDuration: duration,
        );

  static Route create({
    required Widget page,
    Duration duration = const Duration(milliseconds: 250),
  }) {
    return PrismAdaptivePageTransition(page: page, duration: duration);
  }
}
