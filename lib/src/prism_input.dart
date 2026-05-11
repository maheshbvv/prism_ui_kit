import 'package:flutter/material.dart';
import 'prism_colors.dart';
import 'prism_typography.dart';
import 'prism_spacing.dart';

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
