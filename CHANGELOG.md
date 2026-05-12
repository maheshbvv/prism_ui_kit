## 0.3.0

- **Removed custom SVG icon set** (dropped flutter_svg dependency, deleted 286 SVG assets)
- **Replaced PrismIcon** to use Flutter's built-in `Icon` widget (accepts `IconData` instead of `String`)
- **Replaced PrismIcons** — all 286 constants now map to Flutter Material `Icons.*` (backward-compatible API)
- **Removed PrismBrandIcon** — unused widget (relied on flutter_svg)
- **Breaking**: `PrismIcon.icon` type changed from `String` to `IconData`
- **Breaking**: `PrismIcons.*` constants type changed from `String` to `IconData`
- **Breaking**: `PrismEmptyState.icon`, `PrismTappableIcon.icon`, `PrismChip.icon`, `PrismNavBarItem.icon`, `PrismNavigationRailDestination.icon`, `PrismBottomSheetAction.icon` types changed from `String` to `IconData`

## 0.2.0

- Added **200+ SVG icons** across 18 categories (actions, arrows, brands, commerce, communication, media, status, tech, weather, UI, and more)
- Added `PrismIcon` — unified icon widget with size, color, and semantic label
- Added `PrismBrandIcon` — brand icon display with brand colors
- Added `PrismIcons` — static icon reference class with all icon constants
- Added `PrismAccordion` — expandable accordion with multiple expansion support
- Added `PrismBreadcrumbs` — breadcrumb navigation with overflow
- Added `PrismStepper` — multi-step progress indicator
- Added `PrismSearchField` — search input with clear button
- Added `PrismPicker` — bottom-sheet picker with item selection
- Added `PrismToggleTile`, `PrismSingleChoiceTile`, `PrismMultiChoiceTile` — tile-based selection widgets
- Added `PrismTappableIcon` — tappable icon with ripple feedback
- Added `PrismCopyButton` — one-click copy-to-clipboard button
- Added `PrismRating` — star rating with half-star support
- Added `PrismOtpInput` — OTP/pin code input field
- Added `PrismCardBox` — elevated card variant
- Added `PrismTile`, `PrismVerticalTile` — content tile variants
- Added `PrismDashedBorder` — dashed border decoration
- Added `PrismSkeleton` — content loading placeholder
- Added `PrismAvatarGroup` — stacked avatar display with overflow count
- Added `PrismAdaptivePageTransition` — platform-aware page transitions
- Added `PrismSegmentBar` — segmented control
- Added `PrismTabs` — tab bar with underline indicator
- Added `PrismNavigationRail` — side navigation rail
- Added `PrismTooltip` — tooltip with arrow
- Added `PrismPopup`, `PrismAlertPopup`, `PrismConfirmationPopup` — popup/alert/confirmation modals
- Added `PrismEmptyState` — empty state placeholder
- Added `PrismInfoBanner` — contextual info banner
- Refactored monolithic `prism_ui_kit.dart` into individual `lib/src/*.dart` barrel exports
- Updated example app to use `PrismIcons` instead of Material icons
- Renamed `docs/` to `doc/` for pub layout convention

## 0.1.0

- Added comprehensive dartdoc documentation for all public API elements
- Created example app at `example/` showcasing every component
- Replaced deprecated `withOpacity` calls with `withValues(alpha:)`
- Added `PrismSpacing.px10` constant
- Fixed all analyzer warnings
- Added 11 widget tests

## 0.0.1

Initial release of Prism UI Kit.

### Components
- **PrismTheme** — Dark/light theme with design tokens (colors, typography, spacing)
- **PrismButton** — 4 variants (primary, ghost, danger, flat) with loading state, icons, 3 sizes
- **PrismInput** — Text field with animated border, error/helper text, icons
- **PrismCard** — Content card with accent left border and optional header label
- **PrismBadge** — 6 variants (success, error, warning, info, neutral, accent) with optional dot
- **PrismTag** — Inline tag with optional remove action
- **PrismChip** — Selectable filter chip with icon and animated selection
- **PrismToggle** — Toggle switch with label and description
- **PrismCheckbox** — Checkbox with checked, unchecked, and indeterminate states
- **PrismRadio** — Radio group with card-style option cards
- **PrismSlider** — Slider with square thumb, segmented mode, and accent color
- **PrismDivider** — Horizontal/vertical divider with optional label
- **PrismDialog** — Modal dialog with accent header, body, and action buttons
- **PrismToast** — Overlay notification with slide/fade animation and 4 variants
- **PrismBottomSheet** — Bottom action sheet with title and tappable actions
- **PrismNavBar** — Bottom navigation with animated icon highlight
- **PrismAppBar** — Top app bar with accent line, subtitle, and action slots
- **PrismAvatar** — Avatar with image/initials and presence indicator
- **PrismProgress** — Linear (solid/segmented) and circular progress indicators
- **PrismListTile** — List tile with leading, trailing, accent left, dense mode
