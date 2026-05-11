# Prism Component Expansion Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Expand Prism UI Kit from ~20 to ~40+ components with proper `lib/src/` file organization.

**Architecture:** Extract the existing monolith into `lib/src/<component>.dart` files, build 25+ new components, barrel export from `lib/prism_ui_kit.dart`. All components use existing design tokens (PrismColors, PrismTypography, PrismSpacing) and follow neo-brutalist conventions (1.5px borders, amber accents, uppercase labels, no shadows, press-scale animations).

**Tech Stack:** Flutter, Dart 3.x, no external dependencies.

---

### Task 1: Create file structure & extract existing code

**Files:**
- Create: `lib/src/` directory
- Create: `lib/src/prism_colors.dart`
- Create: `lib/src/prism_typography.dart`
- Create: `lib/src/prism_spacing.dart`
- Create: `lib/src/prism_theme.dart`
- Create: `lib/src/prism_variant.dart`
- Create: `lib/src/prism_size.dart`
- Create: `lib/src/prism_badge_variant.dart`
- Create: `lib/src/prism_toast_variant.dart`
- Create: `lib/src/prism_presence.dart`
- Create: `lib/src/prism_spinner.dart`
- Create: `lib/src/prism_button.dart`
- Create: `lib/src/prism_input.dart`
- Create: `lib/src/prism_card.dart`
- Create: `lib/src/prism_badge.dart`
- Create: `lib/src/prism_tag.dart`
- Create: `lib/src/prism_chip.dart`
- Create: `lib/src/prism_toggle.dart`
- Create: `lib/src/prism_checkbox.dart`
- Create: `lib/src/prism_radio.dart`
- Create: `lib/src/prism_slider.dart`
- Create: `lib/src/prism_divider.dart`
- Create: `lib/src/prism_dialog.dart`
- Create: `lib/src/prism_toast.dart`
- Create: `lib/src/prism_bottom_sheet.dart`
- Create: `lib/src/prism_nav_bar.dart`
- Create: `lib/src/prism_app_bar.dart`
- Create: `lib/src/prism_avatar.dart`
- Create: `lib/src/prism_progress.dart`
- Create: `lib/src/prism_list_tile.dart`

- [ ] **Step 1.1: Create `lib/src/` directory**

- [ ] **Step 1.2: Extract all enum/variant files from monolith**
  - `prism_variant.dart` = PrismVariant enum (primary, ghost, danger, flat)
  - `prism_size.dart` = PrismSize enum (sm, md, lg)
  - `prism_badge_variant.dart` = PrismBadgeVariant enum
  - `prism_toast_variant.dart` = PrismToastVariant enum
  - `prism_presence.dart` = PrismPresence enum

- [ ] **Step 1.3: Extract design token files**
  - `prism_colors.dart` = PrismColors class
  - `prism_typography.dart` = PrismTypography class
  - `prism_spacing.dart` = PrismSpacing class
  - `prism_theme.dart` = PrismTheme class

- [ ] **Step 1.4: Extract spinner (make public PrismSpinner)**
  - Move `_PrismSpinner` and `_SpinnerPainter` → `prism_spinner.dart`
  - Rename to `PrismSpinner` (public)
  - Rename `_SpinnerPainter` → `_PrismSpinnerPainter`

- [ ] **Step 1.5: Extract remaining components** — each to its own file
  - `prism_button.dart` — PrismButton + _PrismButtonState
  - `prism_input.dart` — PrismInput + _PrismInputState
  - `prism_card.dart` — PrismCard
  - `prism_badge.dart` — PrismBadge
  - `prism_tag.dart` — PrismTag
  - `prism_chip.dart` — PrismChip
  - `prism_toggle.dart` — PrismToggle
  - `prism_checkbox.dart` — PrismCheckbox
  - `prism_radio.dart` — PrismRadioOption + PrismRadioGroup + _SquareThumbShape (wait, _SquareThumbShape belongs to PrismSlider; move it correctly)
  - `prism_slider.dart` — PrismSlider + _SquareThumbShape
  - `prism_divider.dart` — PrismDivider
  - `prism_dialog.dart` — PrismDialog
  - `prism_toast.dart` — PrismToast + _PrismToastWidget
  - `prism_bottom_sheet.dart` — PrismBottomSheet + PrismBottomSheetAction
  - `prism_nav_bar.dart` — PrismNavBarItem + PrismNavBar
  - `prism_app_bar.dart` — PrismAppBar
  - `prism_avatar.dart` — PrismAvatar
  - `prism_progress.dart` — PrismLinearProgress + PrismCircularProgress + _CircularProgressPainter
  - `prism_list_tile.dart` — PrismListTile

- [ ] **Step 1.6: Write barrel export `lib/prism_ui_kit.dart`**
  Export all `src/*.dart` files.

- [ ] **Step 1.7: Verify extraction works**
  Run: `cd /Users/mahesh/FlutterDev/prism_ui_kit && dart analyze lib/`

---

### Task 2: Feedback & Overlay Components

**Files:**
- Create: `lib/src/prism_empty_state.dart`
- Create: `lib/src/prism_info_banner.dart`
- Create: `lib/src/prism_alert_popup.dart`
- Create: `lib/src/prism_confirmation_popup.dart`
- Create: `lib/src/prism_popup.dart`
- Create: `lib/src/prism_tooltip.dart`

**PrismEmptyState** — centered icon + title + message + optional action button
```
const PrismEmptyState({
  required this.icon,
  required this.title,
  this.message,
  this.actionLabel,
  this.onAction,
})
```

**PrismInfoBanner** — dismissible horizontal banner with left accent + icon + message + optional action
```
const PrismInfoBanner({
  required this.message,
  this.variant = PrismToastVariant.info,
  this.actionLabel,
  this.onAction,
  this.dismissible = true,
})
```

**PrismAlertPopup** — single-button modal (uses showGeneralDialog)
```
static Future<void> show(BuildContext context, {required String title, required String message, String buttonLabel = 'OK', bool isDestructive = false})
```

**PrismConfirmationPopup** — two-button modal
```
static Future<bool?> show(BuildContext context, {required String title, required String message, String confirmLabel = 'Confirm', String cancelLabel = 'Cancel', bool isDestructive = false})
```

**PrismPopup** — generic positioned popup overlay
```
const PrismPopup({
  required this.child,
  required this.popup,
  this.showPopup = false,
  this.position = PopupPosition.bottom,
})
enum PopupPosition { bottom, top, left, right }
```

**PrismTooltip** — hover/long-press tooltip
```
const PrismTooltip({
  required this.message,
  required this.child,
  this.duration = const Duration(seconds: 2),
})
```

- [ ] **Step 2.1: Implement all 6 feedback component files**

- [ ] **Step 2.2: Add exports to barrel and verify**

---

### Task 3: Navigation Components

**Files:**
- Create: `lib/src/prism_navigation_rail.dart`
- Create: `lib/src/prism_tabs.dart`
- Create: `lib/src/prism_segment_bar.dart`
- Create: `lib/src/prism_adaptive_page_transition.dart`
- Create: `lib/src/prism_breadcrumbs.dart`
- Create: `lib/src/prism_stepper.dart`

**PrismNavigationRail** — vertical rail with icon + label items, optional labels
```
const PrismNavigationRail({
  required this.destinations,
  required this.selectedIndex,
  required this.onDestinationSelected,
  this.labelType = NavigationRailLabelType.all,
})
```

**PrismTabs** — horizontal tab bar with animated underline indicator
```
const PrismTabs({
  required this.tabs,
  required this.selectedIndex,
  required this.onTap,
})
```

**PrismSegmentBar** — segmented control (button group)
```
const PrismSegmentBar({
  required this.segments,
  required this.selectedIndex,
  required this.onTap,
})
```

**PrismAdaptivePageTransition** — custom page route transition
```
static Route create({required Widget page, Duration duration = const Duration(milliseconds: 250)})
```

**PrismBreadcrumbs** — breadcrumb navigation with separators
```
const PrismBreadcrumbs({
  required this.items,
  this.separator = '/',
})
```

**PrismStepper** — step progress indicator
```
const PrismStepper({
  required this.steps,
  required this.currentStep,
})
```

- [ ] **Step 3.1: Implement all 6 navigation component files**

- [ ] **Step 3.2: Add exports to barrel and verify**

---

### Task 4: Input & Selection Components

**Files:**
- Create: `lib/src/prism_search_field.dart`
- Create: `lib/src/prism_picker.dart`
- Create: `lib/src/prism_toggle_tile.dart`
- Create: `lib/src/prism_single_choice_tile.dart`
- Create: `lib/src/prism_multi_choice_tile.dart`
- Create: `lib/src/prism_tappable_icon.dart`
- Create: `lib/src/prism_copy_button.dart`
- Create: `lib/src/prism_rating.dart`
- Create: `lib/src/prism_otp_input.dart`

**PrismSearchField** — text field with search icon + clear button
```
const PrismSearchField({
  this.controller,
  this.onChanged,
  this.onSubmitted,
  this.hint = 'Search...',
  this.autofocus = false,
})
```

**PrismPicker** — opens bottom sheet with selectable items
```
static Future<T?> show<T>(BuildContext context, {required String title, required List<PrismPickerItem<T>> items, T? value})
class PrismPickerItem<T> { final T value; final String label; final String? description; }
```

**PrismToggleTile** — list tile with trailing toggle switch
```
const PrismToggleTile({
  required this.title,
  required this.value,
  required this.onChanged,
  this.subtitle,
  this.leading,
})
```

**PrismSingleChoiceTile** — list tile with radio indicator
```
const PrismSingleChoiceTile({
  required this.title,
  required this.selected,
  required this.onTap,
  this.subtitle,
  this.leading,
})
```

**PrismMultiChoiceTile** — list tile with checkbox
```
const PrismMultiChoiceTile({
  required this.title,
  required this.checked,
  required this.onChanged,
  this.subtitle,
  this.leading,
})
```

**PrismTappableIcon** — icon button with press-scale animation
```
const PrismTappableIcon({
  required this.icon,
  required this.onPressed,
  this.size = 20,
  this.color,
  this.tooltip,
})
```

**PrismCopyButton** — copies text to clipboard, shows check briefly
```
const PrismCopyButton({
  required this.text,
  this.label = 'Copy',
  this.copiedLabel = 'Copied',
})
```

**PrismRating** — star rating with interactive/read-only modes
```
const PrismRating({
  required this.rating,
  required this.onChanged,
  this.maxRating = 5,
  this.size = 24,
})
```

**PrismOTPInput** — N-digit code input with individual cells
```
const PrismOTPInput({
  required this.length,
  required this.onCompleted,
  this.onChanged,
})
```

- [ ] **Step 4.1: Implement all 9 input component files**

- [ ] **Step 4.2: Add exports to barrel and verify**

---

### Task 5: Content Display Components

**Files:**
- Create: `lib/src/prism_card_box.dart`
- Create: `lib/src/prism_tile.dart`
- Create: `lib/src/prism_vertical_tile.dart`
- Create: `lib/src/prism_dashed_border.dart`
- Create: `lib/src/prism_skeleton.dart`
- Create: `lib/src/prism_avatar_group.dart`
- Create: `lib/src/prism_accordion.dart`

**PrismCardBox** — plain bordered container without accent (simpler than PrismCard)
```
const PrismCardBox({
  required this.child,
  this.padding,
  this.onTap,
  this.color,
})
```

**PrismTile** — generic content tile with title/subtitle
```
const PrismTile({
  required this.title,
  this.subtitle,
  this.trailing,
  this.onTap,
})
```

**PrismVerticalTile** — vertical card with image placeholder + title + subtitle
```
const PrismVerticalTile({
  required this.title,
  this.subtitle,
  this.imageUrl,
  this.onTap,
})
```

**PrismDashedBorder** — CustomPainter for dashed borders
```
const PrismDashedBorder({
  required this.child,
  this.color = PrismColors.border,
  this.strokeWidth = 1.5,
  this.dashLength = 6,
  this.gapLength = 4,
})
```

**PrismSkeleton** — shimmer loading placeholder
```
const PrismSkeleton({
  this.width,
  this.height,
  this.borderRadius = 0,
})
class PrismSkeletonGroup extends StatelessWidget { ... }
```

**PrismAvatarGroup** — overlapping stacked avatars
```
const PrismAvatarGroup({
  required this.urls,
  this.initials,
  this.size = 32,
  this.max = 4,
  this.gap = 0.7,
})
```

**PrismAccordion** — expandable/collapsible panel
```
const PrismAccordion({
  required this.title,
  required this.child,
  this.initiallyExpanded = false,
})
```

- [ ] **Step 5.1: Implement all 7 display component files**

- [ ] **Step 5.2: Add exports to barrel and verify**

---

### Task 6: Update Example App

**Files:**
- Modify: `example/lib/main.dart`

- [ ] **Step 6.1: Add demo sections for all new components in the example app**

---

### Task 7: Write Tests

**Files:**
- Create/modify: `test/prism_ui_kit_test.dart`

- [ ] **Step 7.1: Add widget tests for all new components** — basic render + tap behavior tests

---

### Task 8: Final Verification

- [ ] **Step 8.1: Run analyzer**
  Run: `cd /Users/mahesh/FlutterDev/prism_ui_kit && dart analyze lib/`

- [ ] **Step 8.2: Run tests**
  Run: `cd /Users/mahesh/FlutterDev/prism_ui_kit && flutter test`

- [ ] **Step 8.3: Fix any issues**
