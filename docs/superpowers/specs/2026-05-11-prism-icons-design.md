# Prism Icon Set Design

## Overview

A custom icon set for the Prism UI Kit — a neo-brutalist Flutter design system. The icon set replaces all Material Icons currently used internally and provides a comprehensive icon library for consumers.

## Design Philosophy

- **Style**: Bauhaus-inspired minimal line icons
- **Stroke**: 1.5px uniform, sharp corners (butt cap, miter join)
- **Grid**: 24x24 viewBox
- **Fill**: none (stroked) for UI icons; filled single-color for brand icons
- **Color**: Inherit via currentColor, tinted by PrismIcon widget
- **No Material dependency**: Flutter SVG rendering via flutter_svg

## Phase 1 Scope: ~310 icons

### Categories

#### Core UI (170 icons)

**Arrows (20)**: arrowDown, arrowLeft, arrowRight, arrowUp, chevronDown, chevronLeft, chevronRight, chevronUp, cornerDownLeft, cornerDownRight, cornerUpLeft, cornerUpRight, externalLink, refresh, maximize, minimize, move, shuffle, repeat, collapse

**Actions (30)**: check, close, copy, download, upload, edit, filter, plus, minus, search, share, trash, moreHorizontal, moreVertical, link, linkOff, redo, undo, reply, forward, crop, slash, select, crosshair, thumbsUp, thumbsDown, ban, pin, pinOff, power

**Communication (18)**: mail, mailOpen, mailReply, mailForward, send, message, messageCircle, phone, phoneCall, phoneIncoming, phoneOutgoing, phoneOff, bell, bellOff, archive, inbox, outbox, paperPlane

**Media (18)**: play, pause, stop, record, skipBack, skipForward, volume, volume1, volume2, volumeX, music, camera, video, image, folder, headphones, mic, micOff, cast

**Status (22)**: info, alertCircle, alertTriangle, checkCircle, helpCircle, ban, shield, shieldCheck, shieldAlert, shieldOff, lock, unlock, eye, eyeOff, wifi, wifiOff, bluetooth, battery, batteryCharging, batteryDead, signal, signalOff

**UI Essentials (24)**: home, menu, grid, list, settings, bookmark, heart, star, halfStar, clock, calendar, user, users, userPlus, userMinus, userCheck, userX, logIn, logOut, hash, search, globe, compass, flag

**Commerce (16)**: cart, shoppingBag, creditCard, wallet, dollarSign, tag, barChart, pieChart, trendingUp, trendingDown, receipt, coupon, percent, gift, package, truck

**Documents (14)**: file, fileText, fileImage, folderOpen, clipboard, clipboardCheck, clipboardList, paperclip, attachment, printer, save, scan, stickyNote, notepad

**Weather (10)**: sun, moon, cloud, sunRise, sunSet, thermometer, droplet, snowflake, wind, umbrella

**Tech (14)**: monitor, tablet, smartphone, cpu, database, server, code, terminal, gitBranch, gitCommit, gitPR, command, disc, layers

**Editing (12)**: penTool, pencil, paintBucket, colorWheel, ruler, eyeDropper, flipH, flipV, minusCircle, plusCircle, cursor, crop

**Transport (10)**: car, truck, plane, ship, bike, train, bus, navigation, fuel, parking

**Business (12)**: building, store, briefcase, map, mapPin, globe, flag, trophy, certificate, badge, barChart, users

**Shapes (10)**: circle, square, triangle, hexagon, diamond, dot, toggleLeft, toggleRight, radio, minusSquare

**Accessibility (6)**: wheelchair, signLanguage, ear, assistiveListening, accessible, blind

#### Brand & Tech (80 icons)

apple, google, microsoft, facebook, messenger, instagram, whatsapp, twitter, x, linkedin, youtube, github, gitlab, bitbucket, figma, slack, discord, zoom, notion, jira, confluence, trello, vsCode, android, chrome, firefox, safari, edge, docker, kubernetes, aws, gcp, azure, nginx, netlify, vercel, heroku, stripe, paypal, shopify, wordpress, tailwind, bootstrap, sass, npm, yarn, pnpm, babel, webpack, vite, eslint, prettier, jest, cypress, python, html5, css3, javascript, typescript, react, nextjs, svelte, vue, angular, nuxt, nodejs, deno, flutter, dart, swift, kotlin, java, goLang, rust, c, cpp, csharp, php, ruby, lua, elixir, haskell

#### Academic (40 icons)

graduationCap, book, bookOpen, bookClosed, bookMarked, library, bookshelf, certificate, award, medal, trophy, pencil, pen, ruler, triangleRuler, compass, protractor, flask, beaker, testTube, atom, dna, microscope, telescope, globe, map, equation, formula, sigma, pi, calculator, abacus, notebook, paper, scroll, exam, assignment, lecture, school, university

## File Organization

```
assets/icons/
  arrows/        (20 SVGs)
  actions/       (30 SVGs)
  communication/ (18 SVGs)
  media/         (18 SVGs)
  status/        (22 SVGs)
  ui/            (24 SVGs)
  commerce/      (16 SVGs)
  documents/     (14 SVGs)
  weather/       (10 SVGs)
  tech/          (14 SVGs)
  editing/       (12 SVGs)
  transport/     (10 SVGs)
  business/      (12 SVGs)
  shapes/        (10 SVGs)
  accessibility/ (6 SVGs)
  brands/        (80 SVGs)
  academic/      (40 SVGs)
```

## API Surface

### PrismIcons (static constants)

```dart
class PrismIcons {
  PrismIcons._();
  static const String arrowDown = 'assets/icons/arrows/arrow-down.svg';
  // ... all ~310 constants
}
```

### PrismIcon (widget)

```dart
class PrismIcon extends StatelessWidget {
  const PrismIcon(
    this.icon, {
    super.key,
    this.size = 24,
    this.color,
    this.semanticLabel,
  });
}
```

### PrismBrandIcon (preserves brand colors)

```dart
class PrismBrandIcon extends StatelessWidget {
  const PrismBrandIcon(
    this.icon, {
    super.key,
    this.size = 24,
    this.color,
  });
}
```

## Internal Migration

Replace all Material Icons in existing components:

- `PrismSearchField`: `Icons.search` → `PrismIcons.search`
- `PrismAccordion`: `Icons.keyboard_arrow_down` → `PrismIcons.chevronDown`
- `PrismPicker`: `Icons.close`, `Icons.check` → `PrismIcons.*`
- `PrismCheckbox`: `Icons.check` → `PrismIcons.check`
- `PrismStepper`: `Icons.check` → `PrismIcons.check`
- `PrismCopyButton`: `Icons.copy`, `Icons.check` → `PrismIcons.*`
- `PrismInfoBanner`: Material status icons → `PrismIcons.*`
- `PrismToast`: Material status icons → `PrismIcons.*`
- `PrismRating`: `Icons.star`, `Icons.star_border` → `PrismIcons.star`, `PrismIcons.star` + opacity

## Dependencies

```yaml
dependencies:
  flutter_svg: ^2.0.0
```

## Implementation Plan

1. Add `flutter_svg` dependency to pubspec.yaml
2. Create `assets/icons/` directory with category subdirectories
3. Generate SVG files (all ~310 icons)
4. Create `lib/src/prism_icon.dart` (PrismIcon widget)
5. Create `lib/src/prism_icons.dart` (PrismIcons constants)
6. Update `lib/prism_ui_kit.dart` to export new files
7. Migrate all existing components to use PrismIcons
8. Update `pubspec.yaml` assets section
