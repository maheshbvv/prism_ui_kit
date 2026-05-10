// ============================================================
// PRISM UI KIT — by Pendura
// Neo-brutalist editorial design system for Flutter
// ============================================================

import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ─────────────────────────────────────────────────────────────
// 1. PRISM THEME — Design Tokens
// ─────────────────────────────────────────────────────────────

class PrismColors {
  PrismColors._();

  // Base
  static const ink = Color(0xFF0A0A0A);
  static const chalk = Color(0xFFF5F2EB);
  static const chalkDim = Color(0xFFE8E4DA);
  static const chalkDimmer = Color(0xFFD4CFC3);

  // Accents
  static const amber = Color(0xFFFFB700);
  static const amberDim = Color(0xFFFFC933);
  static const lime = Color(0xFFA8E63D);
  static const coral = Color(0xFFFF4D38);
  static const sky = Color(0xFF3D8EFF);

  // Semantic
  static const success = lime;
  static const error = coral;
  static const warning = amber;
  static const info = sky;

  // Surface layers (dark mode)
  static const surface0 = Color(0xFF0A0A0A);
  static const surface1 = Color(0xFF141414);
  static const surface2 = Color(0xFF1E1E1E);
  static const surface3 = Color(0xFF282828);

  // Border
  static const border = Color(0xFF2A2A2A);
  static const borderLight = Color(0xFFE0DBD0);
}

class PrismTypography {
  PrismTypography._();

  // Display — "DM Serif Display" feel via serif weight contrast
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

class PrismSpacing {
  PrismSpacing._();

  static const double px2 = 2;
  static const double px4 = 4;
  static const double px6 = 6;
  static const double px8 = 8;
  static const double px10 = 10;
  static const double px12 = 12;
  static const double px16 = 16;
  static const double px20 = 20;
  static const double px24 = 24;
  static const double px32 = 32;
  static const double px40 = 40;
  static const double px48 = 48;
  static const double px64 = 64;
}

/// The ThemeData you can pass to MaterialApp.theme to baseline everything.
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

// ─────────────────────────────────────────────────────────────
// HELPERS
// ─────────────────────────────────────────────────────────────

enum PrismVariant { primary, ghost, danger, flat }
enum PrismSize { sm, md, lg }

// ─────────────────────────────────────────────────────────────
// 2. PRISM BUTTON
// ─────────────────────────────────────────────────────────────

class PrismButton extends StatefulWidget {
  const PrismButton({
    super.key,
    required this.label,
    this.onPressed,
    this.variant = PrismVariant.primary,
    this.size = PrismSize.md,
    this.leading,
    this.trailing,
    this.isLoading = false,
    this.isFullWidth = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final PrismVariant variant;
  final PrismSize size;
  final Widget? leading;
  final Widget? trailing;
  final bool isLoading;
  final bool isFullWidth;

  @override
  State<PrismButton> createState() => _PrismButtonState();
}

class _PrismButtonState extends State<PrismButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _press;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 80),
    );
    _press = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _ctrl, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  void _onTapDown(_) => _ctrl.forward();
  void _onTapUp(_) => _ctrl.reverse();
  void _onTapCancel() => _ctrl.reverse();

  @override
  Widget build(BuildContext context) {
    final disabled = widget.onPressed == null || widget.isLoading;

    final Color bg; final Color fg; final Color border;
    (bg, fg, border) = switch (widget.variant) {
      PrismVariant.primary => (
          disabled ? PrismColors.surface3 : PrismColors.amber,
          disabled ? PrismColors.surface3 : PrismColors.ink,
          disabled ? PrismColors.surface3 : PrismColors.amber,
        ),
      PrismVariant.ghost => (
          Colors.transparent,
          disabled ? PrismColors.surface3 : PrismColors.chalk,
          disabled ? PrismColors.surface3 : PrismColors.chalk,
        ),
      PrismVariant.danger => (
          disabled ? PrismColors.surface3 : PrismColors.coral,
          disabled ? PrismColors.surface3 : PrismColors.chalk,
          disabled ? PrismColors.surface3 : PrismColors.coral,
        ),
      PrismVariant.flat => (
          Colors.transparent,
          disabled ? PrismColors.surface3 : PrismColors.amber,
          Colors.transparent,
        ),
    };

    final double h; final double hPad; final TextStyle textStyle;
    (h, hPad, textStyle) = switch (widget.size) {
      PrismSize.sm => (32.0, 14.0, PrismTypography.label),
      PrismSize.md => (44.0, 20.0, PrismTypography.headingS),
      PrismSize.lg => (56.0, 28.0, PrismTypography.bodyL.copyWith(fontWeight: FontWeight.w700)),
    };

    return GestureDetector(
      onTapDown: disabled ? null : _onTapDown,
      onTapUp: disabled ? null : _onTapUp,
      onTapCancel: disabled ? null : _onTapCancel,
      onTap: disabled ? null : () {
        HapticFeedback.lightImpact();
        widget.onPressed!();
      },
      child: ScaleTransition(
        scale: _press,
        child: SizedBox(
          height: h,
          width: widget.isFullWidth ? double.infinity : null,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: hPad),
            decoration: BoxDecoration(
              color: bg,
              border: Border.all(color: border, width: 1.5),
            ),
            child: Row(
              mainAxisSize: widget.isFullWidth
                  ? MainAxisSize.max
                  : MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (widget.isLoading) ...[
                  _PrismSpinner(color: fg, size: 14),
                  const SizedBox(width: 8),
                ] else if (widget.leading != null) ...[
                  IconTheme(
                    data: IconThemeData(color: fg, size: 16),
                    child: widget.leading!,
                  ),
                  const SizedBox(width: 8),
                ],
                Text(
                  widget.label.toUpperCase(),
                  style: textStyle.copyWith(
                    color: fg,
                    letterSpacing: 1.2,
                  ),
                ),
                if (widget.trailing != null) ...[
                  const SizedBox(width: 8),
                  IconTheme(
                    data: IconThemeData(color: fg, size: 16),
                    child: widget.trailing!,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PrismSpinner extends StatefulWidget {
  const _PrismSpinner({required this.color, this.size = 16});
  final Color color;
  final double size;

  @override
  State<_PrismSpinner> createState() => _PrismSpinnerState();
}

class _PrismSpinnerState extends State<_PrismSpinner>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _ctrl,
      child: CustomPaint(
        size: Size(widget.size, widget.size),
        painter: _SpinnerPainter(widget.color),
      ),
    );
  }
}

class _SpinnerPainter extends CustomPainter {
  _SpinnerPainter(this.color);
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.square;
    canvas.drawArc(
      Rect.fromLTWH(0, 0, size.width, size.height),
      -math.pi / 2,
      math.pi * 1.4,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(_) => false;
}

// ─────────────────────────────────────────────────────────────
// 3. PRISM INPUT
// ─────────────────────────────────────────────────────────────

class PrismInput extends StatefulWidget {
  const PrismInput({
    super.key,
    this.label,
    this.hint,
    this.helper,
    this.error,
    this.controller,
    this.obscureText = false,
    this.keyboardType,
    this.onChanged,
    this.onSubmitted,
    this.prefix,
    this.suffix,
    this.maxLines = 1,
    this.autofocus = false,
  });

  final String? label;
  final String? hint;
  final String? helper;
  final String? error;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final Widget? prefix;
  final Widget? suffix;
  final int? maxLines;
  final bool autofocus;

  @override
  State<PrismInput> createState() => _PrismInputState();
}

class _PrismInputState extends State<PrismInput>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _borderAnim;
  bool _focused = false;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    _borderAnim = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _ctrl, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hasError = widget.error != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.label != null) ...[
          Text(
            widget.label!.toUpperCase(),
            style: PrismTypography.label.copyWith(
              color: hasError
                  ? PrismColors.coral
                  : _focused
                      ? PrismColors.amber
                      : PrismColors.chalk.withValues(alpha: 0.5),
            ),
          ),
          const SizedBox(height: PrismSpacing.px8),
        ],
        AnimatedBuilder(
          animation: _borderAnim,
          builder: (context, child) {
            final borderColor = hasError
                ? PrismColors.coral
                : Color.lerp(
                    PrismColors.border,
                    PrismColors.amber,
                    _borderAnim.value,
                  )!;
            return Container(
              decoration: BoxDecoration(
                color: PrismColors.surface1,
                border: Border.all(color: borderColor, width: 1.5),
              ),
              child: child,
            );
          },
          child: Focus(
            onFocusChange: (focused) {
              setState(() => _focused = focused);
              if (focused) {
                _ctrl.forward();
              } else {
                _ctrl.reverse();
              }
            },
            child: TextField(
              controller: widget.controller,
              obscureText: widget.obscureText,
              keyboardType: widget.keyboardType,
              onChanged: widget.onChanged,
              onSubmitted: widget.onSubmitted,
              maxLines: widget.maxLines,
              autofocus: widget.autofocus,
              style: PrismTypography.bodyM.copyWith(color: PrismColors.chalk),
              cursorColor: PrismColors.amber,
              cursorWidth: 2,
              cursorRadius: Radius.zero,
              decoration: InputDecoration(
                hintText: widget.hint,
                hintStyle: PrismTypography.bodyM
                    .copyWith(color: PrismColors.chalk.withValues(alpha: 0.25)),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: PrismSpacing.px16,
                  vertical: PrismSpacing.px12,
                ),
                prefixIcon: widget.prefix != null
                    ? Padding(
                        padding: const EdgeInsets.only(
                            left: PrismSpacing.px16,
                            right: PrismSpacing.px8),
                        child: IconTheme(
                          data: IconThemeData(
                            color: PrismColors.chalk.withValues(alpha: 0.4),
                            size: 18,
                          ),
                          child: widget.prefix!,
                        ),
                      )
                    : null,
                prefixIconConstraints:
                    const BoxConstraints(minWidth: 0, minHeight: 0),
                suffixIcon: widget.suffix != null
                    ? Padding(
                        padding: const EdgeInsets.only(right: PrismSpacing.px12),
                        child: IconTheme(
                          data: IconThemeData(
                            color: PrismColors.chalk.withValues(alpha: 0.4),
                            size: 18,
                          ),
                          child: widget.suffix!,
                        ),
                      )
                    : null,
                suffixIconConstraints:
                    const BoxConstraints(minWidth: 0, minHeight: 0),
              ),
            ),
          ),
        ),
        if (hasError) ...[
          const SizedBox(height: PrismSpacing.px6),
          Row(
            children: [
              Container(
                width: 3,
                height: 12,
                color: PrismColors.coral,
              ),
              const SizedBox(width: 6),
              Text(
                widget.error!,
                style:
                    PrismTypography.bodyS.copyWith(color: PrismColors.coral),
              ),
            ],
          ),
        ] else if (widget.helper != null) ...[
          const SizedBox(height: PrismSpacing.px6),
          Text(
            widget.helper!,
            style: PrismTypography.bodyS
                .copyWith(color: PrismColors.chalk.withValues(alpha: 0.4)),
          ),
        ],
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────
// 4. PRISM CARD
// ─────────────────────────────────────────────────────────────

class PrismCard extends StatelessWidget {
  const PrismCard({
    super.key,
    required this.child,
    this.accent,
    this.label,
    this.onTap,
    this.padding,
  });

  final Widget child;
  final Color? accent;
  final String? label;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final accentColor = accent ?? PrismColors.amber;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: PrismColors.surface1,
          border: Border(
            left: BorderSide(color: accentColor, width: 3),
            top: const BorderSide(color: PrismColors.border, width: 1),
            right: const BorderSide(color: PrismColors.border, width: 1),
            bottom: const BorderSide(color: PrismColors.border, width: 1),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (label != null)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: PrismSpacing.px16,
                  vertical: PrismSpacing.px8,
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom:
                        BorderSide(color: accentColor.withValues(alpha: 0.3), width: 1),
                  ),
                ),
                child: Text(
                  label!.toUpperCase(),
                  style: PrismTypography.label.copyWith(color: accentColor),
                ),
              ),
            Padding(
              padding: padding ??
                  const EdgeInsets.all(PrismSpacing.px20),
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
// 5. PRISM BADGE
// ─────────────────────────────────────────────────────────────

enum PrismBadgeVariant { success, error, warning, info, neutral, accent }

class PrismBadge extends StatelessWidget {
  const PrismBadge({
    super.key,
    required this.label,
    this.variant = PrismBadgeVariant.neutral,
    this.dot = false,
  });

  final String label;
  final PrismBadgeVariant variant;
  final bool dot;

  @override
  Widget build(BuildContext context) {
    final (bg, fg) = switch (variant) {
      PrismBadgeVariant.success => (PrismColors.lime.withValues(alpha: 0.15), PrismColors.lime),
      PrismBadgeVariant.error => (PrismColors.coral.withValues(alpha: 0.15), PrismColors.coral),
      PrismBadgeVariant.warning => (PrismColors.amber.withValues(alpha: 0.15), PrismColors.amber),
      PrismBadgeVariant.info => (PrismColors.sky.withValues(alpha: 0.15), PrismColors.sky),
      PrismBadgeVariant.neutral => (PrismColors.surface2, PrismColors.chalk.withValues(alpha: 0.6)),
      PrismBadgeVariant.accent => (PrismColors.amber, PrismColors.ink),
    };

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: PrismSpacing.px8,
        vertical: PrismSpacing.px4,
      ),
      decoration: BoxDecoration(
        color: bg,
        border: Border.all(color: fg.withValues(alpha: 0.3), width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (dot) ...[
            Container(width: 5, height: 5, color: fg),
            const SizedBox(width: 5),
          ],
          Text(
            label.toUpperCase(),
            style: PrismTypography.label.copyWith(
              color: fg,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
// 6. PRISM TAG
// ─────────────────────────────────────────────────────────────

class PrismTag extends StatelessWidget {
  const PrismTag({super.key, required this.label, this.onRemove});

  final String label;
  final VoidCallback? onRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: PrismSpacing.px8,
        vertical: PrismSpacing.px4,
      ),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: PrismColors.border, width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: PrismTypography.mono.copyWith(
              fontSize: 11,
              color: PrismColors.chalk.withValues(alpha: 0.7),
            ),
          ),
          if (onRemove != null) ...[
            const SizedBox(width: 6),
            GestureDetector(
              onTap: onRemove,
              child: Icon(
                Icons.close,
                size: 12,
                color: PrismColors.chalk.withValues(alpha: 0.4),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
// 7. PRISM CHIP — Selectable filter chip
// ─────────────────────────────────────────────────────────────

class PrismChip extends StatelessWidget {
  const PrismChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onToggle,
    this.icon,
  });

  final String label;
  final bool selected;
  final VoidCallback onToggle;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.selectionClick();
        onToggle();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 120),
        padding: const EdgeInsets.symmetric(
          horizontal: PrismSpacing.px12,
          vertical: PrismSpacing.px6,
        ),
        decoration: BoxDecoration(
          color: selected ? PrismColors.amber : Colors.transparent,
          border: Border.all(
            color: selected ? PrismColors.amber : PrismColors.border,
            width: 1.5,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                size: 14,
                color: selected ? PrismColors.ink : PrismColors.chalk.withValues(alpha: 0.5),
              ),
              const SizedBox(width: 6),
            ],
            Text(
              label,
              style: PrismTypography.headingS.copyWith(
                color: selected ? PrismColors.ink : PrismColors.chalk.withValues(alpha: 0.6),
                letterSpacing: 0.3,
                fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
// 8. PRISM TOGGLE
// ─────────────────────────────────────────────────────────────

class PrismToggle extends StatelessWidget {
  const PrismToggle({
    super.key,
    required this.value,
    required this.onChanged,
    this.label,
    this.description,
  });

  final bool value;
  final ValueChanged<bool> onChanged;
  final String? label;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact();
        onChanged(!value);
      },
      child: Row(
        children: [
          // Toggle track
          AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            width: 44,
            height: 24,
            decoration: BoxDecoration(
              color: value ? PrismColors.amber : PrismColors.surface2,
              border: Border.all(
                color: value ? PrismColors.amber : PrismColors.border,
                width: 1.5,
              ),
            ),
            child: AnimatedAlign(
              duration: const Duration(milliseconds: 150),
              curve: Curves.easeOut,
              alignment: value ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                width: 16,
                height: 16,
                margin: const EdgeInsets.symmetric(horizontal: 3),
                color: value ? PrismColors.ink : PrismColors.chalk.withValues(alpha: 0.3),
              ),
            ),
          ),
          if (label != null) ...[
            const SizedBox(width: PrismSpacing.px12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label!,
                  style: PrismTypography.bodyM.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (description != null)
                  Text(
                    description!,
                    style: PrismTypography.bodyS.copyWith(
                      color: PrismColors.chalk.withValues(alpha: 0.4),
                    ),
                  ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
// 9. PRISM CHECKBOX
// ─────────────────────────────────────────────────────────────

class PrismCheckbox extends StatelessWidget {
  const PrismCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.label,
    this.indeterminate = false,
  });

  final bool value;
  final ValueChanged<bool> onChanged;
  final String? label;
  final bool indeterminate;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.selectionClick();
        onChanged(!value);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: value || indeterminate
                  ? PrismColors.amber
                  : Colors.transparent,
              border: Border.all(
                color: value || indeterminate
                    ? PrismColors.amber
                    : PrismColors.border,
                width: 1.5,
              ),
            ),
            child: (value || indeterminate)
                ? Center(
                    child: indeterminate
                        ? Container(
                            width: 10,
                            height: 2,
                            color: PrismColors.ink,
                          )
                        : const Icon(
                            Icons.check,
                            size: 14,
                            color: PrismColors.ink,
                          ),
                  )
                : null,
          ),
          if (label != null) ...[
            const SizedBox(width: PrismSpacing.px10),
            Text(
              label!,
              style: PrismTypography.bodyM,
            ),
          ],
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
// 10. PRISM RADIO GROUP
// ─────────────────────────────────────────────────────────────

class PrismRadioOption<T> {
  const PrismRadioOption({required this.value, required this.label, this.description});
  final T value;
  final String label;
  final String? description;
}

class PrismRadioGroup<T> extends StatelessWidget {
  const PrismRadioGroup({
    super.key,
    required this.options,
    required this.value,
    required this.onChanged,
  });

  final List<PrismRadioOption<T>> options;
  final T value;
  final ValueChanged<T> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: options.map((opt) {
        final selected = opt.value == value;
        return GestureDetector(
          onTap: () {
            HapticFeedback.selectionClick();
            onChanged(opt.value);
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: PrismSpacing.px8),
            padding: const EdgeInsets.all(PrismSpacing.px16),
            decoration: BoxDecoration(
              color: selected ? PrismColors.amber.withValues(alpha: 0.07) : PrismColors.surface1,
              border: Border.all(
                color: selected ? PrismColors.amber : PrismColors.border,
                width: selected ? 1.5 : 1,
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: selected ? PrismColors.amber : PrismColors.border,
                      width: 1.5,
                    ),
                  ),
                  child: selected
                      ? Center(
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: PrismColors.amber,
                            ),
                          ),
                        )
                      : null,
                ),
                const SizedBox(width: PrismSpacing.px12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        opt.label,
                        style: PrismTypography.bodyM.copyWith(
                          fontWeight: FontWeight.w600,
                          color: selected ? PrismColors.amber : PrismColors.chalk,
                        ),
                      ),
                      if (opt.description != null)
                        Text(
                          opt.description!,
                          style: PrismTypography.bodyS.copyWith(
                            color: PrismColors.chalk.withValues(alpha: 0.45),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

// ─────────────────────────────────────────────────────────────
// 11. PRISM SLIDER
// ─────────────────────────────────────────────────────────────

class PrismSlider extends StatelessWidget {
  const PrismSlider({
    super.key,
    required this.value,
    required this.onChanged,
    this.min = 0.0,
    this.max = 1.0,
    this.label,
    this.showValue = true,
    this.divisions,
    this.accentColor = PrismColors.amber,
  });

  final double value;
  final ValueChanged<double> onChanged;
  final double min;
  final double max;
  final String? label;
  final bool showValue;
  final int? divisions;
  final Color accentColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null || showValue)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (label != null)
                Text(
                  label!.toUpperCase(),
                  style: PrismTypography.label
                      .copyWith(color: PrismColors.chalk.withValues(alpha: 0.5)),
                ),
              if (showValue)
                Text(
                  value.toStringAsFixed(0),
                  style: PrismTypography.mono
                      .copyWith(color: accentColor, fontSize: 12),
                ),
            ],
          ),
        if (label != null || showValue) const SizedBox(height: PrismSpacing.px8),
        SliderTheme(
          data: SliderThemeData(
            trackHeight: 2,
            activeTrackColor: accentColor,
            inactiveTrackColor: PrismColors.border,
            thumbColor: accentColor,
            overlayColor: accentColor.withValues(alpha: 0.1),
            thumbShape: _SquareThumbShape(accentColor),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 12),
            trackShape: const RectangularSliderTrackShape(),
            valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
            valueIndicatorColor: accentColor,
          ),
          child: Slider(
            value: value,
            min: min,
            max: max,
            divisions: divisions,
            onChanged: onChanged,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              min.toStringAsFixed(0),
              style: PrismTypography.label.copyWith(
                color: PrismColors.chalk.withValues(alpha: 0.3),
                fontSize: 10,
              ),
            ),
            Text(
              max.toStringAsFixed(0),
              style: PrismTypography.label.copyWith(
                color: PrismColors.chalk.withValues(alpha: 0.3),
                fontSize: 10,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _SquareThumbShape extends SliderComponentShape {
  const _SquareThumbShape(this.color);
  final Color color;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) => const Size(16, 16);

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final canvas = context.canvas;
    canvas.drawRect(
      Rect.fromCenter(center: center, width: 14, height: 14),
      Paint()..color = color,
    );
    canvas.drawRect(
      Rect.fromCenter(center: center, width: 14, height: 14),
      Paint()
        ..color = PrismColors.ink
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2,
    );
  }
}

// ─────────────────────────────────────────────────────────────
// 12. PRISM DIVIDER
// ─────────────────────────────────────────────────────────────

class PrismDivider extends StatelessWidget {
  const PrismDivider({
    super.key,
    this.label,
    this.accent = false,
    this.vertical = false,
    this.height,
  });

  final String? label;
  final bool accent;
  final bool vertical;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final color = accent ? PrismColors.amber : PrismColors.border;

    if (vertical) {
      return Container(
        width: 1,
        height: height ?? double.infinity,
        color: color,
      );
    }

    if (label == null) {
      return Container(
        height: 1,
        color: color,
        margin: const EdgeInsets.symmetric(vertical: PrismSpacing.px16),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: PrismSpacing.px16),
      child: Row(
        children: [
          Expanded(child: Container(height: 1, color: color)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: PrismSpacing.px12),
            child: Text(
              label!.toUpperCase(),
              style: PrismTypography.label.copyWith(
                color: accent ? PrismColors.amber : PrismColors.chalk.withValues(alpha: 0.35),
                fontSize: 10,
              ),
            ),
          ),
          Expanded(child: Container(height: 1, color: color)),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
// 13. PRISM DIALOG
// ─────────────────────────────────────────────────────────────

class PrismDialog extends StatelessWidget {
  const PrismDialog({
    super.key,
    required this.title,
    required this.body,
    this.primaryLabel = 'Confirm',
    this.secondaryLabel = 'Cancel',
    this.onPrimary,
    this.onSecondary,
    this.accentColor = PrismColors.amber,
    this.isDestructive = false,
  });

  final String title;
  final Widget body;
  final String primaryLabel;
  final String secondaryLabel;
  final VoidCallback? onPrimary;
  final VoidCallback? onSecondary;
  final Color accentColor;
  final bool isDestructive;

  static Future<void> show(
    BuildContext context, {
    required String title,
    required Widget body,
    String primaryLabel = 'Confirm',
    String secondaryLabel = 'Cancel',
    VoidCallback? onPrimary,
    VoidCallback? onSecondary,
    bool isDestructive = false,
  }) {
    return showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Dismiss',
      barrierColor: PrismColors.ink.withValues(alpha: 0.85),
      transitionDuration: const Duration(milliseconds: 200),
      transitionBuilder: (context, animation, _, child) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.95, end: 1.0).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOut),
            ),
            child: child,
          ),
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) => Center(
        child: PrismDialog(
          title: title,
          body: body,
          primaryLabel: primaryLabel,
          secondaryLabel: secondaryLabel,
          onPrimary: onPrimary,
          onSecondary: onSecondary ?? () => Navigator.of(context).pop(),
          isDestructive: isDestructive,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final accent = isDestructive ? PrismColors.coral : accentColor;

    return Material(
      color: Colors.transparent,
      child: Container(
        width: 360,
        margin: const EdgeInsets.all(PrismSpacing.px24),
        decoration: BoxDecoration(
          color: PrismColors.surface1,
          border: Border.all(color: PrismColors.border, width: 1),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(PrismSpacing.px20),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: PrismColors.border, width: 1),
                  left: BorderSide(color: accent, width: 3),
                ),
              ),
              child: Text(
                title,
                style: PrismTypography.headingM,
              ),
            ),
            // Body
            Padding(
              padding: const EdgeInsets.all(PrismSpacing.px20),
              child: DefaultTextStyle(
                style: PrismTypography.bodyM
                    .copyWith(color: PrismColors.chalk.withValues(alpha: 0.7)),
                child: body,
              ),
            ),
            // Actions
            Container(
              padding: const EdgeInsets.all(PrismSpacing.px16),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: PrismColors.border, width: 1),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  PrismButton(
                    label: secondaryLabel,
                    variant: PrismVariant.ghost,
                    size: PrismSize.sm,
                    onPressed: onSecondary,
                  ),
                  const SizedBox(width: PrismSpacing.px8),
                  PrismButton(
                    label: primaryLabel,
                    variant: isDestructive
                        ? PrismVariant.danger
                        : PrismVariant.primary,
                    size: PrismSize.sm,
                    onPressed: onPrimary,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
// 14. PRISM TOAST
// ─────────────────────────────────────────────────────────────

enum PrismToastVariant { info, success, warning, error }

class PrismToast {
  static void show(
    BuildContext context, {
    required String message,
    PrismToastVariant variant = PrismToastVariant.info,
    Duration duration = const Duration(seconds: 3),
  }) {
    final (accent, icon) = switch (variant) {
      PrismToastVariant.success => (PrismColors.lime, Icons.check),
      PrismToastVariant.error => (PrismColors.coral, Icons.close),
      PrismToastVariant.warning => (PrismColors.amber, Icons.warning_amber),
      PrismToastVariant.info => (PrismColors.sky, Icons.info_outline),
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
  final IconData icon;
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
                  Icon(widget.icon, color: widget.accent, size: 18),
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

// ─────────────────────────────────────────────────────────────
// 15. PRISM BOTTOM SHEET
// ─────────────────────────────────────────────────────────────

class PrismBottomSheet extends StatelessWidget {
  const PrismBottomSheet({
    super.key,
    required this.title,
    required this.children,
  });

  final String title;
  final List<Widget> children;

  static Future<T?> show<T>(
    BuildContext context, {
    required String title,
    required List<Widget> children,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      backgroundColor: Colors.transparent,
      barrierColor: PrismColors.ink.withValues(alpha: 0.8),
      builder: (_) => PrismBottomSheet(title: title, children: children),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: PrismColors.surface1,
        border: Border(
          top: BorderSide(color: PrismColors.amber, width: 2),
          left: BorderSide(color: PrismColors.border),
          right: BorderSide(color: PrismColors.border),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              PrismSpacing.px20,
              PrismSpacing.px20,
              PrismSpacing.px20,
              PrismSpacing.px12,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(title, style: PrismTypography.headingM),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Icon(
                    Icons.close,
                    color: PrismColors.chalk.withValues(alpha: 0.4),
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
          const PrismDivider(),
          ...children,
          SizedBox(height: MediaQuery.of(context).padding.bottom + 16),
        ],
      ),
    );
  }
}

class PrismBottomSheetAction extends StatelessWidget {
  const PrismBottomSheetAction({
    super.key,
    required this.label,
    required this.onTap,
    this.icon,
    this.isDestructive = false,
  });

  final String label;
  final VoidCallback onTap;
  final IconData? icon;
  final bool isDestructive;

  @override
  Widget build(BuildContext context) {
    final color = isDestructive ? PrismColors.coral : PrismColors.chalk;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: PrismSpacing.px20,
          vertical: PrismSpacing.px16,
        ),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: PrismColors.border, width: 1),
          ),
        ),
        child: Row(
          children: [
            if (icon != null) ...[
              Icon(icon, size: 18, color: color.withValues(alpha: 0.6)),
              const SizedBox(width: PrismSpacing.px12),
            ],
            Text(
              label,
              style: PrismTypography.bodyM.copyWith(
                color: color,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
// 16. PRISM NAV BAR
// ─────────────────────────────────────────────────────────────

class PrismNavBarItem {
  const PrismNavBarItem({
    required this.icon,
    required this.selectedIcon,
    required this.label,
  });

  final IconData icon;
  final IconData selectedIcon;
  final String label;
}

class PrismNavBar extends StatelessWidget {
  const PrismNavBar({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
  });

  final List<PrismNavBarItem> items;
  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64 + MediaQuery.of(context).padding.bottom,
      decoration: const BoxDecoration(
        color: PrismColors.surface1,
        border: Border(
          top: BorderSide(color: PrismColors.border, width: 1),
        ),
      ),
      child: Row(
        children: List.generate(items.length, (i) {
          final item = items[i];
          final selected = i == currentIndex;
          return Expanded(
            child: GestureDetector(
              onTap: () {
                HapticFeedback.selectionClick();
                onTap(i);
              },
              behavior: HitTestBehavior.opaque,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    padding: const EdgeInsets.symmetric(
                      horizontal: PrismSpacing.px12,
                      vertical: PrismSpacing.px4,
                    ),
                    decoration: BoxDecoration(
                      color: selected
                          ? PrismColors.amber.withValues(alpha: 0.12)
                          : Colors.transparent,
                      border: selected
                          ? Border.all(
                              color: PrismColors.amber.withValues(alpha: 0.3),
                              width: 1,
                            )
                          : null,
                    ),
                    child: Icon(
                      selected ? item.selectedIcon : item.icon,
                      color: selected
                          ? PrismColors.amber
                          : PrismColors.chalk.withValues(alpha: 0.35),
                      size: 20,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.label.toUpperCase(),
                    style: PrismTypography.label.copyWith(
                      fontSize: 9,
                      color: selected
                          ? PrismColors.amber
                          : PrismColors.chalk.withValues(alpha: 0.35),
                      letterSpacing: 0.8,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
// 17. PRISM APP BAR
// ─────────────────────────────────────────────────────────────

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

// ─────────────────────────────────────────────────────────────
// 18. PRISM AVATAR
// ─────────────────────────────────────────────────────────────

enum PrismPresence { online, away, busy, offline }

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

// ─────────────────────────────────────────────────────────────
// 19. PRISM PROGRESS
// ─────────────────────────────────────────────────────────────

class PrismLinearProgress extends StatelessWidget {
  const PrismLinearProgress({
    super.key,
    required this.value,
    this.label,
    this.showPercent = true,
    this.accentColor = PrismColors.amber,
    this.height = 6,
    this.segments,
  });

  final double value; // 0.0 to 1.0
  final String? label;
  final bool showPercent;
  final Color accentColor;
  final double height;
  final int? segments; // null = solid, >0 = segmented

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null || showPercent)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (label != null)
                Text(
                  label!.toUpperCase(),
                  style: PrismTypography.label.copyWith(
                    color: PrismColors.chalk.withValues(alpha: 0.5),
                  ),
                ),
              if (showPercent)
                Text(
                  '${(value * 100).toStringAsFixed(0)}%',
                  style: PrismTypography.mono.copyWith(
                    fontSize: 11,
                    color: accentColor,
                  ),
                ),
            ],
          ),
        if (label != null || showPercent) const SizedBox(height: 6),
        LayoutBuilder(builder: (context, constraints) {
          return Stack(
            children: [
              Container(
                width: constraints.maxWidth,
                height: height,
                color: PrismColors.surface2,
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeOut,
                width: constraints.maxWidth * value.clamp(0.0, 1.0),
                height: height,
                color: accentColor,
              ),
              if (segments != null)
                ...List.generate(segments! - 1, (i) {
                  final x = constraints.maxWidth * (i + 1) / segments!;
                  return Positioned(
                    left: x - 1,
                    top: 0,
                    child: Container(
                      width: 2,
                      height: height,
                      color: PrismColors.surface1,
                    ),
                  );
                }),
            ],
          );
        }),
      ],
    );
  }
}

class PrismCircularProgress extends StatefulWidget {
  const PrismCircularProgress({
    super.key,
    required this.value,
    this.size = 64,
    this.strokeWidth = 4,
    this.accentColor = PrismColors.amber,
    this.label,
    this.indeterminate = false,
  });

  final double value;
  final double size;
  final double strokeWidth;
  final Color accentColor;
  final String? label;
  final bool indeterminate;

  @override
  State<PrismCircularProgress> createState() => _PrismCircularProgressState();
}

class _PrismCircularProgressState extends State<PrismCircularProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    if (widget.indeterminate) _ctrl.repeat();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: widget.size,
          height: widget.size,
          child: widget.indeterminate
              ? RotationTransition(
                  turns: _ctrl,
                  child: CustomPaint(
                    painter: _CircularProgressPainter(
                      value: 0.3,
                      color: widget.accentColor,
                      strokeWidth: widget.strokeWidth,
                    ),
                  ),
                )
              : CustomPaint(
                  painter: _CircularProgressPainter(
                    value: widget.value,
                    color: widget.accentColor,
                    strokeWidth: widget.strokeWidth,
                  ),
                  child: Center(
                    child: Text(
                      '${(widget.value * 100).toInt()}',
                      style: PrismTypography.mono.copyWith(
                        fontSize: widget.size * 0.2,
                        color: widget.accentColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
        ),
        if (widget.label != null) ...[
          const SizedBox(height: 6),
          Text(
            widget.label!.toUpperCase(),
            style: PrismTypography.label.copyWith(
              color: PrismColors.chalk.withValues(alpha: 0.4),
              fontSize: 10,
            ),
          ),
        ],
      ],
    );
  }
}

class _CircularProgressPainter extends CustomPainter {
  const _CircularProgressPainter({
    required this.value,
    required this.color,
    required this.strokeWidth,
  });

  final double value;
  final Color color;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    // Track
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      0,
      math.pi * 2,
      false,
      Paint()
        ..color = PrismColors.surface2
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.square,
    );

    // Progress
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      math.pi * 2 * value,
      false,
      Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.square,
    );
  }

  @override
  bool shouldRepaint(_CircularProgressPainter old) =>
      old.value != value || old.color != color;
}

// ─────────────────────────────────────────────────────────────
// 20. PRISM LIST TILE
// ─────────────────────────────────────────────────────────────

class PrismListTile extends StatelessWidget {
  const PrismListTile({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
    this.accentLeft,
    this.dense = false,
  });

  final String title;
  final String? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onTap;
  final Color? accentLeft;
  final bool dense;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: PrismSpacing.px16,
          vertical: dense ? PrismSpacing.px10 : PrismSpacing.px16,
        ),
        decoration: BoxDecoration(
          color: PrismColors.surface1,
          border: Border(
            left: accentLeft != null
                ? BorderSide(color: accentLeft!, width: 3)
                : BorderSide.none,
            bottom: const BorderSide(color: PrismColors.border, width: 1),
          ),
        ),
        child: Row(
          children: [
            if (leading != null) ...[
              leading!,
              const SizedBox(width: PrismSpacing.px12),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: PrismTypography.bodyM.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 2),
                    Text(
                      subtitle!,
                      style: PrismTypography.bodyS.copyWith(
                        color: PrismColors.chalk.withValues(alpha: 0.45),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            if (trailing != null) ...[
              const SizedBox(width: PrismSpacing.px12),
              DefaultTextStyle(
                style: PrismTypography.bodyS.copyWith(
                  color: PrismColors.chalk.withValues(alpha: 0.4),
                ),
                child: trailing!,
              ),
            ] else if (onTap != null)
              Icon(
                Icons.arrow_forward,
                size: 16,
                color: PrismColors.chalk.withValues(alpha: 0.25),
              ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
// DEMO / KITCHEN SINK
// ─────────────────────────────────────────────────────────────

void main() {
  runApp(const PrismKitchenSink());
}

class PrismKitchenSink extends StatelessWidget {
  const PrismKitchenSink({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prism UI Kit',
      theme: PrismTheme.dark,
      debugShowCheckedModeBanner: false,
      home: const _KitchenSinkPage(),
    );
  }
}

class _KitchenSinkPage extends StatefulWidget {
  const _KitchenSinkPage();

  @override
  State<_KitchenSinkPage> createState() => _KitchenSinkPageState();
}

class _KitchenSinkPageState extends State<_KitchenSinkPage> {
  bool _toggle = false;
  bool _check1 = true;
  bool _check2 = false;
  bool _check3 = false;
  String _radio = 'a';
  double _sliderVal = 60;
  int _navIndex = 0;
  final List<bool> _chips = [true, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PrismColors.ink,
      appBar: PrismAppBar(
        title: 'PRISM',
        subtitle: 'UI Kit — Dark Edition',
        actions: [
          GestureDetector(
            onTap: () => PrismToast.show(
              context,
              message: 'Prism loaded successfully.',
              variant: PrismToastVariant.success,
            ),
            child: Icon(
              Icons.bolt,
              color: PrismColors.amber,
              size: 22,
            ),
          ),
          const SizedBox(width: PrismSpacing.px20),
        ],
      ),
      bottomNavigationBar: PrismNavBar(
        currentIndex: _navIndex,
        onTap: (i) => setState(() => _navIndex = i),
        items: const [
          PrismNavBarItem(
            icon: Icons.grid_view_outlined,
            selectedIcon: Icons.grid_view,
            label: 'Kit',
          ),
          PrismNavBarItem(
            icon: Icons.palette_outlined,
            selectedIcon: Icons.palette,
            label: 'Colors',
          ),
          PrismNavBarItem(
            icon: Icons.text_fields_outlined,
            selectedIcon: Icons.text_fields,
            label: 'Type',
          ),
          PrismNavBarItem(
            icon: Icons.settings_outlined,
            selectedIcon: Icons.settings,
            label: 'Config',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(PrismSpacing.px20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Section: Buttons
            Text('BUTTONS', style: PrismTypography.label.copyWith(color: PrismColors.amber)),
            const SizedBox(height: PrismSpacing.px12),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                PrismButton(
                  label: 'Primary',
                  onPressed: () {},
                ),
                PrismButton(
                  label: 'Ghost',
                  variant: PrismVariant.ghost,
                  onPressed: () {},
                ),
                PrismButton(
                  label: 'Danger',
                  variant: PrismVariant.danger,
                  onPressed: () {},
                ),
                PrismButton(
                  label: 'Flat',
                  variant: PrismVariant.flat,
                  onPressed: () {},
                ),
                PrismButton(
                  label: 'Disabled',
                  onPressed: null,
                ),
                PrismButton(
                  label: 'Loading',
                  isLoading: true,
                  onPressed: () {},
                ),
                PrismButton(
                  label: 'With Icon',
                  leading: const Icon(Icons.add),
                  onPressed: () {},
                ),
                PrismButton(
                  label: 'Small',
                  size: PrismSize.sm,
                  onPressed: () {},
                ),
                PrismButton(
                  label: 'Large',
                  size: PrismSize.lg,
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: PrismSpacing.px12),
            PrismButton(
              label: 'Full Width Button',
              isFullWidth: true,
              trailing: const Icon(Icons.arrow_forward),
              onPressed: () {},
            ),

            const PrismDivider(label: 'Badges & Tags'),

            // ── Section: Badges
            Text('BADGES', style: PrismTypography.label.copyWith(color: PrismColors.amber)),
            const SizedBox(height: PrismSpacing.px12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                PrismBadge(label: 'Success', variant: PrismBadgeVariant.success, dot: true),
                PrismBadge(label: 'Error', variant: PrismBadgeVariant.error, dot: true),
                PrismBadge(label: 'Warning', variant: PrismBadgeVariant.warning),
                PrismBadge(label: 'Info', variant: PrismBadgeVariant.info),
                PrismBadge(label: 'Neutral', variant: PrismBadgeVariant.neutral),
                PrismBadge(label: 'Accent', variant: PrismBadgeVariant.accent),
              ],
            ),
            const SizedBox(height: PrismSpacing.px20),

            // ── Section: Tags
            Text('TAGS', style: PrismTypography.label.copyWith(color: PrismColors.amber)),
            const SizedBox(height: PrismSpacing.px12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                PrismTag(label: 'flutter'),
                PrismTag(label: 'firebase'),
                PrismTag(label: 'dart', onRemove: () {}),
                PrismTag(label: 'pendura', onRemove: () {}),
              ],
            ),
            const SizedBox(height: PrismSpacing.px20),

            // ── Section: Chips
            Text('FILTER CHIPS', style: PrismTypography.label.copyWith(color: PrismColors.amber)),
            const SizedBox(height: PrismSpacing.px12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                PrismChip(
                  label: 'All',
                  selected: _chips[0],
                  icon: Icons.apps,
                  onToggle: () => setState(() {
                    for (int i = 0; i < _chips.length; i++) { _chips[i] = i == 0; }
                  }),
                ),
                PrismChip(
                  label: 'Active',
                  selected: _chips[1],
                  icon: Icons.check_circle_outline,
                  onToggle: () => setState(() => _chips[1] = !_chips[1]),
                ),
                PrismChip(
                  label: 'Pending',
                  selected: _chips[2],
                  icon: Icons.hourglass_empty,
                  onToggle: () => setState(() => _chips[2] = !_chips[2]),
                ),
                PrismChip(
                  label: 'Archived',
                  selected: _chips[3],
                  icon: Icons.archive_outlined,
                  onToggle: () => setState(() => _chips[3] = !_chips[3]),
                ),
              ],
            ),

            const PrismDivider(label: 'Form Controls'),

            // ── Section: Input
            Text('TEXT INPUT', style: PrismTypography.label.copyWith(color: PrismColors.amber)),
            const SizedBox(height: PrismSpacing.px12),
            const PrismInput(
              label: 'Business Name',
              hint: 'e.g. Pendura Technologies',
              helper: 'This will appear on your invoices.',
            ),
            const SizedBox(height: PrismSpacing.px16),
            const PrismInput(
              label: 'Error State',
              hint: 'enter@email.com',
              error: 'Email address is not valid.',
              prefix: Icon(Icons.mail_outline),
            ),
            const SizedBox(height: PrismSpacing.px16),
            const PrismInput(
              label: 'Password',
              hint: '············',
              obscureText: true,
              suffix: Icon(Icons.visibility_outlined),
            ),

            const SizedBox(height: PrismSpacing.px24),

            // ── Toggle + Checkbox
            Text('TOGGLES', style: PrismTypography.label.copyWith(color: PrismColors.amber)),
            const SizedBox(height: PrismSpacing.px12),
            PrismToggle(
              value: _toggle,
              label: 'Enable dark mode',
              description: 'Apply across all sessions',
              onChanged: (v) => setState(() => _toggle = v),
            ),

            const SizedBox(height: PrismSpacing.px20),

            Text('CHECKBOXES', style: PrismTypography.label.copyWith(color: PrismColors.amber)),
            const SizedBox(height: PrismSpacing.px12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PrismCheckbox(
                  value: _check1,
                  label: 'Enable activity logging',
                  onChanged: (v) => setState(() => _check1 = v),
                ),
                const SizedBox(height: 10),
                PrismCheckbox(
                  value: _check2,
                  label: 'Receive product updates',
                  onChanged: (v) => setState(() => _check2 = v),
                ),
                const SizedBox(height: 10),
                PrismCheckbox(
                  value: _check3,
                  indeterminate: true,
                  label: 'Indeterminate state',
                  onChanged: (v) => setState(() => _check3 = v),
                ),
              ],
            ),

            const SizedBox(height: PrismSpacing.px20),

            Text('RADIO', style: PrismTypography.label.copyWith(color: PrismColors.amber)),
            const SizedBox(height: PrismSpacing.px12),
            PrismRadioGroup<String>(
              value: _radio,
              onChanged: (v) => setState(() => _radio = v),
              options: const [
                PrismRadioOption(
                  value: 'a',
                  label: 'Starter',
                  description: 'For solo founders. Up to 1 workspace.',
                ),
                PrismRadioOption(
                  value: 'b',
                  label: 'Pro',
                  description: 'For growing teams. Unlimited workspaces.',
                ),
                PrismRadioOption(
                  value: 'c',
                  label: 'Enterprise',
                  description: 'Custom limits, SSO, and SLA support.',
                ),
              ],
            ),

            const SizedBox(height: PrismSpacing.px20),

            // ── Slider
            Text('SLIDER', style: PrismTypography.label.copyWith(color: PrismColors.amber)),
            const SizedBox(height: PrismSpacing.px12),
            PrismSlider(
              value: _sliderVal,
              min: 0,
              max: 100,
              label: 'Volume',
              onChanged: (v) => setState(() => _sliderVal = v),
            ),
            const SizedBox(height: PrismSpacing.px16),
            PrismSlider(
              value: _sliderVal,
              min: 0,
              max: 100,
              divisions: 5,
              label: 'Segments',
              accentColor: PrismColors.lime,
              onChanged: (v) => setState(() => _sliderVal = v),
            ),

            const PrismDivider(label: 'Data Display'),

            // ── Progress
            Text('PROGRESS', style: PrismTypography.label.copyWith(color: PrismColors.amber)),
            const SizedBox(height: PrismSpacing.px12),
            PrismLinearProgress(value: 0.72, label: 'Storage Used'),
            const SizedBox(height: PrismSpacing.px12),
            PrismLinearProgress(
              value: 0.45,
              label: 'Segmented',
              accentColor: PrismColors.lime,
              height: 8,
              segments: 5,
            ),
            const SizedBox(height: PrismSpacing.px20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                PrismCircularProgress(value: 0.72, label: 'CPU'),
                PrismCircularProgress(
                  value: 0.45,
                  label: 'Memory',
                  accentColor: PrismColors.lime,
                ),
                PrismCircularProgress(
                  value: 0.91,
                  label: 'Disk',
                  accentColor: PrismColors.coral,
                ),
                PrismCircularProgress(
                  value: 0,
                  indeterminate: true,
                  label: 'Loading',
                  accentColor: PrismColors.sky,
                ),
              ],
            ),

            const PrismDivider(label: 'Cards & Lists'),

            // ── Cards
            Text('CARDS', style: PrismTypography.label.copyWith(color: PrismColors.amber)),
            const SizedBox(height: PrismSpacing.px12),
            PrismCard(
              label: 'Revenue This Month',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('₹ 1,24,500',
                      style: PrismTypography.displayM.copyWith(color: PrismColors.amber)),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.trending_up, color: PrismColors.lime, size: 14),
                      const SizedBox(width: 4),
                      Text('+12.4% from last month',
                          style: PrismTypography.bodyS
                              .copyWith(color: PrismColors.lime)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: PrismSpacing.px12),
            PrismCard(
              label: 'System Alert',
              accent: PrismColors.coral,
              child: Text(
                'Replication lag on primary DB exceeded 500ms. Consider scaling the read replica or reducing write frequency.',
                style: PrismTypography.bodyS
                    .copyWith(color: PrismColors.chalk.withValues(alpha: 0.7)),
              ),
            ),
            const SizedBox(height: PrismSpacing.px12),
            PrismCard(
              accent: PrismColors.sky,
              child: Row(
                children: [
                  PrismAvatar(initials: 'MV', presence: PrismPresence.online),
                  const SizedBox(width: PrismSpacing.px12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Mahesh V', style: PrismTypography.headingS),
                        Text('Founder — Pendura',
                            style: PrismTypography.bodyS.copyWith(
                                color: PrismColors.chalk.withValues(alpha: 0.45))),
                      ],
                    ),
                  ),
                  PrismBadge(label: 'Admin', variant: PrismBadgeVariant.accent),
                ],
              ),
            ),

            const SizedBox(height: PrismSpacing.px20),

            // ── Avatars
            Text('AVATARS', style: PrismTypography.label.copyWith(color: PrismColors.amber)),
            const SizedBox(height: PrismSpacing.px12),
            Row(
              children: [
                PrismAvatar(initials: 'MV', size: 48, presence: PrismPresence.online),
                const SizedBox(width: 12),
                PrismAvatar(initials: 'AK', size: 40, presence: PrismPresence.busy, accentColor: PrismColors.coral),
                const SizedBox(width: 12),
                PrismAvatar(initials: 'RJ', size: 32, presence: PrismPresence.away, accentColor: PrismColors.lime),
                const SizedBox(width: 12),
                PrismAvatar(initials: 'PX', size: 24, presence: PrismPresence.offline, accentColor: PrismColors.sky),
              ],
            ),

            const SizedBox(height: PrismSpacing.px20),

            // ── List
            Text('LIST', style: PrismTypography.label.copyWith(color: PrismColors.amber)),
            const SizedBox(height: PrismSpacing.px12),
            PrismListTile(
              title: 'Clinic Billing Module',
              subtitle: 'Updated 2 hours ago',
              leading: Container(
                width: 36,
                height: 36,
                color: PrismColors.amber.withValues(alpha: 0.15),
                child: const Icon(Icons.receipt_long, color: PrismColors.amber, size: 18),
              ),
              accentLeft: PrismColors.amber,
              trailing: const PrismBadge(label: 'Active', variant: PrismBadgeVariant.success),
              onTap: () {},
            ),
            PrismListTile(
              title: 'TrashFlow Gmail Deletion',
              subtitle: 'Last sync 5 min ago',
              leading: Container(
                width: 36,
                height: 36,
                color: PrismColors.coral.withValues(alpha: 0.15),
                child: const Icon(Icons.delete_outline, color: PrismColors.coral, size: 18),
              ),
              accentLeft: PrismColors.coral,
              onTap: () {},
            ),
            PrismListTile(
              title: 'Backstage',
              subtitle: 'Creator workflow — Draft',
              leading: Container(
                width: 36,
                height: 36,
                color: PrismColors.lime.withValues(alpha: 0.15),
                child: const Icon(Icons.movie_creation_outlined, color: PrismColors.lime, size: 18),
              ),
              dense: true,
              onTap: () {},
            ),

            const PrismDivider(label: 'Overlay Actions'),

            // ── Dialog + Sheet + Toast triggers
            Text('OVERLAYS', style: PrismTypography.label.copyWith(color: PrismColors.amber)),
            const SizedBox(height: PrismSpacing.px12),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                PrismButton(
                  label: 'Show Dialog',
                  variant: PrismVariant.ghost,
                  leading: const Icon(Icons.open_in_new),
                  onPressed: () => PrismDialog.show(
                    context,
                    title: 'Confirm Deletion',
                    body: const Text(
                        'This action is permanent and cannot be undone. All associated data will be removed from our servers within 30 days.'),
                    primaryLabel: 'Delete',
                    secondaryLabel: 'Cancel',
                    isDestructive: true,
                    onPrimary: () => Navigator.of(context).pop(),
                  ),
                ),
                PrismButton(
                  label: 'Toast',
                  variant: PrismVariant.ghost,
                  leading: const Icon(Icons.notifications_none),
                  onPressed: () => PrismToast.show(
                    context,
                    message: 'Changes saved successfully.',
                    variant: PrismToastVariant.success,
                  ),
                ),
                PrismButton(
                  label: 'Bottom Sheet',
                  variant: PrismVariant.ghost,
                  leading: const Icon(Icons.expand_less),
                  onPressed: () => PrismBottomSheet.show(
                    context,
                    title: 'Export Options',
                    children: [
                      PrismBottomSheetAction(
                        label: 'Export as PDF',
                        icon: Icons.picture_as_pdf_outlined,
                        onTap: () => Navigator.of(context).pop(),
                      ),
                      PrismBottomSheetAction(
                        label: 'Export as CSV',
                        icon: Icons.table_chart_outlined,
                        onTap: () => Navigator.of(context).pop(),
                      ),
                      PrismBottomSheetAction(
                        label: 'Share via Link',
                        icon: Icons.link,
                        onTap: () => Navigator.of(context).pop(),
                      ),
                      PrismBottomSheetAction(
                        label: 'Delete Record',
                        icon: Icons.delete_outline,
                        isDestructive: true,
                        onTap: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: PrismSpacing.px48),

            // Footer
            Center(
              child: Column(
                children: [
                  Text(
                    'PRISM',
                    style: PrismTypography.displayM.copyWith(
                      color: PrismColors.amber,
                      letterSpacing: 8,
                    ),
                  ),
                  Text(
                    'UI Kit by Pendura',
                    style: PrismTypography.label.copyWith(
                      color: PrismColors.chalk.withValues(alpha: 0.25),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: PrismSpacing.px32),
          ],
        ),
      ),
    );
  }
}
