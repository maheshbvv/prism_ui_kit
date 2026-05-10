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
                  label: 'Bottom Sheet',
                  variant: PrismVariant.ghost,
                  onPressed: () => PrismBottomSheet.show(
                    context,
                    title: 'Options',
                    children: [
                      PrismBottomSheetAction(
                        label: 'Export PDF',
                        icon: Icons.picture_as_pdf_outlined,
                        onTap: () => Navigator.of(context).pop(),
                      ),
                      PrismBottomSheetAction(
                        label: 'Delete',
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
