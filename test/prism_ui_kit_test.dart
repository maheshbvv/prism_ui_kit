import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:prism_ui_kit/prism_ui_kit.dart';

Widget _wrap(Widget child) {
  return MaterialApp(
    theme: PrismTheme.dark,
    home: Scaffold(body: child),
  );
}

void main() {
  // ── Existing tests ──

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

  // ── New component tests ──

  testWidgets('PrismSpinner renders', (tester) async {
    await tester.pumpWidget(
      _wrap(const PrismSpinner(color: PrismColors.amber, size: 20)),
    );
    expect(find.byType(PrismSpinner), findsOneWidget);
  });

  testWidgets('PrismEmptyState renders title and action', (tester) async {
    await tester.pumpWidget(
      _wrap(PrismEmptyState(
        icon: PrismIcons.inbox,
        title: 'No items',
        message: 'Nothing here yet.',
        actionLabel: 'Add',
        onAction: () {},
      )),
    );
    expect(find.text('NO ITEMS'), findsOneWidget);
    expect(find.text('Nothing here yet.'), findsOneWidget);
    expect(find.text('ADD'), findsOneWidget);
  });

  testWidgets('PrismInfoBanner renders message', (tester) async {
    await tester.pumpWidget(
      _wrap(const PrismInfoBanner(
        message: 'This is an info banner.',
        variant: PrismToastVariant.info,
      )),
    );
    expect(find.text('This is an info banner.'), findsOneWidget);
  });

  testWidgets('PrismInfoBanner dismisses on close', (tester) async {
    await tester.pumpWidget(
      _wrap(const PrismInfoBanner(
        message: 'Dismiss me.',
        variant: PrismToastVariant.info,
      )),
    );
    expect(find.text('Dismiss me.'), findsOneWidget);
    await tester.tap(find.byKey(const Key('prism_info_banner_dismiss')));
    await tester.pumpAndSettle();
    expect(find.text('Dismiss me.'), findsNothing);
  });

  testWidgets('PrismTabs renders and switches', (tester) async {
    var index = 0;
    await tester.pumpWidget(
      _wrap(PrismTabs(
        tabs: ['One', 'Two', 'Three'],
        selectedIndex: index,
        onTap: (i) => index = i,
      )),
    );
    expect(find.text('ONE'), findsOneWidget);
    expect(find.text('TWO'), findsOneWidget);
    await tester.tap(find.text('TWO'));
    expect(index, equals(1));
  });

  testWidgets('PrismSegmentBar renders and switches', (tester) async {
    var index = 0;
    await tester.pumpWidget(
      _wrap(PrismSegmentBar(
        segments: ['A', 'B', 'C'],
        selectedIndex: index,
        onTap: (i) => index = i,
      )),
    );
    expect(find.text('A'), findsOneWidget);
    expect(find.text('B'), findsOneWidget);
    await tester.tap(find.text('B'));
    expect(index, equals(1));
  });

  testWidgets('PrismStepper renders steps', (tester) async {
    await tester.pumpWidget(
      _wrap(const PrismStepper(
        steps: ['Step 1', 'Step 2', 'Step 3'],
        currentStep: 1,
      )),
    );
    expect(find.text('STEP 1'), findsOneWidget);
    expect(find.text('STEP 2'), findsOneWidget);
    expect(find.text('STEP 3'), findsOneWidget);
  });

  testWidgets('PrismBreadcrumbs renders items', (tester) async {
    await tester.pumpWidget(
      _wrap(const PrismBreadcrumbs(
        items: [
          PrismBreadcrumbItem(label: 'Home'),
          PrismBreadcrumbItem(label: 'Section'),
        ],
      )),
    );
    expect(find.text('HOME'), findsOneWidget);
    expect(find.text('SECTION'), findsOneWidget);
  });

  testWidgets('PrismSearchField renders and accepts input', (tester) async {
    String? value;
    await tester.pumpWidget(
      _wrap(PrismSearchField(
        hint: 'Find stuff',
        onChanged: (v) => value = v,
      )),
    );
    expect(find.text('Find stuff'), findsOneWidget);
    await tester.enterText(find.byType(TextField), 'hello');
    expect(value, equals('hello'));
  });

  testWidgets('PrismSearchField shows clear button', (tester) async {
    await tester.pumpWidget(
      _wrap(PrismSearchField(hint: 'Search')),
    );
    await tester.enterText(find.byType(TextField), 'text');
    await tester.pump();
    expect(find.byType(PrismIcon), findsNWidgets(2));
  });

  testWidgets('PrismToggleTile renders and toggles', (tester) async {
    var toggled = false;
    await tester.pumpWidget(
      _wrap(PrismToggleTile(
        title: 'Enable feature',
        value: toggled,
        onChanged: (v) => toggled = v,
      )),
    );
    expect(find.text('Enable feature'), findsOneWidget);
  });

  testWidgets('PrismSingleChoiceTile renders selection', (tester) async {
    await tester.pumpWidget(
      _wrap(PrismSingleChoiceTile(
        title: 'Pick me',
        selected: true,
        onTap: () {},
      )),
    );
    expect(find.text('Pick me'), findsOneWidget);
  });

  testWidgets('PrismMultiChoiceTile renders selection', (tester) async {
    var checked = false;
    await tester.pumpWidget(
      _wrap(PrismMultiChoiceTile(
        title: 'Check me',
        checked: checked,
        onChanged: (v) => checked = v,
      )),
    );
    expect(find.text('Check me'), findsOneWidget);
    await tester.tap(find.text('Check me'));
    expect(checked, isTrue);
  });

  testWidgets('PrismTappableIcon responds to tap', (tester) async {
    var tapped = false;
    await tester.pumpWidget(
      _wrap(PrismTappableIcon(
        icon: PrismIcons.heart,
        onPressed: () => tapped = true,
      )),
    );
    await tester.tap(find.byType(PrismTappableIcon));
    expect(tapped, isTrue);
  });

  testWidgets('PrismCopyButton copies text', (tester) async {
    await tester.pumpWidget(
      _wrap(const PrismCopyButton(text: 'secret_key')),
    );
    expect(find.text('COPY'), findsOneWidget);
    await tester.tap(find.text('COPY'));
    await tester.pump();
    expect(find.text('COPIED'), findsOneWidget);
    await tester.pump(const Duration(seconds: 3));
  });

  testWidgets('PrismRating renders stars', (tester) async {
    await tester.pumpWidget(
      _wrap(PrismRating(rating: 3.0, onChanged: (_) {}, maxRating: 5)),
    );
    expect(find.byType(PrismIcon), findsNWidgets(5));
  });

  testWidgets('PrismCardBox renders child', (tester) async {
    await tester.pumpWidget(
      _wrap(const PrismCardBox(
        child: Text('Box content'),
      )),
    );
    expect(find.text('Box content'), findsOneWidget);
  });

  testWidgets('PrismTile renders title', (tester) async {
    await tester.pumpWidget(
      _wrap(const PrismTile(title: 'Tile Title', subtitle: 'Subtitle')),
    );
    expect(find.text('Tile Title'), findsOneWidget);
    expect(find.text('Subtitle'), findsOneWidget);
  });

  testWidgets('PrismVerticalTile renders title', (tester) async {
    await tester.pumpWidget(
      _wrap(const PrismVerticalTile(title: 'Vertical', subtitle: 'Detail')),
    );
    expect(find.text('Vertical'), findsOneWidget);
    expect(find.text('Detail'), findsOneWidget);
  });

  testWidgets('PrismSkeleton renders', (tester) async {
    await tester.pumpWidget(
      _wrap(const PrismSkeleton(width: 100, height: 20)),
    );
    expect(find.byType(PrismSkeleton), findsOneWidget);
  });

  testWidgets('PrismSkeletonGroup renders lines', (tester) async {
    await tester.pumpWidget(
      _wrap(const PrismSkeletonGroup(lines: 3)),
    );
    expect(find.byType(PrismSkeleton), findsNWidgets(3));
  });

  testWidgets('PrismAccordion expands and collapses', (tester) async {
    await tester.pumpWidget(
      _wrap(const PrismAccordion(
        title: 'Expand me',
        child: Text('Hidden content'),
      )),
    );
    expect(find.text('Expand me'), findsOneWidget);
    await tester.tap(find.text('Expand me'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));
    expect(find.text('Hidden content'), findsOneWidget);
  });

  testWidgets('PrismNavigationRail renders destinations', (tester) async {
    var index = 0;
    await tester.pumpWidget(
      _wrap(SizedBox(
        height: 200,
        child: PrismNavigationRail(
          destinations: const [
            PrismNavigationRailDestination(
              icon: PrismIcons.home,
              selectedIcon: PrismIcons.home,
              label: 'Home',
            ),
            PrismNavigationRailDestination(
              icon: PrismIcons.settings,
              selectedIcon: PrismIcons.settings,
              label: 'Settings',
            ),
          ],
          selectedIndex: index,
          onDestinationSelected: (i) => index = i,
        ),
      )),
    );
    expect(find.text('HOME'), findsOneWidget);
    expect(find.text('SETTINGS'), findsOneWidget);
    await tester.tap(find.text('SETTINGS'));
    expect(index, equals(1));
  });

  testWidgets('PrismAvatarGroup renders overflow', (tester) async {
    await tester.pumpWidget(
      _wrap(const PrismAvatarGroup(
        initials: ['A', 'B', 'C', 'D', 'E'],
        max: 3,
      )),
    );
    expect(find.text('+2'), findsOneWidget);
  });

  testWidgets('PrismDashedBorder renders child', (tester) async {
    await tester.pumpWidget(
      _wrap(const PrismDashedBorder(
        child: Text('Dashed'),
      )),
    );
    expect(find.text('Dashed'), findsOneWidget);
  });

  testWidgets('PrismPopup shows when showPopup is true', (tester) async {
    await tester.pumpWidget(
      _wrap(const PrismPopup(
        showPopup: true,
        popup: Text('Tooltip content'),
        child: Text('Trigger'),
      )),
    );
    expect(find.text('Trigger'), findsOneWidget);
    expect(find.text('Tooltip content'), findsOneWidget);
  });

  testWidgets('PrismTooltip shows on long press', (tester) async {
    await tester.pumpWidget(
      _wrap(const PrismTooltip(
        message: 'Help text',
        child: Text('Hover me'),
      )),
    );
    expect(find.text('Hover me'), findsOneWidget);
    await tester.longPress(find.text('Hover me'));
    await tester.pump();
    expect(find.text('HELP TEXT'), findsOneWidget);
    await tester.pump(const Duration(seconds: 3));
  });

  testWidgets('PrismPicker items render in sheet', (tester) async {
    await tester.pumpWidget(
      _wrap(Placeholder()),
    );
    PrismPicker.show<int>(
      tester.element(find.byType(Placeholder)),
      title: 'Select',
      items: const [
        PrismPickerItem(value: 1, label: 'One'),
        PrismPickerItem(value: 2, label: 'Two'),
      ],
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));
    expect(find.text('Select'), findsOneWidget);
    expect(find.text('One'), findsOneWidget);
  });

  testWidgets('PrismOTPInput renders correct number of fields', (tester) async {
    await tester.pumpWidget(
      _wrap(PrismOTPInput(
        length: 4,
        onCompleted: (_) {},
      )),
    );
    expect(find.byType(TextField), findsNWidgets(4));
  });



  testWidgets('PrismPopupPosition enum has expected values', (tester) async {
    expect(PrismPopupPosition.bottom, isA<PrismPopupPosition>());
    expect(PrismPopupPosition.top, isA<PrismPopupPosition>());
    expect(PrismPopupPosition.left, isA<PrismPopupPosition>());
    expect(PrismPopupPosition.right, isA<PrismPopupPosition>());
  });

  testWidgets('PrismBreadcrumbItem stores label', (tester) async {
    const item = PrismBreadcrumbItem(label: 'Test');
    expect(item.label, equals('Test'));
  });

  testWidgets('PrismPickerItem stores value and label', (tester) async {
    const item = PrismPickerItem(value: 42, label: 'Answer');
    expect(item.value, equals(42));
    expect(item.label, equals('Answer'));
  });
}
