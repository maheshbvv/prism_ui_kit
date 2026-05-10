/// Prism UI Kit — a neo-brutalist design system for Flutter.
///
/// 20+ components built with structural honesty — no shadows, no blur,
/// no Material, no Cupertino. Just raw, intentional form.
///
/// ## Quick start
///
/// ```dart
/// MaterialApp(
///   theme: PrismTheme.dark,
///   home: MyScreen(),
/// )
/// ```
library;

import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ─────────────────────────────────────────────────────────────
// 1. PRISM THEME — Design Tokens
// ─────────────────────────────────────────────────────────────

/// Design tokens — the Prism color palette.
///
/// Includes base colors (ink, chalk), accents (amber, lime, coral, sky),
/// semantic aliases (success, error, warning, info), surface layers for
/// dark mode, and border colors.
class PrismColors {
  PrismColors._();

  /// Near-black base — use for backgrounds or primary text on light.
  static const ink = Color(0xFF0A0A0A);

  /// Warm off-white — use for text on dark backgrounds.
  static const chalk = Color(0xFFF5F2EB);

  /// Slightly darker chalk — use for subtle surfaces in light mode.
  static const chalkDim = Color(0xFFE8E4DA);

  /// Darker still — border-level light surface.
  static const chalkDimmer = Color(0xFFD4CFC3);

  /// Primary accent — bold yellow-gold.
  static const amber = Color(0xFFFFB700);

  /// Lighter amber variant.
  static const amberDim = Color(0xFFFFC933);

  /// Accent green — also used for success states.
  static const lime = Color(0xFFA8E63D);

  /// Accent red — also used for error / destructive states.
  static const coral = Color(0xFFFF4D38);

  /// Accent blue — also used for info states.
  static const sky = Color(0xFF3D8EFF);

  /// Semantic alias for [lime].
  static const success = lime;

  /// Semantic alias for [coral].
  static const error = coral;

  /// Semantic alias for [amber].
  static const warning = amber;

  /// Semantic alias for [sky].
  static const info = sky;

  /// Deepest dark-mode surface layer.
  static const surface0 = Color(0xFF0A0A0A);

  /// Primary dark-mode surface.
  static const surface1 = Color(0xFF141414);

  /// Raised dark-mode surface.
  static const surface2 = Color(0xFF1E1E1E);

  /// Highest dark-mode surface.
  static const surface3 = Color(0xFF282828);

  /// Default border color (dark mode).
  static const border = Color(0xFF2A2A2A);

  /// Default border color (light mode).
  static const borderLight = Color(0xFFE0DBD0);
}

/// Typography scale — editorial, high-contrast, all-caps labels.
///
/// Font families default to `serif`, `sans-serif`, and `monospace` so the
/// package has zero font dependencies. Replace them by wrapping text in
/// your own `TextStyle` with a custom `fontFamily`.
class PrismTypography {
  PrismTypography._();

  /// Serif font family string.
  static const fontDisplay = 'serif';

  /// Monospace font family string.
  static const fontMono = 'monospace';

  /// Sans-serif font family string.
  static const fontSans = 'sans-serif';

  /// 64px / W900 — extreme hero text.
  static const TextStyle displayXL = TextStyle(
    fontSize: 64,
    fontWeight: FontWeight.w900,
    letterSpacing: -3.0,
    height: 0.92,
    color: PrismColors.chalk,
  );

  /// 48px / W900 — large display heading.
  static const TextStyle displayL = TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.w900,
    letterSpacing: -2.0,
    height: 0.95,
    color: PrismColors.chalk,
  );

  /// 36px / W800 — medium display heading.
  static const TextStyle displayM = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w800,
    letterSpacing: -1.5,
    height: 1.0,
    color: PrismColors.chalk,
  );

  /// 24px / W700 — large section heading.
  static const TextStyle headingL = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.5,
    height: 1.15,
    color: PrismColors.chalk,
  );

  /// 18px / W700 — medium heading, card titles.
  static const TextStyle headingM = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.3,
    height: 1.2,
    color: PrismColors.chalk,
  );

  /// 14px / W700 — small heading, button text.
  static const TextStyle headingS = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.5,
    height: 1.3,
    color: PrismColors.chalk,
  );

  /// 16px / W400 — large body text.
  static const TextStyle bodyL = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.1,
    height: 1.6,
    color: PrismColors.chalk,
  );

  /// 14px / W400 — default body text.
  static const TextStyle bodyM = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.1,
    height: 1.55,
    color: PrismColors.chalk,
  );

  /// 12px / W400 — small body / captions.
  static const TextStyle bodyS = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.2,
    height: 1.5,
    color: PrismColors.chalk,
  );

  /// 11px / W700 + 1.5sp — uppercase label text.
  static const TextStyle label = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w700,
    letterSpacing: 1.5,
    height: 1.3,
    color: PrismColors.chalk,
  );

  /// 13px / W500 — monospace for code / numbers.
  static const TextStyle mono = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.0,
    height: 1.5,
    fontFamily: 'monospace',
    color: PrismColors.chalk,
  );
}

/// Consistent spacing values used throughout Prism components.
///
/// Values range from 2px to 64px, following powers-of-two increments.
class PrismSpacing {
  PrismSpacing._();

  /// 2px.
  static const double px2 = 2;

  /// 4px.
  static const double px4 = 4;

  /// 6px.
  static const double px6 = 6;

  /// 8px.
  static const double px8 = 8;

  /// 10px.
  static const double px10 = 10;

  /// 12px.
  static const double px12 = 12;

  /// 16px.
  static const double px16 = 16;

  /// 20px.
  static const double px20 = 20;

  /// 24px.
  static const double px24 = 24;

  /// 32px.
  static const double px32 = 32;

  /// 40px.
  static const double px40 = 40;

  /// 48px.
  static const double px48 = 48;

  /// 64px.
  static const double px64 = 64;
}

/// ThemeData factories for Prism dark and light modes.
///
/// Apply via `MaterialApp(theme: PrismTheme.dark)`.
class PrismTheme {
  PrismTheme._();

  /// Dark theme — ink background, chalk text, amber accents.
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

  /// Light theme — chalk background, ink text, amber accents.
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

/// Visual variants for [PrismButton].
enum PrismVariant {
  /// Solid amber background, ink text.
  primary,

  /// Transparent background, chalk border + text.
  ghost,

  /// Solid coral background, chalk text.
  danger,

  /// Transparent background, amber text only — no border.
  flat,
}

/// Size options for [PrismButton].
enum PrismSize {
  /// 32px height, label-style text.
  sm,

  /// 44px height, heading-s text.
  md,

  /// 56px height, bold body text.
  lg,
}

// ─────────────────────────────────────────────────────────────
// 2. PRISM BUTTON
// ─────────────────────────────────────────────────────────────

/// A neo-brutalist button with press-scale animation.
///
/// Supports four variants ([primary], [ghost], [danger], [flat]),
/// three sizes ([sm], [md], [lg]), loading state, optional leading /
/// trailing icons, and full-width mode.
class PrismButton extends StatefulWidget {
  /// Creates a [PrismButton].
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

  /// Button text (auto-uppercased).
  final String label;

  /// Called when the button is tapped. When `null` the button is disabled.
  final VoidCallback? onPressed;

  /// Visual variant. Defaults to [PrismVariant.primary].
  final PrismVariant variant;

  /// Size preset. Defaults to [PrismSize.md].
  final PrismSize size;

  /// Optional widget shown before the label (replaced by spinner when
  /// [isLoading] is true).
  final Widget? leading;

  /// Optional widget shown after the label.
  final Widget? trailing;

  /// When `true` shows a spinner in place of [leading].
  final bool isLoading;

  /// When `true` expands the button to fill its parent width.
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

    final Color bg;
    final Color fg;
    final Color border;
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

    final double h;
    final double hPad;
    final TextStyle textStyle;
    (h, hPad, textStyle) = switch (widget.size) {
      PrismSize.sm => (32.0, 14.0, PrismTypography.label),
      PrismSize.md => (44.0, 20.0, PrismTypography.headingS),
      PrismSize.lg =>
        (56.0, 28.0, PrismTypography.bodyL.copyWith(fontWeight: FontWeight.w700)),
    };

    return GestureDetector(
      onTapDown: disabled ? null : _onTapDown,
      onTapUp: disabled ? null : _onTapUp,
      onTapCancel: disabled ? null : _onTapCancel,
      onTap: disabled
          ? null
          : () {
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

/// A neo-brutalist text field with animated border, label, error, and icons.
///
/// The border animates to [PrismColors.amber] on focus and [PrismColors.coral]
/// when [error] is set. Supports prefix / suffix icons, helper text, and
/// obscure text for passwords.
class PrismInput extends StatefulWidget {
  /// Creates a [PrismInput].
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

  /// Label shown above the input (auto-uppercased). Turns amber on focus,
  /// coral when [error] is set.
  final String? label;

  /// Placeholder text inside the field.
  final String? hint;

  /// Helper text shown below the input when there is no [error].
  final String? helper;

  /// Error message shown below the input. Turns the label and border coral.
  final String? error;

  /// Optional controller for programmatic access.
  final TextEditingController? controller;

  /// When `true` hides the typed characters.
  final bool obscureText;

  /// Keyboard type for the underlying [TextField].
  final TextInputType? keyboardType;

  /// Called on every keystroke.
  final ValueChanged<String>? onChanged;

  /// Called when the user presses submit / done.
  final ValueChanged<String>? onSubmitted;

  /// Widget shown at the start of the input (e.g. an icon).
  final Widget? prefix;

  /// Widget shown at the end of the input (e.g. an icon).
  final Widget? suffix;

  /// Maximum visible lines. `null` means single-line.
  final int? maxLines;

  /// When `true` autofocuses the field on mount.
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
                        padding:
                            const EdgeInsets.only(right: PrismSpacing.px12),
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
                style: PrismTypography.bodyS.copyWith(color: PrismColors.coral),
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

/// A content card with an exposed accent left border and optional header.
///
/// The card's grid anatomy is visible through its border structure:
/// a 3px accent line on the left and 1px structural borders elsewhere.
class PrismCard extends StatelessWidget {
  /// Creates a [PrismCard].
  const PrismCard({
    super.key,
    required this.child,
    this.accent,
    this.label,
    this.onTap,
    this.padding,
  });

  /// The widget inside the card body.
  final Widget child;

  /// Color for the left accent border. Defaults to [PrismColors.amber].
  final Color? accent;

  /// Optional header text (auto-uppercased) shown above the body.
  final String? label;

  /// Called when the card is tapped.
  final VoidCallback? onTap;

  /// Padding around [child]. Defaults to 20px all sides.
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
                    bottom: BorderSide(
                        color: accentColor.withValues(alpha: 0.3), width: 1),
                  ),
                ),
                child: Text(
                  label!.toUpperCase(),
                  style: PrismTypography.label.copyWith(color: accentColor),
                ),
              ),
            Padding(
              padding: padding ?? const EdgeInsets.all(PrismSpacing.px20),
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

/// Variants for [PrismBadge].
enum PrismBadgeVariant {
  /// Green badge — good status.
  success,

  /// Red badge — error status.
  error,

  /// Amber badge — warning status.
  warning,

  /// Blue badge — informational.
  info,

  /// Grey badge — no semantic weight.
  neutral,

  /// Solid amber badge — calls attention.
  accent,
}

/// A status badge with optional dot indicator.
///
/// Compact, uppercased, and available in six semantic variants.
class PrismBadge extends StatelessWidget {
  /// Creates a [PrismBadge].
  const PrismBadge({
    super.key,
    required this.label,
    this.variant = PrismBadgeVariant.neutral,
    this.dot = false,
  });

  /// Badge text (auto-uppercased).
  final String label;

  /// Color variant. Defaults to [PrismBadgeVariant.neutral].
  final PrismBadgeVariant variant;

  /// When `true` shows a small dot before the label.
  final bool dot;

  @override
  Widget build(BuildContext context) {
    final (bg, fg) = switch (variant) {
      PrismBadgeVariant.success =>
        (PrismColors.lime.withValues(alpha: 0.15), PrismColors.lime),
      PrismBadgeVariant.error =>
        (PrismColors.coral.withValues(alpha: 0.15), PrismColors.coral),
      PrismBadgeVariant.warning =>
        (PrismColors.amber.withValues(alpha: 0.15), PrismColors.amber),
      PrismBadgeVariant.info =>
        (PrismColors.sky.withValues(alpha: 0.15), PrismColors.sky),
      PrismBadgeVariant.neutral =>
        (PrismColors.surface2, PrismColors.chalk.withValues(alpha: 0.6)),
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

/// An inline content tag with optional remove action.
///
/// Rendered in monospace with a transparent background and border.
class PrismTag extends StatelessWidget {
  /// Creates a [PrismTag].
  const PrismTag({super.key, required this.label, this.onRemove});

  /// Tag text.
  final String label;

  /// Called when the close icon is tapped. When `null` no close icon is shown.
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

/// A selectable filter chip with animated background and optional icon.
class PrismChip extends StatelessWidget {
  /// Creates a [PrismChip].
  const PrismChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onToggle,
    this.icon,
  });

  /// Chip label.
  final String label;

  /// Whether the chip is currently selected.
  final bool selected;

  /// Called when the chip is tapped.
  final VoidCallback onToggle;

  /// Optional icon shown before the label.
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
                color: selected
                    ? PrismColors.ink
                    : PrismColors.chalk.withValues(alpha: 0.5),
              ),
              const SizedBox(width: 6),
            ],
            Text(
              label,
              style: PrismTypography.headingS.copyWith(
                color: selected
                    ? PrismColors.ink
                    : PrismColors.chalk.withValues(alpha: 0.6),
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

/// An on/off toggle switch with optional label and description.
class PrismToggle extends StatelessWidget {
  /// Creates a [PrismToggle].
  const PrismToggle({
    super.key,
    required this.value,
    required this.onChanged,
    this.label,
    this.description,
  });

  /// Current toggle state.
  final bool value;

  /// Called with the new value when the toggle is tapped.
  final ValueChanged<bool> onChanged;

  /// Label text shown to the right of the toggle.
  final String? label;

  /// Description text shown below [label].
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
              alignment:
                  value ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                width: 16,
                height: 16,
                margin: const EdgeInsets.symmetric(horizontal: 3),
                color: value
                    ? PrismColors.ink
                    : PrismColors.chalk.withValues(alpha: 0.3),
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
                  style:
                      PrismTypography.bodyM.copyWith(fontWeight: FontWeight.w600),
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

/// A custom checkbox with check and indeterminate states.
class PrismCheckbox extends StatelessWidget {
  /// Creates a [PrismCheckbox].
  const PrismCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.label,
    this.indeterminate = false,
  });

  /// Current checked state.
  final bool value;

  /// Called with the new value when tapped.
  final ValueChanged<bool> onChanged;

  /// Label text shown to the right.
  final String? label;

  /// When `true` shows a dash instead of a checkmark.
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

/// A single option within a [PrismRadioGroup].
class PrismRadioOption<T> {
  /// Creates a [PrismRadioOption].
  const PrismRadioOption({
    required this.value,
    required this.label,
    this.description,
  });

  /// The value returned when this option is selected.
  final T value;

  /// Display label.
  final String label;

  /// Optional description shown below the label.
  final String? description;
}

/// A radio group rendered as selectable cards.
///
/// Each option is a bordered card with a circular radio indicator,
/// making it suitable for form selection where visual weight is desired.
class PrismRadioGroup<T> extends StatelessWidget {
  /// Creates a [PrismRadioGroup].
  const PrismRadioGroup({
    super.key,
    required this.options,
    required this.value,
    required this.onChanged,
  });

  /// The available options.
  final List<PrismRadioOption<T>> options;

  /// Currently selected value.
  final T value;

  /// Called when a new option is selected.
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
              color: selected
                  ? PrismColors.amber.withValues(alpha: 0.07)
                  : PrismColors.surface1,
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
                          color: selected
                              ? PrismColors.amber
                              : PrismColors.chalk,
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

/// A range input with a square thumb, optional label, and segmented mode.
class PrismSlider extends StatelessWidget {
  /// Creates a [PrismSlider].
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

  /// Current slider value.
  final double value;

  /// Called while the user drags the thumb.
  final ValueChanged<double> onChanged;

  /// Minimum value. Defaults to 0.0.
  final double min;

  /// Maximum value. Defaults to 1.0.
  final double max;

  /// Label shown above the track (auto-uppercased).
  final String? label;

  /// When `true` shows the numeric value next to the label.
  final bool showValue;

  /// Number of discrete divisions. `null` for continuous.
  final int? divisions;

  /// Color for the active track, thumb, and value text.
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
        if (label != null || showValue)
          const SizedBox(height: PrismSpacing.px8),
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
  Size getPreferredSize(bool isEnabled, bool isDiscrete) =>
      const Size(16, 16);

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

/// A structural divider with optional label, accent, and vertical mode.
class PrismDivider extends StatelessWidget {
  /// Creates a [PrismDivider].
  const PrismDivider({
    super.key,
    this.label,
    this.accent = false,
    this.vertical = false,
    this.height,
  });

  /// Optional label rendered between two horizontal lines (ignored in
  /// [vertical] mode).
  final String? label;

  /// When `true` uses [PrismColors.amber] instead of the default border color.
  final bool accent;

  /// When `true` renders as a 1px-wide vertical line.
  final bool vertical;

  /// Height of a vertical divider. Defaults to fill parent.
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
            padding:
                const EdgeInsets.symmetric(horizontal: PrismSpacing.px12),
            child: Text(
              label!.toUpperCase(),
              style: PrismTypography.label.copyWith(
                color: accent
                    ? PrismColors.amber
                    : PrismColors.chalk.withValues(alpha: 0.35),
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

/// A modal dialog with accent header, body, and action buttons.
///
/// Use [PrismDialog.show] to display it.
class PrismDialog extends StatelessWidget {
  /// Creates a [PrismDialog].
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

  /// Dialog title shown in the header.
  final String title;

  /// Widget rendered in the body area.
  final Widget body;

  /// Label for the primary action button.
  final String primaryLabel;

  /// Label for the secondary (ghost) action button.
  final String secondaryLabel;

  /// Called when the primary button is tapped.
  final VoidCallback? onPrimary;

  /// Called when the secondary button is tapped.
  final VoidCallback? onSecondary;

  /// Accent color for the header left border. Defaults to amber.
  final Color accentColor;

  /// When `true` the primary button uses the danger variant and the accent
  /// turns coral.
  final bool isDestructive;

  /// Shows the dialog via [showGeneralDialog].
  ///
  /// Returns `null` when dismissed.
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
          onSecondary:
              onSecondary ?? () => Navigator.of(context).pop(),
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
            Padding(
              padding: const EdgeInsets.all(PrismSpacing.px20),
              child: DefaultTextStyle(
                style: PrismTypography.bodyM
                    .copyWith(color: PrismColors.chalk.withValues(alpha: 0.7)),
                child: body,
              ),
            ),
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

/// Variants for [PrismToast].
enum PrismToastVariant {
  /// Blue toast.
  info,

  /// Green toast.
  success,

  /// Amber toast.
  warning,

  /// Red toast.
  error,
}

/// An overlay notification with slide-up animation and auto-dismiss.
///
/// Use [PrismToast.show] to display it.
class PrismToast {
  /// Shows a toast notification anchored to the bottom of the screen.
  ///
  /// Automatically dismisses after [duration].
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

/// A modal bottom sheet with title and tappable action children.
///
/// Use [PrismBottomSheet.show] to display it.
class PrismBottomSheet extends StatelessWidget {
  /// Creates a [PrismBottomSheet].
  const PrismBottomSheet({
    super.key,
    required this.title,
    required this.children,
  });

  /// Sheet title shown in the header.
  final String title;

  /// Action widgets (typically [PrismBottomSheetAction] instances).
  final List<Widget> children;

  /// Shows the sheet via [showModalBottomSheet].
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

/// A single action row within [PrismBottomSheet].
class PrismBottomSheetAction extends StatelessWidget {
  /// Creates a [PrismBottomSheetAction].
  const PrismBottomSheetAction({
    super.key,
    required this.label,
    required this.onTap,
    this.icon,
    this.isDestructive = false,
  });

  /// Action label.
  final String label;

  /// Called when the row is tapped.
  final VoidCallback onTap;

  /// Optional icon shown before the label.
  final IconData? icon;

  /// When `true` the text and icon render in [PrismColors.coral].
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

/// A single tab item within [PrismNavBar].
class PrismNavBarItem {
  /// Creates a [PrismNavBarItem].
  const PrismNavBarItem({
    required this.icon,
    required this.selectedIcon,
    required this.label,
  });

  /// Icon shown when this item is not selected.
  final IconData icon;

  /// Icon shown when this item is selected.
  final IconData selectedIcon;

  /// Label shown below the icon (auto-uppercased).
  final String label;
}

/// A bottom navigation bar with animated selection highlighting.
class PrismNavBar extends StatelessWidget {
  /// Creates a [PrismNavBar].
  const PrismNavBar({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
  });

  /// Tab items. Typically 3–5 items.
  final List<PrismNavBarItem> items;

  /// Index of the currently selected tab.
  final int currentIndex;

  /// Called with the tapped index.
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

/// A top app bar with accent line, optional subtitle, and action slots.
class PrismAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// Creates a [PrismAppBar].
  const PrismAppBar({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.actions = const [],
    this.accentLine = true,
  });

  /// Title text.
  final String title;

  /// Optional subtitle shown below the title.
  final String? subtitle;

  /// Widget shown at the leading edge (e.g. a back button).
  final Widget? leading;

  /// Widgets shown at the trailing edge.
  final List<Widget> actions;

  /// When `true` shows a 2px amber bottom border instead of 1px grey.
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

/// Presence indicator options for [PrismAvatar].
enum PrismPresence {
  /// Green dot.
  online,

  /// Amber dot.
  away,

  /// Red dot.
  busy,

  /// Grey dot.
  offline,
}

/// A user avatar with optional image, initials fallback, and presence dot.
class PrismAvatar extends StatelessWidget {
  /// Creates a [PrismAvatar].
  const PrismAvatar({
    super.key,
    this.imageUrl,
    this.initials,
    this.size = 40,
    this.presence,
    this.accentColor = PrismColors.amber,
  });

  /// URL for the avatar image. When `null`, [initials] are shown instead.
  final String? imageUrl;

  /// Initials text shown when [imageUrl] is null.
  final String? initials;

  /// Diameter of the avatar. Defaults to 40px.
  final double size;

  /// When set, shows a presence dot in the bottom-right corner.
  final PrismPresence? presence;

  /// Border color. Defaults to [PrismColors.amber].
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

/// A linear progress bar with optional label, percentage, and segmented mode.
class PrismLinearProgress extends StatelessWidget {
  /// Creates a [PrismLinearProgress].
  const PrismLinearProgress({
    super.key,
    required this.value,
    this.label,
    this.showPercent = true,
    this.accentColor = PrismColors.amber,
    this.height = 6,
    this.segments,
  });

  /// Progress value from 0.0 to 1.0.
  final double value;

  /// Label shown above the bar (auto-uppercased).
  final String? label;

  /// When `true` shows the percentage value next to the label.
  final bool showPercent;

  /// Color for the filled portion. Defaults to [PrismColors.amber].
  final Color accentColor;

  /// Bar height in pixels. Defaults to 6.
  final double height;

  /// When set, renders vertical cut lines dividing the bar into equal
  /// segments (e.g. for a stepped progress meter).
  final int? segments;

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

/// A circular progress indicator with determinate and indeterminate modes.
class PrismCircularProgress extends StatefulWidget {
  /// Creates a [PrismCircularProgress].
  const PrismCircularProgress({
    super.key,
    required this.value,
    this.size = 64,
    this.strokeWidth = 4,
    this.accentColor = PrismColors.amber,
    this.label,
    this.indeterminate = false,
  });

  /// Progress value from 0.0 to 1.0 (ignored when [indeterminate]).
  final double value;

  /// Diameter of the circle. Defaults to 64.
  final double size;

  /// Thickness of the arc stroke. Defaults to 4.
  final double strokeWidth;

  /// Color for the progress arc. Defaults to [PrismColors.amber].
  final Color accentColor;

  /// Label shown below the circle (auto-uppercased).
  final String? label;

  /// When `true` shows a spinning animation instead of a determinate arc.
  final bool indeterminate;

  @override
  State<PrismCircularProgress> createState() =>
      _PrismCircularProgressState();
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

/// A list tile with leading, trailing, optional accent border, and dense mode.
class PrismListTile extends StatelessWidget {
  /// Creates a [PrismListTile].
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

  /// Title text.
  final String title;

  /// Optional subtitle shown below the title.
  final String? subtitle;

  /// Widget shown at the leading edge.
  final Widget? leading;

  /// Widget shown at the trailing edge. Defaults to a forward arrow when
  /// [onTap] is set and [trailing] is null.
  final Widget? trailing;

  /// Called when the tile is tapped.
  final VoidCallback? onTap;

  /// When set, shows a 3px accent border on the left side.
  final Color? accentLeft;

  /// When `true` reduces vertical padding.
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
