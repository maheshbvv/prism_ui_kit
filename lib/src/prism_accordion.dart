import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'prism_colors.dart';
import 'prism_icon.dart';
import 'prism_icons.dart';
import 'prism_typography.dart';
import 'prism_spacing.dart';

class PrismAccordion extends StatefulWidget {
  const PrismAccordion({
    super.key,
    required this.title,
    required this.child,
    this.initiallyExpanded = false,
  });

  final String title;
  final Widget child;
  final bool initiallyExpanded;

  @override
  State<PrismAccordion> createState() => _PrismAccordionState();
}

class _PrismAccordionState extends State<PrismAccordion>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _expand;
  bool _expanded;

  _PrismAccordionState() : _expanded = false;

  @override
  void initState() {
    super.initState();
    _expanded = widget.initiallyExpanded;
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _expand = CurvedAnimation(parent: _ctrl, curve: Curves.easeOut);
    if (_expanded) _ctrl.value = 1.0;
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  void _toggle() {
    HapticFeedback.selectionClick();
    setState(() => _expanded = !_expanded);
    if (_expanded) {
      _ctrl.forward();
    } else {
      _ctrl.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: PrismColors.surface1,
        border: Border.all(color: PrismColors.border, width: 1),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: _toggle,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: PrismSpacing.px16,
                vertical: PrismSpacing.px12,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.title,
                      style: PrismTypography.bodyM.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  RotationTransition(
                    turns: _expand.drive(Tween<double>(begin: 0, end: 0.5)),
                    child: PrismIcon(
                      PrismIcons.chevronDown,
                      size: 18,
                      color: PrismColors.chalk.withValues(alpha: 0.4),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizeTransition(
            sizeFactor: _expand,
            axisAlignment: -1,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(
                PrismSpacing.px16,
                0,
                PrismSpacing.px16,
                PrismSpacing.px16,
              ),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: PrismColors.border, width: 1),
                ),
              ),
              child: widget.child,
            ),
          ),
        ],
      ),
    );
  }
}
