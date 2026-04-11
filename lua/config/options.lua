-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- PHP Language Server
vim.g.lazyvim_php_lsp = "phpactor"

-- Laravel Pint formatter
vim.g.lazyvim_formatters = { php = { "pint" } }

-- Mengaktifkan dukungan mouse sepenuhnya (klik, scroll, resize split)
vim.opt.mouse = "a"

-- Aktifkan scrolling horizontal secara smooth/halus
vim.opt.sidescroll = 1 -- Scroll 1 karakter per kali (bukan loncat setengah layar)

-- Jaga jarak dari tepi kanan/kiri layar (seperti scrolloff tapi horizontal)
vim.opt.sidescrolloff = 8 -- Mulai scroll ketika kursor 8 kolom dari tepi

-- Matikan line wrapping agar horizontal scroll berfungsi
vim.opt.wrap = false

-- (Opsional) Virtual edit agar posisi scroll tidak reset
vim.opt.virtualedit = "all"
