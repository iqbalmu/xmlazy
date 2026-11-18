# ⚡ xmlazy

A clean, fast, and opinionated **Neovim** configuration built on top of [LazyVim](https://github.com/LazyVim/LazyVim), tailored for **Flutter/Dart**, **PHP/Laravel**, **Go**, **TypeScript**, and **Markdown** workflows.

<p align="left">
  <img src="https://img.shields.io/badge/Neovim-0.12+-57A143?style=flat-square&logo=neovim&logoColor=white" alt="Neovim 0.12+" />
  <img src="https://img.shields.io/badge/LazyVim-Powered-blue?style=flat-square&logo=lua&logoColor=white" alt="LazyVim" />
  <img src="https://img.shields.io/badge/Shell-fish-4AAE47?style=flat-square" alt="Fish Shell" />
  <img src="https://img.shields.io/github/license/iqbalmu/xmlazy?style=flat-square" alt="License" />
</p>

---

## ✨ Highlights

- **Adaptive Theming**
  - Follows system dark/light preference live via `gsettings monitor` (`onedarkpro.nvim`: `vaporwave` for dark, `onelight` for light) with transparency enabled.
  - Automatically yields to [`caelestia`](colors/caelestia.lua) when `~/.local/state/caelestia/scheme.json` is present.
- **Unified `snacks.nvim` Workflow**
  - Custom two-pane **XMUU** dashboard (`<leader>;`) with system info, quick actions, recent files, and projects.
  - **Telescope-preset picker** & **sidebar explorer** (dotfiles visible, gitignored directories hidden).
  - Built-in **Snacks Terminal** (`<C-\>`, `<leader>tf`, `<leader>th`, `<leader>tv`).
- **Focused Language Stacks**
  - **Flutter / Dart**: `flutter-tools.nvim` (FVM, widget guides, dev log), `dart_format`, 2-space indentation, and `<leader>F*` bindings lazy-loaded on `dart` files.
  - **PHP / Laravel**: `phpactor` LSP + `pint` formatting via `conform.nvim`.
  - **Go, TypeScript, Tailwind CSS, Prisma, Docker, Git, JSON, YAML, TOML**.
  - **Markdown**: `render-markdown.nvim` & preview active, with `spell` and `markdownlint-cli2` disabled to keep prose distraction-free.
- **Clean `which-key` Groups & Ergonomics**
  - Organized `<leader>F` (Flutter), `<leader>r` (Rename), and `<leader>t` (Terminal) groups.
  - `netrwPlugin` disabled in favor of `snacks.explorer`.

---

## ⌨️ Keymaps

### General & Navigation

| Mode | Key | Action |
| :--- | :--- | :--- |
| `n` | `<Tab>` / `<S-Tab>` | Next / previous buffer |
| `n`, `t` | `<C-S-Arrow>` | Navigate windows (`h/j/k/l`) |
| `n` | `<A-h>` / `<A-l>` / `<A-Left/Right>` | Fast horizontal scroll (`20zh` / `20zl`) |
| `n`, `i`, `v`, `x` | `<C-s>` | Save file |
| `n`, `i`, `x` | `<A-Up>` / `<A-Down>` | Move line / selection up or down |
| `n`, `i`, `v`, `x` | `<A-S-Up>` / `<A-S-Down>` | Duplicate line / selection up or down |
| `n` | `<leader>rr` | Search & replace word under cursor in buffer |
| `v` | `<leader>re` | Search & replace selected text in buffer |
| `n` | `<leader>;` | Open Dashboard |

### Terminal (`Snacks.terminal`)

| Mode | Key | Action |
| :--- | :--- | :--- |
| `n`, `t` | `<C-\>` | Toggle vertical terminal (25% width) |
| `n` | `<leader>tf` | Open floating terminal |
| `n` | `<leader>th` | Open horizontal terminal (height 15) |
| `n` | `<leader>tv` | Open vertical terminal (25% width) |

### Flutter (`ft = "dart"`)

| Key | Action | Key | Action |
| :--- | :--- | :--- | :--- |
| `<leader>Fr` | Flutter Run | `<leader>FR` | Flutter Restart |
| `<leader>Fh` | Hot Reload | `<leader>FH` | Hot Restart |
| `<leader>Fd` | Flutter Devices | `<leader>Fe` | Flutter Emulators |
| `<leader>Fo` | Flutter Outline | `<leader>Fv` | Visual Debug |
| `<leader>Ft` | Flutter Test | `<leader>Fq` | Flutter Quit |

---

## 📁 Structure

```text
~/.config/nvim
├── init.lua
├── lazyvim.json                 # Enabled LazyVim extras
├── stylua.toml                  # Lua formatting rules
├── colors/
│   └── caelestia.lua            # Caelestia colorscheme
└── lua/
    ├── config/
    │   ├── autocmds.lua         # Markdown no-spell & Dart 2-space indent
    │   ├── keymaps.lua          # Custom keymaps
    │   ├── lazy.lua             # lazy.nvim bootstrap & rtp settings
    │   └── options.lua          # Editor options (horizontal scroll, fish, phpactor)
    └── plugins/
        ├── caelestia.lua        # Caelestia auto-activation
        ├── color-schemes.lua    # onedarkpro + live gsettings dark/light watcher
        ├── flutter.lua          # flutter-tools.nvim + dart_format
        ├── markdown.lua         # Strip markdownlint-cli2 & markdown-toc
        ├── neocord.lua          # Discord RPC (disabled by default)
        ├── php.lua              # Laravel Pint formatter via conform.nvim
        ├── snacks.lua           # Dashboard, picker, explorer & terminal
        └── which-key.lua        # Custom group labels
```

---

## 🚀 Installation

1. Back up your existing Neovim configuration:

   ```bash
   mv ~/.config/nvim ~/.config/nvim.bak
   ```

2. Clone **xmlazy**:

   ```bash
   git clone git@github.com:iqbalmu/xmlazy.git ~/.config/nvim
   ```

3. Launch Neovim and let `lazy.nvim`, Mason, and Treesitter install plugins and parsers:

   ```bash
   nvim
   ```

### Recommended External Tools

- **Core**: `git`, `ripgrep` (`rg`), `fd`, `stylua`, `node`
- **Flutter / Dart**: `flutter`, `dart` (FVM supported)
- **PHP / Laravel**: `php`, `phpactor` (`:MasonInstall phpactor`), `pint` (project `vendor/bin/pint` or `:MasonInstall pint`)
- **Go**: `go`, `gopls`
