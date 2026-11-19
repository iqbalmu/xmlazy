# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.1.0] - 2026-11-19

First release of **xmlazy** — an opinionated [LazyVim](https://www.lazyvim.org/)
configuration for Flutter/Dart, PHP/Laravel, Go, TypeScript, and Markdown workflows.

### Added

- LazyVim base configuration with `lazy.nvim` bootstrap and curated extras (`lazyvim.json`).
- Adaptive theming: `onedarkpro.nvim` follows the system dark/light preference live via
  `gsettings monitor`; the custom `caelestia` colorscheme auto-activates when
  `~/.local/state/caelestia/scheme.json` is present.
- Unified `snacks.nvim` workflow: two-pane **XMUU** dashboard (`<leader>;`),
  telescope-preset picker, sidebar explorer (dotfiles visible, gitignored dirs hidden),
  and terminal (`<C-\>`, `<leader>tf`, `<leader>th`, `<leader>tv`).
- Flutter/Dart stack: `flutter-tools.nvim` (FVM, widget guides, dev log), `dart_format`,
  2-space indentation, `<leader>F*` bindings lazy-loaded on `dart` files.
- PHP/Laravel stack: `phpactor` LSP with Pint formatting via `conform.nvim`.
- Markdown workflow: `render-markdown.nvim` with preview; `spell` and `markdownlint-cli2`
  disabled for distraction-free prose.
- `neocord.nvim` Discord Rich Presence (disabled by default).
- Labeled `which-key` groups for `<leader>F` (Flutter), `<leader>r` (Rename),
  `<leader>t` (Terminal).
- Fish shell as the default `shell` option; horizontal scroll ergonomics
  (`<A-h>` / `<A-l>`, `20zh` / `20zl`).

### Changed

- Window navigation moved to `<C-S-Arrow>`; line/selection move and duplicate via
  `<A-(S-)Up/Down>`; buffer switching on `<Tab>` / `<S-Tab>`; save with `<C-s>`.

### Removed

- AI assistant plugins dropped: `opencode.nvim` and `avante.nvim`.
- `netrw` disabled in favor of `snacks.explorer`.

### Fixed

- `snacks.nvim` indent scope and stale move-keymap bindings.
