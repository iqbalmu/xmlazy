-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Disable spell checker for markdown/mdx (LazyVim enables it via `lazyvim_wrap_spell`;
-- this autocmd runs afterwards and overrides it). Wrap stays enabled (<leader>uw to toggle).
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("markdown_no_spell", { clear = true }),
  pattern = { "markdown", "markdown.mdx" },
  callback = function()
    vim.opt_local.spell = false
  end,
})

-- Use 2-space indentation for Dart/Flutter
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("flutter_indent", { clear = true }),
  pattern = "dart",
  callback = function()
    vim.bo.shiftwidth = 2
    vim.bo.tabstop = 2
    vim.bo.softtabstop = 2
    vim.bo.expandtab = true
  end,
})
