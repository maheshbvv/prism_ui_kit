import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:prism_ui_kit/prism_ui_kit.dart';
void main() {
  testWidgets('PrismButton renders label and responds to tap', (tester) async {
    var tapped = false;
    await tester.pumpWidget(
      _wrap(PrismButton(
        label: 'Click Me',
        onPressed: () => tapped = true,
      )),
    );
    expect(find.text('CLICK ME'), findsOneWidget);
    await tester.tap(find.text('CLICK ME'));
    expect(tapped, isTrue);
  });

  testWidgets('PrismButton disables when onPressed is null', (tester) async {
    await tester.pumpWidget(
      _wrap(const PrismButton(label: 'Disabled')),
    );
    expect(find.text('DISABLED'), findsOneWidget);
  });

  testWidgets('PrismButton shows loading spinner', (tester) async {
    await tester.pumpWidget(
      _wrap(const PrismButton(label: 'Loading', isLoading: true)),
    );
    expect(find.text('LOADING'), findsOneWidget);
  });

  testWidgets('PrismToggle calls onChanged', (tester) async {
    var value = false;
    await tester.pumpWidget(
      _wrap(PrismToggle(
        value: value,
        onChanged: (v) => value = v,
        label: 'Toggle me',
      )),
    );
    expect(find.text('Toggle me'), findsOneWidget);
    await tester.tap(find.text('Toggle me'));
    expect(value, isTrue);
  });

  testWidgets('PrismCheckbox calls onChanged', (tester) async {
    var checked = false;
    await tester.pumpWidget(
      _wrap(PrismCheckbox(
        value: checked,
        onChanged: (v) => checked = v,
        label: 'Check me',
      )),
    );
    expect(find.text('Check me'), findsOneWidget);
    await tester.tap(find.text('Check me'));
    expect(checked, isTrue);
  });

  testWidgets('PrismBadge renders label', (tester) async {
    await tester.pumpWidget(
      _wrap(const PrismBadge(label: 'Active', variant: PrismBadgeVariant.success)),
    );
    expect(find.text('ACTIVE'), findsOneWidget);
  });

  testWidgets('PrismTag renders with remove button', (tester) async {
    await tester.pumpWidget(
      _wrap(const PrismTag(label: 'flutter', onRemove: null)),
    );
    expect(find.text('flutter'), findsOneWidget);
  });

  testWidgets('PrismChip toggles selection', (tester) async {
    var selected = false;
    await tester.pumpWidget(
      _wrap(PrismChip(
        label: 'Filter',
        selected: selected,
        onToggle: () => selected = !selected,
      )),
    );
    expect(find.text('Filter'), findsOneWidget);
    await tester.tap(find.text('Filter'));
    expect(selected, isTrue);
  });

  testWidgets('PrismDivider renders horizontal', (tester) async {
    await tester.pumpWidget(
      _wrap(const PrismDivider()),
    );
    expect(find.byType(PrismDivider), findsOneWidget);
  });

  testWidgets('PrismLinearProgress renders with value', (tester) async {
    await tester.pumpWidget(
      _wrap(const PrismLinearProgress(value: 0.5, label: 'Progress')),
    );
    expect(find.text('PROGRESS'), findsOneWidget);
    expect(find.text('50%'), findsOneWidget);
  });

  testWidgets('PrismRadioGroup renders options', (tester) async {
    var selected = 'a';
    await tester.pumpWidget(
      _wrap(PrismRadioGroup<String>(
        value: selected,
        onChanged: (v) => selected = v,
        options: const [
          PrismRadioOption(value: 'a', label: 'Option A'),
          PrismRadioOption(value: 'b', label: 'Option B'),
        ],
      )),
    );
    expect(find.text('Option A'), findsOneWidget);
    expect(find.text('Option B'), findsOneWidget);
  });
}

Widget _wrap(Widget child) {
  return MaterialApp(
    theme: PrismTheme.dark,
    home: Scaffold(body: child),
  );
}
