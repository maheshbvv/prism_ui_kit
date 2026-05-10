# Prism UI Kit

A **neo-brutalist** design system for Flutter. 20+ components built with structural honesty — no shadows, no blur, no Material, no Cupertino. Just raw, intentional form.

## Philosophy

Prism rejects decorative UI. Every component exposes its grid anatomy:

- **No shadows** — depth comes from borders and color contrast
- **No blurs** — transparency is binary, not filtered
- **No Material/Cupertino** — platform-agnostic editorial aesthetic
- **Bold accents** — amber, lime, coral, sky on dark ink canvas
- **Structural borders** — every component shows its edges

## Components

| # | Component | Description |
|---|-----------|-------------|
| 1 | `PrismTheme` | Dark/light design tokens (colors, typography, spacing) |
| 2 | `PrismButton` | Primary / Ghost / Danger / Flat + loading, icons, sizes |
| 3 | `PrismInput` | Text field with animated border, error state, prefix/suffix |
| 4 | `PrismCard` | Content card with accent border and optional label |
| 5 | `PrismBadge` | Status badges (success, error, warning, info, neutral, accent) |
| 6 | `PrismTag` | Inline content tags with optional remove action |
| 7 | `PrismChip` | Selectable filter chips with icon support |
| 8 | `PrismToggle` | On/off toggle switch with label and description |
| 9 | `PrismCheckbox` | Custom checkbox with check and indeterminate states |
| 10 | `PrismRadio` | Radio group with card-style options |
| 11 | `PrismSlider` | Range input with square thumb and segmented mode |
| 12 | `PrismDivider` | Horizontal/vertical divider with optional label |
| 13 | `PrismDialog` | Modal dialog with accent header and actions |
| 14 | `PrismToast` | Overlay notification with variant colors |
| 15 | `PrismBottomSheet` | Action sheet with title and tappable actions |
| 16 | `PrismNavBar` | Bottom navigation bar with animated selection |
| 17 | `PrismAppBar` | Top app bar with accent line, subtitle, actions |
| 18 | `PrismAvatar` | User avatar with initials and presence indicator |
| 19 | `PrismProgress` | Linear (solid/segmented) and circular progress |
| 20 | `PrismListTile` | List tile with leading, trailing, accent left, dense mode |

## Getting started

Add to your `pubspec.yaml`:

```yaml
dependencies:
  prism_ui_kit: ^0.0.1
```

## Usage

### 1. Apply the theme

```dart
import 'package:prism_ui_kit/prism_ui_kit.dart';

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: PrismTheme.dark,   // or PrismTheme.light
      home: MyHomePage(),
    );
  }
}
```

### 2. Use components

```dart
// Button
PrismButton(
  label: 'Get Started',
  variant: PrismVariant.primary,
  leading: const Icon(Icons.bolt),
  onPressed: () {},
)

// Input with error
PrismInput(
  label: 'Email',
  hint: 'you@example.com',
  error: 'Invalid email',
  prefix: const Icon(Icons.mail_outline),
)

// Card with accent
PrismCard(
  label: 'Revenue',
  accent: PrismColors.amber,
  child: Text('\$ 12,400', style: PrismTypography.displayM),
)

// Toggle
PrismToggle(
  value: true,
  label: 'Enable notifications',
  onChanged: (v) {},
)

// Dialog
PrismDialog.show(
  context,
  title: 'Confirm',
  body: const Text('Are you sure?'),
  primaryLabel: 'Delete',
  isDestructive: true,
  onPrimary: () => Navigator.of(context).pop(),
)

// Toast
PrismToast.show(
  context,
  message: 'Saved successfully.',
  variant: PrismToastVariant.success,
)
```

## Design Tokens

### Colors

| Token | Hex | Usage |
|-------|-----|-------|
| `PrismColors.ink` | `#0A0A0A` | Background / dark base |
| `PrismColors.chalk` | `#F5F2EB` | Text / light base |
| `PrismColors.amber` | `#FFB700` | Primary accent |
| `PrismColors.lime` | `#A8E63D` | Success |
| `PrismColors.coral` | `#FF4D38` | Error / danger |
| `PrismColors.sky` | `#3D8EFF` | Info |

### Typography

| Style | Size | Weight | Usage |
|-------|------|--------|-------|
| `displayXL` | 64 | W900 | Hero text |
| `displayL` | 48 | W900 | Large headings |
| `displayM` | 36 | W800 | Section headings |
| `headingL` | 24 | W700 | Card titles |
| `headingM` | 18 | W700 | Panel headers |
| `headingS` | 14 | W700 | Button / label text |
| `bodyL` | 16 | W400 | Reading text |
| `bodyM` | 14 | W400 | Default body |
| `bodyS` | 12 | W400 | Captions |
| `label` | 11 / 1.5sp | W700 | Uppercase labels |
| `mono` | 13 | W500 | Code / numbers |

## Additional information

- **Source**: [github.com/maheshbvv/prism_ui_kit](https://github.com/maheshbvv/prism_ui_kit)
- **Issues**: [github.com/maheshbvv/prism_ui_kit/issues](https://github.com/maheshbvv/prism_ui_kit/issues)
- **License**: MIT
