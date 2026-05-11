# Prism UI Kit Showcase Site

**URL**: `prism.pendura.in`
**Goal**: A shadcn/ui-style component showcase for the Prism UI Kit Flutter package.

## Tech Stack

- **Framework**: Flutter Web
- **Routing**: GoRouter with URL paths
- **Theme**: Prism UI Kit (dark mode) — dogfooding the package
- **Output**: Static web build (`flutter build web`) deployed to any static host

## Project

Separate private GitHub repo (`prism-ui-site`). Deployment handled by the user via DNS/hosting of their choice.

## Site Structure

### Navigation (left sidebar)

```
GETTING STARTED
  Installation
  Theming
COMPONENTS
  Button
  Input
  Card
  Badge
  Tag
  Chip
  Toggle
  Checkbox
  Radio
  Slider
  Divider
  Dialog
  Toast
  Bottom Sheet
  Nav Bar
  App Bar
  Avatar
  Progress Linear
  Progress Circular
  List Tile
```

### URL Routes

| Route | Page |
|-------|------|
| `/` or `/installation` | Installation guide |
| `/theming` | Theme + design tokens reference |
| `/components/button` | Button showcase |
| `/components/input` | Input showcase |
| ... | ... one per component |

## Page Layout

Each component page follows a consistent three-section template:

### 1. Preview
Live component rendered inside a bordered container. Shows multiple variants (e.g. Button shows primary, ghost, danger, flat, loading, disabled).

### 2. Code
Dark monospace block showing the primary usage snippet. Copy button in the top-right corner. No external syntax highlighting library — plain colored spans via manual formatting.

### 3. Props
Table with columns: Prop name (amber) | Type (blue) | Description (grey). Manually defined per component as structured data.

## App Shell Architecture

```
MaterialApp.router
  └─ Scaffold
       ├── Sidebar (fixed left, scrollable)
       │    ├── Logo / Brand header
       │    ├── "Getting Started" section
       │    └── "Components" section with all 20 items
       └── Content area (scrollable)
            └── ComponentPage (renders from data)
```

## Data Design

To keep the code DRY, each component is defined by a data class:

```dart
class ComponentDefinition {
  final String name;
  final String description;
  final String route;
  final List<PropDef> props;
  final String codeSnippet;
  final Widget Function() previewBuilder;
}
```

A single `ComponentPage` widget renders any component from its `ComponentDefinition`.

## Implementation Plan

1. Scaffold new Flutter web project
2. Add dependencies (prism_ui_kit, go_router)
3. Build app shell: sidebar + content layout
4. Build shared widgets (CodeBlock, PropsTable)
5. Create Getting Started page
6. Create Theming page (design tokens reference)
7. Create all 20 component pages
8. Wire up GoRouter
9. Build and test
10. Deploy to hosting

## Success Criteria

- All 20 components displayed with live preview
- Code snippet with copy button for each component
- Props table for each component
- Responsive sidebar navigation
- Deployed at prism.pendura.in
