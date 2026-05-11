import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'prism_colors.dart';
import 'prism_typography.dart';
import 'prism_spacing.dart';

class PrismOTPInput extends StatefulWidget {
  const PrismOTPInput({
    super.key,
    required this.length,
    required this.onCompleted,
    this.onChanged,
  });

  final int length;
  final ValueChanged<String> onCompleted;
  final ValueChanged<String>? onChanged;

  @override
  State<PrismOTPInput> createState() => _PrismOTPInputState();
}

class _PrismOTPInputState extends State<PrismOTPInput> {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(
      widget.length,
      (_) => TextEditingController(),
    );
    _focusNodes = List.generate(
      widget.length,
      (_) => FocusNode(),
    );
  }

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    for (final f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  void _onChanged(int index, String value) {
    if (value.length > 1) {
      value = value.substring(value.length - 1);
      _controllers[index].text = value;
    }

    final code = _controllers.map((c) => c.text).join();
    widget.onChanged?.call(code);

    if (value.isNotEmpty && index < widget.length - 1) {
      _focusNodes[index + 1].requestFocus();
    }

    if (code.length == widget.length) {
      widget.onCompleted(code);
    }
  }

  void _onKey(int index, KeyEvent event) {
    if (event is KeyDownEvent &&
        event.logicalKey == LogicalKeyboardKey.backspace &&
        _controllers[index].text.isEmpty &&
        index > 0) {
      _focusNodes[index - 1].requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.length, (i) {
        return Padding(
          padding: EdgeInsets.only(
            right: i < widget.length - 1 ? PrismSpacing.px10 : 0,
          ),
          child: KeyboardListener(
              focusNode: _focusNodes[i],
              onKeyEvent: (event) => _onKey(i, event),
              child: SizedBox(
                width: 48,
                height: 56,
                child: TextField(
                  controller: _controllers[i],
                  onChanged: (v) => _onChanged(i, v),
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  maxLength: 1,
                  style: PrismTypography.headingL.copyWith(
                    color: PrismColors.chalk,
                    fontSize: 24,
                  ),
                  cursorColor: PrismColors.amber,
                  cursorWidth: 2,
                  cursorRadius: Radius.zero,
                  decoration: InputDecoration(
                    counterText: '',
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
            ),
        );
      }),
    );
  }
}
