# Prism UI Kit — Component Expansion Design

## Objective
Expand the Prism UI Kit from ~20 to ~40+ components with proper file organization, maintaining the neo-brutalist design language (no shadows, no blur, bold borders, amber accents, uppercase labels, square corners).

## Architecture
- Split the monolith `lib/prism_ui_kit.dart` into `lib/src/<component>.dart` (one file per component)
- Barrel export from `lib/prism_ui_kit.dart`
- All components use existing design tokens: `PrismColors`, `PrismTypography`, `PrismSpacing`
- Consistency: every component uses 1.5px borders, `PrismColors.border`/`PrismColors.amber` accents, uppercase labels, square corners, press-scale animations

## Components to Build

### Group 1: Feedback & Overlays
| Component | File | Description |
|-----------|------|-------------|
| Spinner | `prism_spinner.dart` | Make public standalone (currently private) |
| EmptyState | `prism_empty_state.dart` | Icon + message + optional action button |
| InfoBanner | `prism_info_banner.dart` | Dismissible banner with variant colors |
| AlertPopup | `prism_alert_popup.dart` | Single-button modal alert |
| ConfirmationPopup | `prism_confirmation_popup.dart` | Two-button confirmation modal |
| Popup | `prism_popup.dart` | Generic positioned popup overlay |
| Tooltip | `prism_tooltip.dart` | Hover/long-press tooltip |

### Group 2: Navigation & Structure
| Component | File | Description |
|-----------|------|-------------|
| NavigationRail | `prism_navigation_rail.dart` | Vertical nav rail with labels |
| Tabs | `prism_tabs.dart` | Horizontal tab bar with indicator |
| SegmentBar | `prism_segment_bar.dart` | Segmented control (button group) |
| AdaptivePageTransition | `prism_adaptive_page_transition.dart` | Page route transition builder |
| Breadcrumbs | `prism_breadcrumbs.dart` | Breadcrumb navigation trail |
| Stepper | `prism_stepper.dart` | Step progress indicator |

### Group 3: Inputs & Selection
| Component | File | Description |
|-----------|------|-------------|
| SearchField | `prism_search_field.dart` | Text field with search icon + clear |
| Picker | `prism_picker.dart` | Item picker (dropdown-like modal) |
| ToggleTile | `prism_toggle_tile.dart` | List tile with trailing toggle |
| SingleChoiceTile | `prism_single_choice_tile.dart` | List tile with radio |
| MultiChoiceTile | `prism_multi_choice_tile.dart` | List tile with checkbox |
| TappableIcon | `prism_tappable_icon.dart` | Icon button with press animation |
| CopyButton | `prism_copy_button.dart` | Button that copies text to clipboard |
| Rating | `prism_rating.dart` | Star rating input/display |
| OTPInput | `prism_otp_input.dart` | One-time password code input |

### Group 4: Content Display
| Component | File | Description |
|-----------|------|-------------|
| CardBox | `prism_card_box.dart` | Plain bordered container (no accent) |
| Tile | `prism_tile.dart` | Generic content tile |
| VerticalTile | `prism_vertical_tile.dart` | Vertical card-like tile |
| DashedBorder | `prism_dashed_border.dart` | Custom painter for dashed borders |
| Skeleton | `prism_skeleton.dart` | Loading placeholder shimmer |
| AvatarGroup | `prism_avatar_group.dart` | Stacked overlapping avatars |
| Accordion | `prism_accordion.dart` | Expandable/collapsible panel |

## Implementation Order
1. Create `lib/src/` directory structure
2. Extract existing tokens + helpers to separate files
3. Build Group 1 (Feedback) — most commonly needed
4. Build Group 2 (Navigation)
5. Build Group 3 (Inputs)
6. Build Group 4 (Display)
7. Create barrel export
8. Update example app
9. Write tests
10. Verify build passes
