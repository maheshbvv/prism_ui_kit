import 'package:flutter/material.dart';
import 'prism_colors.dart';
import 'prism_icon.dart';
import 'prism_icons.dart';
import 'prism_typography.dart';
import 'prism_spacing.dart';

class PrismSearchField extends StatefulWidget {
  const PrismSearchField({
    super.key,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.hint = 'Search...',
    this.autofocus = false,
  });

  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final String hint;
  final bool autofocus;

  @override
  State<PrismSearchField> createState() => _PrismSearchFieldState();
}

class _PrismSearchFieldState extends State<PrismSearchField> {
  late TextEditingController _controller;
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _controller.addListener(_onListen);
  }

  @override
  void didUpdateWidget(PrismSearchField old) {
    super.didUpdateWidget(old);
    if (widget.controller != null && widget.controller != old.controller) {
      _controller.removeListener(_onListen);
      _controller = widget.controller!;
      _controller.addListener(_onListen);
    }
  }

  void _onListen() {
    final hasText = _controller.text.isNotEmpty;
    if (hasText != _hasText) setState(() => _hasText = hasText);
  }

  @override
  void dispose() {
    if (widget.controller == null) _controller.dispose();
    _controller.removeListener(_onListen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: PrismColors.surface1,
        border: Border.all(color: PrismColors.border, width: 1.5),
      ),
      child: TextField(
        controller: _controller,
        onChanged: widget.onChanged,
        onSubmitted: widget.onSubmitted,
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
          prefixIcon: PrismIcon(
            PrismIcons.search,
            color: PrismColors.chalk.withValues(alpha: 0.3),
            size: 18,
          ),
          prefixIconConstraints:
              const BoxConstraints(minWidth: 0, minHeight: 0),
          suffixIcon: _hasText
              ? GestureDetector(
                  onTap: () {
                    _controller.clear();
                    widget.onChanged?.call('');
                  },
                  child: PrismIcon(
                    PrismIcons.close,
                    color: PrismColors.chalk.withValues(alpha: 0.3),
                    size: 18,
                  ),
                )
              : null,
          suffixIconConstraints:
              const BoxConstraints(minWidth: 0, minHeight: 0),
        ),
      ),
    );
  }
}
