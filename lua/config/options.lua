-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- PHP Language Server
vim.g.lazyvim_php_lsp = "phpactor"

-- Enable full mouse support (click, scroll, resize splits)
vim.opt.mouse = "a"

-- Smooth horizontal scrolling (1 character at a time instead of half-screen jumps)
vim.opt.sidescroll = 1
vim.opt.sidescrolloff = 8

-- Disable line wrapping so horizontal scrolling works
vim.opt.wrap = false

-- Allow cursor anywhere past EOL so scroll position does not reset
vim.opt.virtualedit = "all"

vim.opt.shell = "fish"
