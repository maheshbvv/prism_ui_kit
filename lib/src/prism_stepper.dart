import 'package:flutter/material.dart';
import 'prism_colors.dart';
import 'prism_icon.dart';
import 'prism_icons.dart';
import 'prism_typography.dart';

class PrismStepper extends StatelessWidget {
  const PrismStepper({
    super.key,
    required this.steps,
    required this.currentStep,
  });

  final List<String> steps;
  final int currentStep;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(steps.length, (i) {
        final isCompleted = i < currentStep;
        final isCurrent = i == currentStep;

        final Color circleColor;
        final Color lineColor;
        if (isCompleted) {
          circleColor = PrismColors.lime;
          lineColor = PrismColors.lime;
        } else if (isCurrent) {
          circleColor = PrismColors.amber;
          lineColor = PrismColors.border;
        } else {
          circleColor = PrismColors.surface3;
          lineColor = PrismColors.border;
        }

        return Expanded(
          child: Row(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      color: circleColor,
                      border: Border.all(
                        color: isCurrent ? PrismColors.amber : PrismColors.border,
                        width: 1.5,
                      ),
                    ),
                    child: isCompleted
                        ? PrismIcon(PrismIcons.check, size: 16, color: PrismColors.ink)
                        : isCurrent
                            ? Center(
                                child: Container(
                                  width: 8,
                                  height: 8,
                                  color: PrismColors.ink,
                                ),
                              )
                            : null,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    steps[i].toUpperCase(),
                    style: PrismTypography.label.copyWith(
                      fontSize: 9,
                      color: isCurrent
                          ? PrismColors.amber
                          : isCompleted
                              ? PrismColors.lime
                              : PrismColors.chalk.withValues(alpha: 0.3),
                    ),
                  ),
                ],
              ),
              if (i < steps.length - 1)
                Container(
                  height: 2,
                  color: lineColor,
                  margin: const EdgeInsets.only(bottom: 20),
                ),
            ],
          ),
        );
      }),
    );
  }
}
