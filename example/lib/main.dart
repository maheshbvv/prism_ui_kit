import 'package:flutter/material.dart';
import 'package:prism_ui_kit/prism_ui_kit.dart';

void main() {
  runApp(const PrismExampleApp());
}

class PrismExampleApp extends StatelessWidget {
  const PrismExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prism UI Kit',
      theme: PrismTheme.dark,
      debugShowCheckedModeBanner: false,
      home: const ExamplePage(),
    );
  }
}

class ExamplePage extends StatefulWidget {
  const ExamplePage({super.key});

  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  bool _toggle = false;
  bool _check1 = true;
  String _radio = 'a';
  double _sliderVal = 60;
  int _navIndex = 0;
  bool _toggleTile = true;
  bool _singleChoice = false;
  bool _multiChoice = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PrismColors.ink,
      appBar: PrismAppBar(
        title: 'PRISM',
        subtitle: 'Example App',
        actions: [
          GestureDetector(
            onTap: () => PrismToast.show(
              context,
              message: 'Prism loaded successfully!',
              variant: PrismToastVariant.success,
            ),
            child: const Icon(Icons.bolt, color: PrismColors.amber, size: 22),
          ),
          const SizedBox(width: PrismSpacing.px20),
        ],
      ),
      bottomNavigationBar: PrismNavBar(
        currentIndex: _navIndex,
        onTap: (i) => setState(() => _navIndex = i),
        items: const [
          PrismNavBarItem(
            icon: PrismIcons.grid,
            selectedIcon: PrismIcons.grid,
            label: 'Kit',
          ),
          PrismNavBarItem(
            icon: PrismIcons.colorWheel,
            selectedIcon: PrismIcons.colorWheel,
            label: 'Colors',
          ),
          PrismNavBarItem(
            icon: PrismIcons.fileText,
            selectedIcon: PrismIcons.fileText,
            label: 'Type',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(PrismSpacing.px20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Buttons
            _sectionLabel('Buttons'),
            const SizedBox(height: PrismSpacing.px12),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                PrismButton(label: 'Primary', onPressed: () {}),
                PrismButton(label: 'Ghost', variant: PrismVariant.ghost, onPressed: () {}),
                PrismButton(label: 'Danger', variant: PrismVariant.danger, onPressed: () {}),
                PrismButton(label: 'Flat', variant: PrismVariant.flat, onPressed: () {}),
                PrismButton(label: 'Disabled', onPressed: null),
                PrismButton(label: 'Loading', isLoading: true, onPressed: () {}),
                PrismButton(
                  label: 'Icon',
                  leading: const Icon(Icons.add),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: PrismSpacing.px12),
            PrismButton(
              label: 'Full Width',
              isFullWidth: true,
              trailing: const Icon(Icons.arrow_forward),
              onPressed: () {},
            ),

            const PrismDivider(label: 'Form Controls'),

            // Input
            _sectionLabel('Text Input'),
            const SizedBox(height: PrismSpacing.px12),
            const PrismInput(
              label: 'Business Name',
              hint: 'e.g. Acme Inc.',
              helper: 'This appears on invoices.',
            ),
            const SizedBox(height: PrismSpacing.px16),
            const PrismInput(
              label: 'Email',
              hint: 'you@example.com',
              error: 'Invalid email address.',
              prefix: Icon(Icons.mail_outline),
            ),

            const SizedBox(height: PrismSpacing.px24),

            // Toggle + Checkbox + Radio
            _sectionLabel('Toggles'),
            const SizedBox(height: PrismSpacing.px12),
            PrismToggle(
              value: _toggle,
              label: 'Enable dark mode',
              description: 'Apply across all sessions.',
              onChanged: (v) => setState(() => _toggle = v),
            ),

            const SizedBox(height: PrismSpacing.px20),
            _sectionLabel('Checkboxes'),
            const SizedBox(height: PrismSpacing.px12),
            PrismCheckbox(
              value: _check1,
              label: 'Enable logging',
              onChanged: (v) => setState(() => _check1 = v),
            ),

            const SizedBox(height: PrismSpacing.px20),
            _sectionLabel('Radio'),
            const SizedBox(height: PrismSpacing.px12),
            PrismRadioGroup<String>(
              value: _radio,
              onChanged: (v) => setState(() => _radio = v),
              options: const [
                PrismRadioOption(value: 'a', label: 'Starter', description: 'For solo founders.'),
                PrismRadioOption(value: 'b', label: 'Pro', description: 'For growing teams.'),
              ],
            ),

            const SizedBox(height: PrismSpacing.px20),
            _sectionLabel('Slider'),
            const SizedBox(height: PrismSpacing.px12),
            PrismSlider(
              value: _sliderVal,
              min: 0,
              max: 100,
              label: 'Volume',
              onChanged: (v) => setState(() => _sliderVal = v),
            ),

            const PrismDivider(label: 'Data Display'),

            // Progress
            _sectionLabel('Progress'),
            const SizedBox(height: PrismSpacing.px12),
            const PrismLinearProgress(value: 0.72, label: 'Storage Used'),
            const SizedBox(height: PrismSpacing.px12),
            const PrismLinearProgress(
              value: 0.45,
              label: 'Segmented',
              accentColor: PrismColors.lime,
              segments: 5,
            ),

            const SizedBox(height: PrismSpacing.px20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const PrismCircularProgress(value: 0.72, label: 'CPU'),
                const PrismCircularProgress(
                  value: 0.45,
                  label: 'Memory',
                  accentColor: PrismColors.lime,
                ),
                const PrismCircularProgress(
                  value: 0,
                  indeterminate: true,
                  label: 'Loading',
                  accentColor: PrismColors.sky,
                ),
              ],
            ),

            const PrismDivider(label: 'Cards & Lists'),

            // Cards + Badges
            _sectionLabel('Cards'),
            const SizedBox(height: PrismSpacing.px12),
            const PrismCard(
              label: 'Revenue',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('₹ 1,24,500', style: PrismTypography.displayM),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.trending_up, color: PrismColors.lime, size: 14),
                      SizedBox(width: 4),
                      Text('+12.4% vs last month',
                          style: TextStyle(color: PrismColors.lime)),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: PrismSpacing.px20),
            _sectionLabel('Badges & Tags'),
            const SizedBox(height: PrismSpacing.px12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                const PrismBadge(label: 'Active', variant: PrismBadgeVariant.success, dot: true),
                const PrismBadge(label: 'Error', variant: PrismBadgeVariant.error, dot: true),
                const PrismBadge(label: 'Warning', variant: PrismBadgeVariant.warning),
                const PrismBadge(label: 'Neutral', variant: PrismBadgeVariant.neutral),
                const PrismBadge(label: 'Accent', variant: PrismBadgeVariant.accent),
              ],
            ),
            const SizedBox(height: PrismSpacing.px12),
            const Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                PrismTag(label: 'flutter'),
                PrismTag(label: 'dart'),
                PrismTag(label: 'prism', onRemove: null),
              ],
            ),

            const PrismDivider(label: 'Overlays'),

            // Dialog + Toast + Sheet
            _sectionLabel('Overlays'),
            const SizedBox(height: PrismSpacing.px12),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                PrismButton(
                  label: 'Dialog',
                  variant: PrismVariant.ghost,
                  onPressed: () => PrismDialog.show(
                    context,
                    title: 'Confirm Action',
                    body: const Text('This action cannot be undone.'),
                    isDestructive: true,
                    onPrimary: () => Navigator.of(context).pop(),
                  ),
                ),
                PrismButton(
                  label: 'Toast',
                  variant: PrismVariant.ghost,
                  onPressed: () => PrismToast.show(
                    context,
                    message: 'Changes saved.',
                    variant: PrismToastVariant.success,
                  ),
                ),
                PrismButton(
                  label: 'Alert',
                  variant: PrismVariant.ghost,
                  onPressed: () => PrismAlertPopup.show(
                    context,
                    title: 'Notice',
                    message: 'Your settings have been updated.',
                  ),
                ),
                PrismButton(
                  label: 'Confirm',
                  variant: PrismVariant.ghost,
                  onPressed: () => PrismConfirmationPopup.show(
                    context,
                    title: 'Delete Item',
                    message: 'This cannot be undone.',
                    isDestructive: true,
                  ),
                ),
                PrismButton(
                  label: 'Bottom Sheet',
                  variant: PrismVariant.ghost,
                  onPressed: () => PrismBottomSheet.show(
                    context,
                    title: 'Options',
                    children: [
                      PrismBottomSheetAction(
                        label: 'Export PDF',
                        icon: PrismIcons.fileText,
                        onTap: () => Navigator.of(context).pop(),
                      ),
                      PrismBottomSheetAction(
                        label: 'Delete',
                        icon: PrismIcons.trash,
                        isDestructive: true,
                        onTap: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const PrismDivider(label: 'New Components'),

            _sectionLabel('Info Banner'),
            const SizedBox(height: PrismSpacing.px8),
            const PrismInfoBanner(
              message: 'Your plan renews in 14 days.',
              variant: PrismToastVariant.warning,
              actionLabel: 'Renew',
            ),
            const SizedBox(height: PrismSpacing.px8),
            const PrismInfoBanner(
              message: 'Changes saved successfully.',
              variant: PrismToastVariant.success,
            ),

            const SizedBox(height: PrismSpacing.px20),
            _sectionLabel('Search Field'),
            const SizedBox(height: PrismSpacing.px8),
            const PrismSearchField(hint: 'Search components...'),

            const SizedBox(height: PrismSpacing.px20),
            _sectionLabel('Tabs'),
            const SizedBox(height: PrismSpacing.px8),
            PrismTabs(
              tabs: ['Explore', 'Library', 'Settings'],
              selectedIndex: 1,
              onTap: (_) {},
            ),

            const SizedBox(height: PrismSpacing.px20),
            _sectionLabel('Segment Bar'),
            const SizedBox(height: PrismSpacing.px8),
            PrismSegmentBar(
              segments: ['Day', 'Week', 'Month'],
              selectedIndex: 1,
              onTap: (_) {},
            ),

            const SizedBox(height: PrismSpacing.px20),
            _sectionLabel('Stepper'),
            const SizedBox(height: PrismSpacing.px8),
            const PrismStepper(
              steps: ['Cart', 'Shipping', 'Payment', 'Confirm'],
              currentStep: 2,
            ),

            const SizedBox(height: PrismSpacing.px20),
            _sectionLabel('Breadcrumbs'),
            const SizedBox(height: PrismSpacing.px8),
            const PrismBreadcrumbs(
              items: [
                PrismBreadcrumbItem(label: 'Home'),
                PrismBreadcrumbItem(label: 'Settings'),
                PrismBreadcrumbItem(label: 'Profile'),
              ],
            ),

            const SizedBox(height: PrismSpacing.px20),
            _sectionLabel('Selection Tiles'),
            const SizedBox(height: PrismSpacing.px8),
            PrismToggleTile(
              title: 'Dark Mode',
              subtitle: 'Apply across all screens',
              value: _toggleTile,
              onChanged: (v) => setState(() => _toggleTile = v),
            ),
            PrismSingleChoiceTile(
              title: 'Select this option',
              subtitle: 'Only one can be chosen',
              selected: _singleChoice,
              onTap: () => setState(() => _singleChoice = !_singleChoice),
            ),
            PrismMultiChoiceTile(
              title: 'Enable notifications',
              subtitle: 'Receive push alerts',
              checked: _multiChoice,
              onChanged: (v) => setState(() => _multiChoice = v),
            ),

            const SizedBox(height: PrismSpacing.px20),
            _sectionLabel('Rating'),
            const SizedBox(height: PrismSpacing.px8),
            PrismRating(rating: 3.5, onChanged: (_) {}, maxRating: 5),

            const SizedBox(height: PrismSpacing.px20),
            _sectionLabel('Copy Button'),
            const SizedBox(height: PrismSpacing.px8),
            const PrismCopyButton(text: 'api_key_abc123'),

            const SizedBox(height: PrismSpacing.px20),
            _sectionLabel('Spinner'),
            const SizedBox(height: PrismSpacing.px8),
            const Row(
              children: [
                PrismSpinner(color: PrismColors.amber, size: 20),
                SizedBox(width: 16),
                PrismSpinner(color: PrismColors.lime, size: 24),
                SizedBox(width: 16),
                PrismSpinner(color: PrismColors.sky, size: 28),
              ],
            ),

            const SizedBox(height: PrismSpacing.px20),
            _sectionLabel('Skeleton Loading'),
            const SizedBox(height: PrismSpacing.px8),
            const PrismSkeletonGroup(lines: 3, lineHeight: 14, lastLineWidth: 0.5),

            const SizedBox(height: PrismSpacing.px20),
            _sectionLabel('Empty State'),
            const SizedBox(height: PrismSpacing.px8),
            SizedBox(
              height: 200,
              child: PrismEmptyState(
                icon: PrismIcons.inbox,
                title: 'No messages yet',
                message: 'Your inbox is clean. Start a conversation.',
                actionLabel: 'Compose',
                onAction: () {},
              ),
            ),

            const SizedBox(height: PrismSpacing.px20),
            _sectionLabel('Tappable Icon'),
            const SizedBox(height: PrismSpacing.px8),
            Row(
              children: [
                PrismTappableIcon(icon: PrismIcons.heart, onPressed: () {}),
                const SizedBox(width: 16),
                PrismTappableIcon(icon: PrismIcons.bookmark, onPressed: () {}, color: PrismColors.amber),
                const SizedBox(width: 16),
                PrismTappableIcon(icon: PrismIcons.share, onPressed: () {}),
              ],
            ),

            const SizedBox(height: PrismSpacing.px20),
            _sectionLabel('CardBox'),
            const SizedBox(height: PrismSpacing.px8),
            const PrismCardBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Simple Box', style: PrismTypography.headingS),
                  SizedBox(height: 4),
                  Text('A plain bordered container without an accent line.'),
                ],
              ),
            ),

            const SizedBox(height: PrismSpacing.px20),
            _sectionLabel('Accordion'),
            const SizedBox(height: PrismSpacing.px8),
            PrismAccordion(
              title: 'Expand to see details',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Hidden content here.',
                      style: TextStyle(color: PrismColors.chalk.withValues(alpha: 0.6))),
                  SizedBox(height: 8),
                  Text('You can put any widget inside.',
                      style: TextStyle(color: PrismColors.chalk.withValues(alpha: 0.6))),
                ],
              ),
            ),

            const SizedBox(height: PrismSpacing.px48),

            // Footer
            Center(
              child: Text(
                'PRISM',
                style: PrismTypography.displayM.copyWith(
                  color: PrismColors.amber,
                  letterSpacing: 8,
                ),
              ),
            ),
            const SizedBox(height: PrismSpacing.px32),
          ],
        ),
      ),
    );
  }

  Widget _sectionLabel(String text) {
    return Text(
      text.toUpperCase(),
      style: PrismTypography.label.copyWith(color: PrismColors.amber),
    );
  }
}
