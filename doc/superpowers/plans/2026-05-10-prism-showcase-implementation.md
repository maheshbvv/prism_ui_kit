# Prism UI Kit Showcase Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Build a Flutter web showcase site at `prism.pendura.in` demonstrating all 20 Prism UI Kit components in a shadcn/ui-style documentation site.

**Architecture:** Single Flutter web app using GoRouter for URL-based routing (`/components/button`, etc.). Data-driven component pages — a single `ComponentPage` widget renders any of 20 components from a definition file that maps component name → preview builder + props + code snippet.

**Tech Stack:** Flutter Web, GoRouter, `prism_ui_kit` (self-dogfooding dark theme), `flutter_highlight` for code syntax highlighting.

**Project location:** `prism-ui-site` — new Flutter project, separate private GitHub repo.

---

### Task 1: Scaffold the Flutter project

**Files:**
- Create: `prism-ui-site/` (flutter create)
- Create: `prism-ui-site/pubspec.yaml`
- Create: `prism-ui-site/analysis_options.yaml`

- [ ] **Step 1: Create the Flutter project**

```bash
cd /Users/mahesh/FlutterDev
flutter create --org com.pendura --platforms web prism-ui-site
```

- [ ] **Step 2: Update pubspec.yaml**

```yaml
name: prism_ui_site
description: "Prism UI Kit component showcase"
publish_to: none
version: 1.0.0+1

environment:
  sdk: ^3.11.5

dependencies:
  flutter:
    sdk: flutter
  go_router: ^14.8.0
  flutter_highlight: ^0.7.0
  highlight: ^0.7.0
  prism_ui_kit: ^0.1.0

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^6.0.0

flutter:
  uses-material-design: true
```

- [ ] **Step 3: Update analysis_options.yaml**

```yaml
include: package:flutter_lints/flutter.yaml
```

- [ ] **Step 4: Run flutter pub get**

Run: `flutter pub get`
Expected: Resolving dependencies... complete

- [ ] **Step 5: Initial commit**

```bash
git add -A && git commit -m "chore: scaffold Flutter web project"
```

---

### Task 2: Build app shell — sidebar + content layout

**Files:**
- Create: `lib/app.dart`
- Modify: `lib/main.dart`

- [ ] **Step 1: Write main.dart**

```dart
import 'package:flutter/material.dart';
import 'app.dart';

void main() {
  runApp(const PrismShowcaseApp());
}
```

- [ ] **Step 2: Write app.dart — the MaterialApp.router shell**

```dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:prism_ui_kit/prism_ui_kit.dart';
import 'router.dart';
import 'widgets/sidebar.dart';

class PrismShowcaseApp extends StatelessWidget {
  const PrismShowcaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Prism UI Kit',
      theme: PrismTheme.dark,
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}

class AppShell extends StatelessWidget {
  const AppShell({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PrismColors.ink,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: 260,
              child: Sidebar(),
            ),
            Container(width: 1, color: PrismColors.border),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(PrismSpacing.px32),
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

- [ ] **Step 3: Verify it builds**

Run: `flutter analyze`
Expected: No issues found

- [ ] **Step 4: Commit**

```bash
git add -A && git commit -m "feat: add app shell with sidebar layout"
```

---

### Task 3: Build sidebar navigation

**Files:**
- Create: `lib/widgets/sidebar.dart`

- [ ] **Step 1: Write the sidebar**

```dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:prism_ui_kit/prism_ui_kit.dart';
import '../data/nav_items.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();

    return Container(
      height: double.infinity,
      color: PrismColors.surface1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Brand header
          Container(
            padding: const EdgeInsets.all(PrismSpacing.px20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'PRISM',
                  style: PrismTypography.displayM.copyWith(
                    color: PrismColors.amber,
                    letterSpacing: 4,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'UI Kit',
                  style: PrismTypography.label.copyWith(
                    color: PrismColors.chalk.withValues(alpha: 0.35),
                  ),
                ),
              ],
            ),
          ),
          Container(height: 1, color: PrismColors.border),
          // Nav items
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: PrismSpacing.px12),
              children: [
                _SectionHeader(label: 'Getting Started'),
                ...navItems.map((item) => _NavItem(
                      item: item,
                      selected: location == item.route ||
                          (item.route == '/installation' &&
                              location == '/'),
                    )),
                _SectionHeader(label: 'Components'),
                ...componentNavItems.map((item) => _NavItem(
                      item: item,
                      selected: location == item.route,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        PrismSpacing.px20,
        PrismSpacing.px16,
        PrismSpacing.px20,
        PrismSpacing.px6,
      ),
      child: Text(
        label.toUpperCase(),
        style: PrismTypography.label.copyWith(
          color: PrismColors.chalk.withValues(alpha: 0.3),
          fontSize: 10,
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({required this.item, required this.selected});
  final NavItem item;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.go(item.route),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: PrismSpacing.px20,
          vertical: PrismSpacing.px8,
        ),
        decoration: BoxDecoration(
          color: selected
              ? PrismColors.amber.withValues(alpha: 0.07)
              : Colors.transparent,
          border: Border(
            left: BorderSide(
              color: selected ? PrismColors.amber : Colors.transparent,
              width: 2,
            ),
          ),
        ),
        child: Text(
          item.label,
          style: PrismTypography.bodyM.copyWith(
            color: selected
                ? PrismColors.amber
                : PrismColors.chalk.withValues(alpha: 0.55),
            fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
```

- [ ] **Step 2: Create data/nav_items.dart**

```dart
class NavItem {
  const NavItem({required this.label, required this.route});
  final String label;
  final String route;
}

const navItems = [
  NavItem(label: 'Installation', route: '/installation'),
  NavItem(label: 'Theming', route: '/theming'),
];

const componentNavItems = [
  NavItem(label: 'Button', route: '/components/button'),
  NavItem(label: 'Input', route: '/components/input'),
  NavItem(label: 'Card', route: '/components/card'),
  NavItem(label: 'Badge', route: '/components/badge'),
  NavItem(label: 'Tag', route: '/components/tag'),
  NavItem(label: 'Chip', route: '/components/chip'),
  NavItem(label: 'Toggle', route: '/components/toggle'),
  NavItem(label: 'Checkbox', route: '/components/checkbox'),
  NavItem(label: 'Radio', route: '/components/radio'),
  NavItem(label: 'Slider', route: '/components/slider'),
  NavItem(label: 'Divider', route: '/components/divider'),
  NavItem(label: 'Dialog', route: '/components/dialog'),
  NavItem(label: 'Toast', route: '/components/toast'),
  NavItem(label: 'Bottom Sheet', route: '/components/bottom-sheet'),
  NavItem(label: 'Nav Bar', route: '/components/nav-bar'),
  NavItem(label: 'App Bar', route: '/components/app-bar'),
  NavItem(label: 'Avatar', route: '/components/avatar'),
  NavItem(label: 'Progress Linear', route: '/components/progress-linear'),
  NavItem(label: 'Progress Circular', route: '/components/progress-circular'),
  NavItem(label: 'List Tile', route: '/components/list-tile'),
];
```

- [ ] **Step 3: Verify**

Run: `flutter analyze`
Expected: No issues found

- [ ] **Step 4: Commit**

```bash
git add -A && git commit -m "feat: add sidebar navigation"
```

---

### Task 4: Build shared widgets — CodeBlock and PropsTable

**Files:**
- Create: `lib/widgets/code_block.dart`
- Create: `lib/widgets/props_table.dart`

- [ ] **Step 1: Write CodeBlock widget**

```dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prism_ui_kit/prism_ui_kit.dart';

class CodeBlock extends StatelessWidget {
  const CodeBlock({super.key, required this.code});

  final String code;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: PrismColors.surface0,
        border: Border.all(color: PrismColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header bar
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: PrismSpacing.px16,
              vertical: PrismSpacing.px8,
            ),
            decoration: BoxDecoration(
              color: PrismColors.surface2,
              border: Border(
                bottom: BorderSide(color: PrismColors.border),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'CODE',
                  style: PrismTypography.label.copyWith(
                    color: PrismColors.chalk.withValues(alpha: 0.35),
                    fontSize: 10,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Clipboard.setData(ClipboardData(text: code));
                    HapticFeedback.lightImpact();
                    if (context.mounted) {
                      PrismToast.show(
                        context,
                        message: 'Copied to clipboard',
                        variant: PrismToastVariant.success,
                      );
                    }
                  },
                  child: Text(
                    'COPY',
                    style: PrismTypography.label.copyWith(
                      color: PrismColors.amber,
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Code body
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(PrismSpacing.px16),
            child: SelectableText(
              code,
              style: TextStyle(
                fontFamily: 'monospace',
                fontSize: 13,
                height: 1.6,
                color: PrismColors.lime,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
```

- [ ] **Step 2: Write PropsTable widget**

```dart
import 'package:flutter/material.dart';
import 'package:prism_ui_kit/prism_ui_kit.dart';

class PropDef {
  const PropDef(this.name, this.type, this.description);
  final String name;
  final String type;
  final String description;
}

class PropsTable extends StatelessWidget {
  const PropsTable({super.key, required this.props});

  final List<PropDef> props;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: PrismColors.surface1,
        border: Border.all(color: PrismColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: PrismSpacing.px16,
              vertical: PrismSpacing.px8,
            ),
            decoration: BoxDecoration(
              color: PrismColors.surface2,
              border: Border(
                bottom: BorderSide(color: PrismColors.border),
              ),
            ),
            child: Text(
              'PROPS',
              style: PrismTypography.label.copyWith(
                color: PrismColors.chalk.withValues(alpha: 0.35),
                fontSize: 10,
              ),
            ),
          ),
          ...props.map((prop) => Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: PrismSpacing.px16,
                  vertical: PrismSpacing.px10,
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: PrismColors.border.withValues(alpha: 0.5)),
                  ),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 120,
                      child: Text(
                        prop.name,
                        style: TextStyle(
                          fontFamily: 'monospace',
                          fontSize: 12,
                          color: PrismColors.amber,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      child: Text(
                        prop.type,
                        style: TextStyle(
                          fontFamily: 'monospace',
                          fontSize: 12,
                          color: PrismColors.sky,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        prop.description,
                        style: TextStyle(
                          fontSize: 12,
                          color: PrismColors.chalk.withValues(alpha: 0.5),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
```

- [ ] **Step 3: Verify**

Run: `flutter analyze`
Expected: No issues found

- [ ] **Step 4: Commit**

```bash
git add -A && git commit -m "feat: add CodeBlock and PropsTable widgets"
```

---

### Task 5: Create Installation and Theming pages

**Files:**
- Create: `lib/pages/installation_page.dart`
- Create: `lib/pages/theming_page.dart`

- [ ] **Step 1: Write installation_page.dart**

```dart
import 'package:flutter/material.dart';
import 'package:prism_ui_kit/prism_ui_kit.dart';
import '../widgets/code_block.dart';

class InstallationPage extends StatelessWidget {
  const InstallationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Installation', style: PrismTypography.displayL),
        const SizedBox(height: PrismSpacing.px8),
        Text(
          'Add Prism UI Kit to your Flutter project.',
          style: PrismTypography.bodyL.copyWith(
            color: PrismColors.chalk.withValues(alpha: 0.6),
          ),
        ),
        const SizedBox(height: PrismSpacing.px32),
        Text('Add dependency', style: PrismTypography.headingL),
        const SizedBox(height: PrismSpacing.px12),
        const CodeBlock(
          code: 'flutter pub add prism_ui_kit',
        ),
        const SizedBox(height: PrismSpacing.px24),
        Text('Or add manually to pubspec.yaml', style: PrismTypography.headingL),
        const SizedBox(height: PrismSpacing.px12),
        const CodeBlock(
          code: '''dependencies:
  prism_ui_kit: ^0.1.0''',
        ),
        const SizedBox(height: PrismSpacing.px32),
        Text('Quick start', style: PrismTypography.headingL),
        const SizedBox(height: PrismSpacing.px12),
        const CodeBlock(
          code: '''import 'package:prism_ui_kit/prism_ui_kit.dart';

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: PrismTheme.dark,
      home: MyHomePage(),
    );
  }
}''',
        ),
      ],
    );
  }
}
```

- [ ] **Step 2: Write theming_page.dart**

```dart
import 'package:flutter/material.dart';
import 'package:prism_ui_kit/prism_ui_kit.dart';

class ThemingPage extends StatelessWidget {
  const ThemingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Theming', style: PrismTypography.displayL),
        const SizedBox(height: PrismSpacing.px8),
        Text(
          'Design tokens and theme configuration.',
          style: PrismTypography.bodyL.copyWith(
            color: PrismColors.chalk.withValues(alpha: 0.6),
          ),
        ),
        const SizedBox(height: PrismSpacing.px32),
        Text('Dark theme', style: PrismTypography.headingL),
        const SizedBox(height: PrismSpacing.px12),
        Text(
          'Apply via MaterialApp:',
          style: PrismTypography.bodyM.copyWith(
            color: PrismColors.chalk.withValues(alpha: 0.6),
          ),
        ),
        const SizedBox(height: PrismSpacing.px8),
        _TokenSwatch(
          label: 'Ink / Background',
          color: PrismColors.ink,
          hex: '#0A0A0A',
        ),
        _TokenSwatch(
          label: 'Chalk / Text',
          color: PrismColors.chalk,
          hex: '#F5F2EB',
        ),
        _TokenSwatch(
          label: 'Amber / Primary',
          color: PrismColors.amber,
          hex: '#FFB700',
        ),
        _TokenSwatch(
          label: 'Lime / Success',
          color: PrismColors.lime,
          hex: '#A8E63D',
        ),
        _TokenSwatch(
          label: 'Coral / Error',
          color: PrismColors.coral,
          hex: '#FF4D38',
        ),
        _TokenSwatch(
          label: 'Sky / Info',
          color: PrismColors.sky,
          hex: '#3D8EFF',
        ),
        const SizedBox(height: PrismSpacing.px32),
        Text('Typography', style: PrismTypography.headingL),
        const SizedBox(height: PrismSpacing.px16),
        Text('Display XL', style: PrismTypography.displayXL),
        Text('Display L', style: PrismTypography.displayL),
        Text('Display M', style: PrismTypography.displayM),
        const SizedBox(height: PrismSpacing.px12),
        Text('Heading L', style: PrismTypography.headingL),
        Text('Heading M', style: PrismTypography.headingM),
        Text('Heading S', style: PrismTypography.headingS),
        const SizedBox(height: PrismSpacing.px12),
        Text('Body L', style: PrismTypography.bodyL),
        Text('Body M', style: PrismTypography.bodyM),
        Text('Body S', style: PrismTypography.bodyS),
        const SizedBox(height: PrismSpacing.px12),
        Text('LABEL', style: PrismTypography.label),
        Text('mono 13', style: PrismTypography.mono),
      ],
    );
  }
}

class _TokenSwatch extends StatelessWidget {
  const _TokenSwatch({
    required this.label,
    required this.color,
    required this.hex,
  });

  final String label;
  final Color color;
  final String hex;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: PrismSpacing.px16,
        vertical: PrismSpacing.px12,
      ),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: PrismColors.border.withValues(alpha: 0.3))),
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: color,
              border: Border.all(color: PrismColors.border),
            ),
          ),
          const SizedBox(width: PrismSpacing.px16),
          Expanded(
            child: Text(label, style: PrismTypography.bodyM),
          ),
          Text(
            hex,
            style: PrismTypography.mono.copyWith(
              color: PrismColors.chalk.withValues(alpha: 0.4),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
```

- [ ] **Step 3: Verify**

Run: `flutter analyze`
Expected: No issues found

- [ ] **Step 4: Commit**

```bash
git add -A && git commit -m "feat: add Installation and Theming pages"
```

---

### Task 6: Create component data definitions

**Files:**
- Create: `lib/data/component_definitions.dart`
- Create: `lib/pages/component_page.dart`

- [ ] **Step 1: Write component_definitions.dart**

This file defines the `ComponentDefinition` model and a map of route → definition for all 20 components. Each definition includes: name, description, list of variants (label + widget), code snippet, and props.

```dart
import 'package:flutter/material.dart';
import 'package:prism_ui_kit/prism_ui_kit.dart';
import '../widgets/props_table.dart';

class ComponentVariant {
  const ComponentVariant(this.label, this.builder);
  final String label;
  final Widget Function() builder;
}

class ComponentDefinition {
  const ComponentDefinition({
    required this.name,
    required this.description,
    required this.variants,
    required this.codeSnippet,
    required this.props,
  });

  final String name;
  final String description;
  final List<ComponentVariant> variants;
  final String codeSnippet;
  final List<PropDef> props;
}

final componentDefinitions = <String, ComponentDefinition>{
  'button': const ComponentDefinition(
    name: 'Button',
    description: 'A neo-brutalist button with press-scale animation and multiple variants.',
    variants: [
      ComponentVariant('Primary', _primaryButton),
      ComponentVariant('Ghost', _ghostButton),
      ComponentVariant('Danger', _dangerButton),
      ComponentVariant('Flat', _flatButton),
      ComponentVariant('Loading', _loadingButton),
      ComponentVariant('With Icon', _iconButton),
      ComponentVariant('Full Width', _fullWidthButton),
    ],
    codeSnippet: '''PrismButton(
  label: 'Primary',
  variant: PrismVariant.primary,
  leading: Icon(Icons.add),
  onPressed: () {},
)''',
    props: [
      PropDef('label', 'String', 'Button text (auto-uppercased)'),
      PropDef('onPressed', 'VoidCallback?', 'Tap callback. null = disabled'),
      PropDef('variant', 'PrismVariant', 'primary, ghost, danger, flat'),
      PropDef('size', 'PrismSize', 'sm, md, lg'),
      PropDef('leading', 'Widget?', 'Widget before label'),
      PropDef('trailing', 'Widget?', 'Widget after label'),
      PropDef('isLoading', 'bool', 'Shows spinner when true'),
      PropDef('isFullWidth', 'bool', 'Fills parent width when true'),
    ],
  ),
  'input': const ComponentDefinition(
    name: 'Input',
    description: 'A text field with animated border, label, error state, and icon support.',
    variants: [
      ComponentVariant('Default', _inputDefault),
      ComponentVariant('With Error', _inputError),
      ComponentVariant('Password', _inputPassword),
    ],
    codeSnippet: '''PrismInput(
  label: 'Email',
  hint: 'you@example.com',
  error: 'Invalid email',
  prefix: Icon(Icons.mail_outline),
)''',
    props: [
      PropDef('label', 'String?', 'Label above input'),
      PropDef('hint', 'String?', 'Placeholder text'),
      PropDef('helper', 'String?', 'Helper text below input'),
      PropDef('error', 'String?', 'Error message'),
      PropDef('controller', 'TextEditingController?', 'Optional controller'),
      PropDef('obscureText', 'bool', 'Hide typed characters'),
      PropDef('prefix', 'Widget?', 'Leading icon/widget'),
      PropDef('suffix', 'Widget?', 'Trailing icon/widget'),
      PropDef('maxLines', 'int?', 'Multi-line count'),
    ],
  ),
  'card': const ComponentDefinition(
    name: 'Card',
    description: 'A content card with accent left border and optional header label.',
    variants: [
      ComponentVariant('Default', _cardDefault),
      ComponentVariant('With Alert', _cardAlert),
      ComponentVariant('With Avatar', _cardAvatar),
    ],
    codeSnippet: '''PrismCard(
  label: 'Revenue',
  accent: PrismColors.amber,
  child: Text('\$12,400'),
)''',
    props: [
      PropDef('child', 'Widget', 'Body content'),
      PropDef('accent', 'Color?', 'Left border color'),
      PropDef('label', 'String?', 'Header label'),
      PropDef('onTap', 'VoidCallback?', 'Tap callback'),
      PropDef('padding', 'EdgeInsetsGeometry?', 'Inner padding'),
    ],
  ),
  'badge': const ComponentDefinition(
    name: 'Badge',
    description: 'A compact status badge with optional dot indicator.',
    variants: [
      ComponentVariant('Success', _badgeSuccess),
      ComponentVariant('Error', _badgeError),
      ComponentVariant('Warning', _badgeWarning),
      ComponentVariant('Info', _badgeInfo),
      ComponentVariant('Neutral', _badgeNeutral),
      ComponentVariant('Accent', _badgeAccent),
    ],
    codeSnippet: '''PrismBadge(
  label: 'Active',
  variant: PrismBadgeVariant.success,
  dot: true,
)''',
    props: [
      PropDef('label', 'String', 'Badge text (uppercased)'),
      PropDef('variant', 'PrismBadgeVariant', 'success, error, warning, info, neutral, accent'),
      PropDef('dot', 'bool', 'Show dot indicator'),
    ],
  ),
  'tag': const ComponentDefinition(
    name: 'Tag',
    description: 'An inline monospace tag with optional remove action.',
    variants: [
      ComponentVariant('Default', _tagDefault),
      ComponentVariant('Removable', _tagRemovable),
    ],
    codeSnippet: '''PrismTag(
  label: 'flutter',
  onRemove: () {},
)''',
    props: [
      PropDef('label', 'String', 'Tag text'),
      PropDef('onRemove', 'VoidCallback?', 'Remove callback'),
    ],
  ),
  'chip': const ComponentDefinition(
    name: 'Chip',
    description: 'A selectable filter chip with animated background and optional icon.',
    variants: [
      ComponentVariant('Unselected', _chipUnselected),
      ComponentVariant('Selected', _chipSelected),
      ComponentVariant('With Icon', _chipIcon),
    ],
    codeSnippet: '''PrismChip(
  label: 'Active',
  selected: true,
  icon: Icons.check_circle_outline,
  onToggle: () {},
)''',
    props: [
      PropDef('label', 'String', 'Chip label'),
      PropDef('selected', 'bool', 'Selection state'),
      PropDef('onToggle', 'VoidCallback', 'Toggle callback'),
      PropDef('icon', 'IconData?', 'Leading icon'),
    ],
  ),
  'toggle': const ComponentDefinition(
    name: 'Toggle',
    description: 'An on/off toggle switch with label and description.',
    variants: [
      ComponentVariant('Off', _toggleOff),
      ComponentVariant('On', _toggleOn),
    ],
    codeSnippet: '''PrismToggle(
  value: true,
  label: 'Enable dark mode',
  description: 'Apply across sessions',
  onChanged: (v) {},
)''',
    props: [
      PropDef('value', 'bool', 'Toggle state'),
      PropDef('onChanged', 'ValueChanged<bool>', 'State change callback'),
      PropDef('label', 'String?', 'Label text'),
      PropDef('description', 'String?', 'Description text'),
    ],
  ),
  'checkbox': const ComponentDefinition(
    name: 'Checkbox',
    description: 'A custom checkbox with check and indeterminate states.',
    variants: [
      ComponentVariant('Unchecked', _checkboxUnchecked),
      ComponentVariant('Checked', _checkboxChecked),
      ComponentVariant('Indeterminate', _checkboxIndeterminate),
    ],
    codeSnippet: '''PrismCheckbox(
  value: true,
  label: 'Enable logging',
  onChanged: (v) {},
)''',
    props: [
      PropDef('value', 'bool', 'Checked state'),
      PropDef('onChanged', 'ValueChanged<bool>', 'State change callback'),
      PropDef('label', 'String?', 'Label text'),
      PropDef('indeterminate', 'bool', 'Show dash instead of check'),
    ],
  ),
  'radio': const ComponentDefinition(
    name: 'Radio',
    description: 'Radio group rendered as selectable cards.',
    variants: [
      ComponentVariant('Default', _radioDefault),
    ],
    codeSnippet: '''PrismRadioGroup<String>(
  value: selected,
  onChanged: (v) {},
  options: [
    PrismRadioOption(value: 'a', label: 'Option A'),
    PrismRadioOption(value: 'b', label: 'Option B'),
  ],
)''',
    props: [
      PropDef('options', 'List<PrismRadioOption<T>>', 'Available options'),
      PropDef('value', 'T', 'Currently selected value'),
      PropDef('onChanged', 'ValueChanged<T>', 'Selection callback'),
    ],
  ),
  'slider': const ComponentDefinition(
    name: 'Slider',
    description: 'A range input with square thumb, optional label, and segmented mode.',
    variants: [
      ComponentVariant('Continuous', _sliderContinuous),
      ComponentVariant('Segmented', _sliderSegmented),
    ],
    codeSnippet: '''PrismSlider(
  value: 60,
  min: 0,
  max: 100,
  label: 'Volume',
  onChanged: (v) {},
)''',
    props: [
      PropDef('value', 'double', 'Current value'),
      PropDef('onChanged', 'ValueChanged<double>', 'Drag callback'),
      PropDef('min', 'double', 'Minimum value'),
      PropDef('max', 'double', 'Maximum value'),
      PropDef('label', 'String?', 'Label text'),
      PropDef('showValue', 'bool', 'Show numeric value'),
      PropDef('divisions', 'int?', 'Discrete steps'),
      PropDef('accentColor', 'Color', 'Track/thumb color'),
    ],
  ),
  'divider': const ComponentDefinition(
    name: 'Divider',
    description: 'A structural divider with optional label, accent, and vertical mode.',
    variants: [
      ComponentVariant('Horizontal', _dividerHorizontal),
      ComponentVariant('With Label', _dividerLabel),
      ComponentVariant('Vertical', _dividerVertical),
    ],
    codeSnippet: '''PrismDivider(
  label: 'Section',
  accent: true,
)''',
    props: [
      PropDef('label', 'String?', 'Center label text'),
      PropDef('accent', 'bool', 'Use amber color'),
      PropDef('vertical', 'bool', 'Render as vertical line'),
      PropDef('height', 'double?', 'Vertical line height'),
    ],
  ),
  'dialog': const ComponentDefinition(
    name: 'Dialog',
    description: 'A modal dialog with accent header, body, and action buttons.',
    variants: [
      ComponentVariant('Default', _dialogDefault),
      ComponentVariant('Destructive', _dialogDestructive),
    ],
    codeSnippet: '''PrismDialog.show(
  context,
  title: 'Confirm',
  body: Text('Are you sure?'),
  isDestructive: true,
  onPrimary: () => Navigator.pop(context),
)''',
    props: [
      PropDef('title', 'String', 'Dialog title'),
      PropDef('body', 'Widget', 'Body content'),
      PropDef('primaryLabel', 'String', 'Primary button text'),
      PropDef('secondaryLabel', 'String', 'Secondary button text'),
      PropDef('onPrimary', 'VoidCallback?', 'Primary action'),
      PropDef('onSecondary', 'VoidCallback?', 'Secondary action'),
      PropDef('isDestructive', 'bool', 'Danger variant'),
      PropDef('accentColor', 'Color', 'Accent border color'),
    ],
  ),
  'toast': const ComponentDefinition(
    name: 'Toast',
    description: 'An overlay notification with slide-up animation and auto-dismiss.',
    variants: [
      ComponentVariant('Success', _toastSuccess),
      ComponentVariant('Error', _toastError),
      ComponentVariant('Warning', _toastWarning),
      ComponentVariant('Info', _toastInfo),
    ],
    codeSnippet: '''PrismToast.show(
  context,
  message: 'Saved!',
  variant: PrismToastVariant.success,
)''',
    props: [
      PropDef('message', 'String', 'Notification text'),
      PropDef('variant', 'PrismToastVariant', 'info, success, warning, error'),
      PropDef('duration', 'Duration', 'Auto-dismiss duration'),
    ],
  ),
  'bottom-sheet': const ComponentDefinition(
    name: 'Bottom Sheet',
    description: 'A modal bottom sheet with title and tappable action children.',
    variants: [
      ComponentVariant('Default', _bottomSheetDefault),
    ],
    codeSnippet: '''PrismBottomSheet.show(
  context,
  title: 'Options',
  children: [
    PrismBottomSheetAction(
      label: 'Export PDF',
      onTap: () => Navigator.pop(context),
    ),
  ],
)''',
    props: [
      PropDef('title', 'String', 'Sheet title'),
      PropDef('children', 'List<Widget>', 'Action widgets'),
    ],
  ),
  'nav-bar': const ComponentDefinition(
    name: 'Nav Bar',
    description: 'A bottom navigation bar with animated selection highlighting.',
    variants: [
      ComponentVariant('Default', _navBarDefault),
    ],
    codeSnippet: '''PrismNavBar(
  currentIndex: 0,
  onTap: (i) {},
  items: [
    PrismNavBarItem(icon: Icons.home, selectedIcon: Icons.home, label: 'Home'),
    PrismNavBarItem(icon: Icons.search, selectedIcon: Icons.search, label: 'Search'),
  ],
)''',
    props: [
      PropDef('items', 'List<PrismNavBarItem>', 'Tab items'),
      PropDef('currentIndex', 'int', 'Selected tab index'),
      PropDef('onTap', 'ValueChanged<int>', 'Tab tap callback'),
    ],
  ),
  'app-bar': const ComponentDefinition(
    name: 'App Bar',
    description: 'A top app bar with accent line, subtitle, and action slots.',
    variants: [
      ComponentVariant('Default', _appBarDefault),
    ],
    codeSnippet: '''PrismAppBar(
  title: 'Screen',
  subtitle: 'Subtitle',
  actions: [Icon(Icons.settings)],
)''',
    props: [
      PropDef('title', 'String', 'Title text'),
      PropDef('subtitle', 'String?', 'Subtitle text'),
      PropDef('leading', 'Widget?', 'Leading widget'),
      PropDef('actions', 'List<Widget>', 'Trailing action widgets'),
      PropDef('accentLine', 'bool', 'Show amber bottom border'),
    ],
  ),
  'avatar': const ComponentDefinition(
    name: 'Avatar',
    description: 'A user avatar with optional image, initials fallback, and presence dot.',
    variants: [
      ComponentVariant('Initials', _avatarInitials),
      ComponentVariant('With Presence', _avatarPresence),
      ComponentVariant('Sizes', _avatarSizes),
    ],
    codeSnippet: '''PrismAvatar(
  initials: 'MV',
  size: 40,
  presence: PrismPresence.online,
)''',
    props: [
      PropDef('imageUrl', 'String?', 'Image URL'),
      PropDef('initials', 'String?', 'Fallback initials'),
      PropDef('size', 'double', 'Diameter'),
      PropDef('presence', 'PrismPresence?', 'Status dot'),
      PropDef('accentColor', 'Color', 'Border color'),
    ],
  ),
  'progress-linear': const ComponentDefinition(
    name: 'Progress Linear',
    description: 'A linear progress bar with optional percentage and segmented mode.',
    variants: [
      ComponentVariant('Solid', _progressLinearSolid),
      ComponentVariant('Segmented', _progressLinearSegmented),
    ],
    codeSnippet: '''PrismLinearProgress(
  value: 0.72,
  label: 'Storage',
  segments: 5,
)''',
    props: [
      PropDef('value', 'double', '0.0 – 1.0'),
      PropDef('label', 'String?', 'Label text'),
      PropDef('showPercent', 'bool', 'Show percentage'),
      PropDef('accentColor', 'Color', 'Fill color'),
      PropDef('height', 'double', 'Bar height'),
      PropDef('segments', 'int?', 'Segmented mode count'),
    ],
  ),
  'progress-circular': const ComponentDefinition(
    name: 'Progress Circular',
    description: 'A circular progress indicator with determinate and indeterminate modes.',
    variants: [
      ComponentVariant('Determinate', _progressCircularDet),
      ComponentVariant('Indeterminate', _progressCircularIndet),
    ],
    codeSnippet: '''PrismCircularProgress(
  value: 0.72,
  label: 'CPU',
  size: 64,
)''',
    props: [
      PropDef('value', 'double', '0.0 – 1.0'),
      PropDef('size', 'double', 'Diameter'),
      PropDef('strokeWidth', 'double', 'Arc thickness'),
      PropDef('accentColor', 'Color', 'Arc color'),
      PropDef('label', 'String?', 'Label text'),
      PropDef('indeterminate', 'bool', 'Spinning mode'),
    ],
  ),
  'list-tile': const ComponentDefinition(
    name: 'List Tile',
    description: 'A list tile with leading, trailing, accent left border, and dense mode.',
    variants: [
      ComponentVariant('Default', _listTileDefault),
      ComponentVariant('With Accent', _listTileAccent),
      ComponentVariant('Dense', _listTileDense),
    ],
    codeSnippet: '''PrismListTile(
  title: 'Item',
  subtitle: 'Description',
  leading: Icon(Icons.folder),
  trailing: PrismBadge(label: 'Active'),
  accentLeft: PrismColors.amber,
  onTap: () {},
)''',
    props: [
      PropDef('title', 'String', 'Title text'),
      PropDef('subtitle', 'String?', 'Subtitle text'),
      PropDef('leading', 'Widget?', 'Leading widget'),
      PropDef('trailing', 'Widget?', 'Trailing widget'),
      PropDef('onTap', 'VoidCallback?', 'Tap callback'),
      PropDef('accentLeft', 'Color?', 'Left border color'),
      PropDef('dense', 'bool', 'Reduced padding'),
    ],
  ),
};

// ── Noop callbacks for previews ──

void _noopToggle(bool v) {}
void _noopChecked(bool v) {}
void _noopRadio(String v) {}

// ── Preview builders ──

Widget _primaryButton() => PrismButton(label: 'Primary', onPressed: () {});
Widget _ghostButton() => PrismButton(label: 'Ghost', variant: PrismVariant.ghost, onPressed: () {});
Widget _dangerButton() => PrismButton(label: 'Danger', variant: PrismVariant.danger, onPressed: () {});
Widget _flatButton() => PrismButton(label: 'Flat', variant: PrismVariant.flat, onPressed: () {});
Widget _loadingButton() => PrismButton(label: 'Loading', isLoading: true, onPressed: () {});
Widget _iconButton() => PrismButton(label: 'Icon', leading: const Icon(Icons.add), onPressed: () {});
Widget _fullWidthButton() => PrismButton(label: 'Full Width', isFullWidth: true, onPressed: () {});

Widget _inputDefault() => const PrismInput(
      label: 'Business Name',
      hint: 'e.g. Acme Inc.',
      helper: 'Appears on invoices.',
    );
Widget _inputError() => const PrismInput(
      label: 'Email',
      hint: 'you@example.com',
      error: 'Invalid email.',
      prefix: Icon(Icons.mail_outline),
    );
Widget _inputPassword() => const PrismInput(
      label: 'Password',
      hint: '············',
      obscureText: true,
      suffix: Icon(Icons.visibility_outlined),
    );

Widget _cardDefault() => const PrismCard(
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
    );
Widget _cardAlert() => const PrismCard(
      label: 'System Alert',
      accent: PrismColors.coral,
      child: Text('Replication lag exceeded 500ms.'),
    );
Widget _cardAvatar() => const PrismCard(
      accent: PrismColors.sky,
      child: Row(
        children: [
          PrismAvatar(initials: 'MV', presence: PrismPresence.online),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Mahesh V', style: PrismTypography.headingS),
                Text('Founder',
                    style: TextStyle(color: PrismColors.chalk, fontSize: 12)),
              ],
            ),
          ),
          PrismBadge(label: 'Admin', variant: PrismBadgeVariant.accent),
        ],
      ),
    );

Widget _badgeSuccess() => const PrismBadge(label: 'Active', variant: PrismBadgeVariant.success, dot: true);
Widget _badgeError() => const PrismBadge(label: 'Error', variant: PrismBadgeVariant.error, dot: true);
Widget _badgeWarning() => const PrismBadge(label: 'Warning', variant: PrismBadgeVariant.warning);
Widget _badgeInfo() => const PrismBadge(label: 'Info', variant: PrismBadgeVariant.info);
Widget _badgeNeutral() => const PrismBadge(label: 'Neutral', variant: PrismBadgeVariant.neutral);
Widget _badgeAccent() => const PrismBadge(label: 'Accent', variant: PrismBadgeVariant.accent);

Widget _tagDefault() => const PrismTag(label: 'flutter');
Widget _tagRemovable() => const PrismTag(label: 'dart', onRemove: null);

var _chipSelected = false;
Widget _chipUnselected() => StatefulBuilder(
      builder: (context, setState) => PrismChip(
        label: 'Filter',
        selected: false,
        onToggle: () {},
      ),
    );
Widget _chipSelected() => StatefulBuilder(
      builder: (context, setState) => PrismChip(
        label: 'Active',
        selected: true,
        icon: Icons.check_circle_outline,
        onToggle: () {},
      ),
    );
Widget _chipIcon() => StatefulBuilder(
      builder: (context, setState) => PrismChip(
        label: 'Pending',
        selected: false,
        icon: Icons.hourglass_empty,
        onToggle: () {},
      ),
    );

Widget _toggleOff() => const PrismToggle(
      value: false,
      label: 'Notifications',
      onChanged: _noopToggle,
    );
Widget _toggleOn() => const PrismToggle(
      value: true,
      label: 'Dark mode',
      description: 'Apply across all sessions',
      onChanged: _noopToggle,
    );

Widget _checkboxUnchecked() => const PrismCheckbox(value: false, label: 'Unchecked', onChanged: _noopChecked);
Widget _checkboxChecked() => const PrismCheckbox(value: true, label: 'Checked', onChanged: _noopChecked);
Widget _checkboxIndeterminate() => const PrismCheckbox(value: false, indeterminate: true, label: 'Partial', onChanged: _noopChecked);

Widget _radioDefault() => PrismRadioGroup<String>(
      value: 'a',
      onChanged: _noopRadio,
      options: const [
        PrismRadioOption(value: 'a', label: 'Starter', description: 'For solo founders.'),
        PrismRadioOption(value: 'b', label: 'Pro', description: 'For growing teams.'),
        PrismRadioOption(value: 'c', label: 'Enterprise', description: 'Custom limits.'),
      ],
    );

Widget _sliderContinuous() => StatefulBuilder(
      builder: (context, setState) => PrismSlider(
        value: 60,
        min: 0,
        max: 100,
        label: 'Volume',
        onChanged: (v) {},
      ),
    );
Widget _sliderSegmented() => StatefulBuilder(
      builder: (context, setState) => PrismSlider(
        value: 60,
        min: 0,
        max: 100,
        label: 'Steps',
        divisions: 5,
        accentColor: PrismColors.lime,
        onChanged: (v) {},
      ),
    );

Widget _dividerHorizontal() => const Column(
      children: [
        Text('Section A'),
        PrismDivider(),
        Text('Section B'),
      ],
    );
Widget _dividerLabel() => const PrismDivider(label: 'Section Break', accent: true);
Widget _dividerVertical() => const Row(
      children: [
        Text('Left'),
        PrismDivider(vertical: true, height: 40),
        Text('Right'),
      ],
    );

Widget _dialogDefault() => Builder(
      builder: (context) => PrismButton(
        label: 'Show Dialog',
        onPressed: () => PrismDialog.show(
          context,
          title: 'Confirm',
          body: const Text('Are you sure?'),
          onPrimary: () => Navigator.of(context).pop(),
        ),
      ),
    );
Widget _dialogDestructive() => Builder(
      builder: (context) => PrismButton(
        label: 'Delete',
        variant: PrismVariant.danger,
        onPressed: () => PrismDialog.show(
          context,
          title: 'Delete Record',
          body: const Text('This action is permanent.'),
          isDestructive: true,
          onPrimary: () => Navigator.of(context).pop(),
        ),
      ),
    );

Widget _toastSuccess() => Builder(
      builder: (context) => PrismButton(
        label: 'Success Toast',
        variant: PrismVariant.ghost,
        onPressed: () => PrismToast.show(
          context,
          message: 'Saved successfully.',
          variant: PrismToastVariant.success,
        ),
      ),
    );
Widget _toastError() => Builder(
      builder: (context) => PrismButton(
        label: 'Error Toast',
        variant: PrismVariant.ghost,
        onPressed: () => PrismToast.show(
          context,
          message: 'Something went wrong.',
          variant: PrismToastVariant.error,
        ),
      ),
    );
Widget _toastWarning() => Builder(
      builder: (context) => PrismButton(
        label: 'Warning Toast',
        variant: PrismVariant.ghost,
        onPressed: () => PrismToast.show(
          context,
          message: 'Disk space low.',
          variant: PrismToastVariant.warning,
        ),
      ),
    );
Widget _toastInfo() => Builder(
      builder: (context) => PrismButton(
        label: 'Info Toast',
        variant: PrismVariant.ghost,
        onPressed: () => PrismToast.show(
          context,
          message: 'New update available.',
          variant: PrismToastVariant.info,
        ),
      ),
    );

Widget _bottomSheetDefault() => Builder(
      builder: (context) => PrismButton(
        label: 'Open Sheet',
        variant: PrismVariant.ghost,
        onPressed: () => PrismBottomSheet.show(
          context,
          title: 'Export Options',
          children: [
            PrismBottomSheetAction(
              label: 'Export as PDF',
              icon: Icons.picture_as_pdf_outlined,
              onTap: () => Navigator.of(context).pop(),
            ),
            PrismBottomSheetAction(
              label: 'Export as CSV',
              icon: Icons.table_chart_outlined,
              onTap: () => Navigator.of(context).pop(),
            ),
            PrismBottomSheetAction(
              label: 'Delete Record',
              icon: Icons.delete_outline,
              isDestructive: true,
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );

Widget _navBarDefault() => StatefulBuilder(
      builder: (context, setState) => SizedBox(
        width: 400,
        child: PrismNavBar(
          currentIndex: 0,
          onTap: (i) {},
          items: const [
            PrismNavBarItem(
              icon: Icons.home_outlined,
              selectedIcon: Icons.home,
              label: 'Home',
            ),
            PrismNavBarItem(
              icon: Icons.search_outlined,
              selectedIcon: Icons.search,
              label: 'Search',
            ),
            PrismNavBarItem(
              icon: Icons.settings_outlined,
              selectedIcon: Icons.settings,
              label: 'Settings',
            ),
          ],
        ),
      ),
    );

Widget _appBarDefault() => const PrismAppBar(
      title: 'Screen Title',
      subtitle: 'Optional subtitle',
      actions: [Icon(Icons.bolt, color: PrismColors.amber)],
    );

Widget _avatarInitials() => const PrismAvatar(initials: 'MV', size: 48);
Widget _avatarPresence() => const Row(
      children: [
        PrismAvatar(initials: 'AK', size: 40, presence: PrismPresence.online),
        SizedBox(width: 12),
        PrismAvatar(initials: 'RJ', size: 40, presence: PrismPresence.busy, accentColor: PrismColors.coral),
        SizedBox(width: 12),
        PrismAvatar(initials: 'PX', size: 40, presence: PrismPresence.offline),
      ],
    );
Widget _avatarSizes() => const Row(
      children: [
        PrismAvatar(initials: 'S', size: 24),
        SizedBox(width: 8),
        PrismAvatar(initials: 'M', size: 32),
        SizedBox(width: 8),
        PrismAvatar(initials: 'L', size: 48),
        SizedBox(width: 8),
        PrismAvatar(initials: 'XL', size: 64),
      ],
    );

Widget _progressLinearSolid() => const PrismLinearProgress(value: 0.72, label: 'Storage Used');
Widget _progressLinearSegmented() => const PrismLinearProgress(
      value: 0.45,
      label: 'Segmented',
      accentColor: PrismColors.lime,
      segments: 5,
    );

Widget _progressCircularDet() => const PrismCircularProgress(value: 0.72, label: 'CPU');
Widget _progressCircularIndet() => const PrismCircularProgress(value: 0, indeterminate: true, label: 'Loading');

Widget _listTileDefault() => const PrismListTile(
      title: 'Clinic Billing',
      subtitle: 'Updated 2 hours ago',
      leading: Icon(Icons.receipt_long, color: PrismColors.amber),
      onTap: null,
    );
Widget _listTileAccent() => const PrismListTile(
      title: 'TrashFlow',
      subtitle: 'Last sync 5 min ago',
      leading: Icon(Icons.delete_outline, color: PrismColors.coral),
      accentLeft: PrismColors.coral,
      trailing: PrismBadge(label: 'Active', variant: PrismBadgeVariant.success),
      onTap: null,
    );
Widget _listTileDense() => const PrismListTile(
      title: 'Backstage',
      subtitle: 'Draft mode',
      leading: Icon(Icons.movie_creation_outlined, color: PrismColors.lime),
      dense: true,
      onTap: null,
    );
```

- [ ] **Step 2: Write component_page.dart**

```dart
import 'package:flutter/material.dart';
import 'package:prism_ui_kit/prism_ui_kit.dart';
import '../data/component_definitions.dart';
import '../widgets/code_block.dart';
import '../widgets/props_table.dart';

class ComponentPage extends StatelessWidget {
  const ComponentPage({super.key, required this.definition});

  final ComponentDefinition definition;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(definition.name, style: PrismTypography.displayL),
        const SizedBox(height: PrismSpacing.px8),
        Text(
          definition.description,
          style: PrismTypography.bodyL.copyWith(
            color: PrismColors.chalk.withValues(alpha: 0.6),
          ),
        ),
        const SizedBox(height: PrismSpacing.px32),
        // Preview section
        Text('Preview', style: PrismTypography.headingL),
        const SizedBox(height: PrismSpacing.px16),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: PrismColors.surface1,
            border: Border.all(color: PrismColors.border),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Variant tabs
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: PrismSpacing.px16,
                  vertical: PrismSpacing.px8,
                ),
                decoration: BoxDecoration(
                  color: PrismColors.surface2,
                  border: Border(
                    bottom: BorderSide(color: PrismColors.border),
                  ),
                ),
                child: Text(
                  'PREVIEW',
                  style: PrismTypography.label.copyWith(
                    color: PrismColors.chalk.withValues(alpha: 0.35),
                    fontSize: 10,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(PrismSpacing.px24),
                child: Wrap(
                  spacing: PrismSpacing.px16,
                  runSpacing: PrismSpacing.px16,
                  children: definition.variants
                      .map((v) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (definition.variants.length > 1)
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8),
                                  child: Text(
                                    v.label.toUpperCase(),
                                    style: PrismTypography.label.copyWith(
                                      color: PrismColors.chalk.withValues(alpha: 0.3),
                                      fontSize: 9,
                                    ),
                                  ),
                                ),
                              v.builder(),
                            ],
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: PrismSpacing.px32),
        // Code section
        Text('Code', style: PrismTypography.headingL),
        const SizedBox(height: PrismSpacing.px16),
        CodeBlock(code: definition.codeSnippet),
        const SizedBox(height: PrismSpacing.px32),
        // Props section
        if (definition.props.isNotEmpty) ...[
          Text('Props', style: PrismTypography.headingL),
          const SizedBox(height: PrismSpacing.px16),
          PropsTable(props: definition.props),
        ],
      ],
    );
  }
}
```

- [ ] **Step 3: Verify**

Run: `flutter analyze`
Expected: No issues found

- [ ] **Step 4: Commit**

```bash
git add -A && git commit -m "feat: add component definitions and generic ComponentPage"
```

---

### Task 7: Wire up GoRouter

**Files:**
- Create: `lib/router.dart`

- [ ] **Step 1: Write router.dart**

```dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'app.dart';
import 'data/component_definitions.dart';
import 'pages/installation_page.dart';
import 'pages/theming_page.dart';
import 'pages/component_page.dart';

final router = GoRouter(
  initialLocation: '/installation',
  routes: [
    ShellRoute(
      builder: (context, state, child) => AppShell(child: child),
      routes: [
        GoRoute(
          path: '/',
          redirect: (context, state) => '/installation',
        ),
        GoRoute(
          path: '/installation',
          builder: (context, state) => const InstallationPage(),
        ),
        GoRoute(
          path: '/theming',
          builder: (context, state) => const ThemingPage(),
        ),
        GoRoute(
          path: '/components/:name',
          builder: (context, state) {
            final name = state.pathParameters['name']!;
            final definition = componentDefinitions[name];
            if (definition == null) {
              return const Center(
                child: Text('Component not found',
                    style: TextStyle(color: PrismColors.coral)),
              );
            }
            return ComponentPage(definition: definition);
          },
        ),
      ],
    ),
  ],
);
```

- [ ] **Step 2: Verify**

Run: `flutter analyze`
Expected: No issues found

- [ ] **Step 3: Build and test**

Run: `flutter build web`
Expected: Compiled successfully

- [ ] **Step 4: Commit**

```bash
git add -A && git commit -m "feat: wire up GoRouter with all routes"
```

---

### Task 8: Final verification

- [ ] **Step 1: Full analysis check**

Run: `flutter analyze`
Expected: No issues found

- [ ] **Step 2: Full web build**

Run: `flutter build web --release`
Expected: `build/web/` directory created successfully

- [ ] **Step 3: Push to GitHub**

```bash
git remote add origin <your-private-repo-url>
git push -u origin main
```

- [ ] **Step 4: Deployment note**

The `build/web/` directory contains the static site. Deploy its contents to the `prism.pendura.in` subdomain using your preferred hosting provider (Netlify, Vercel, Cloudflare Pages, or direct nginx). Point DNS at the provider.
