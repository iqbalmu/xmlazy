-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

require("config.flutter-autocmds")

-- Matikan spell checker khusus markdown/mdx (LazyVim menyalakannya via grup
-- `lazyvim_wrap_spell`; autocmd ini terdaftar sesudahnya sehingga menang).
-- Wrap tetap aktif seperti default; toggle manual: <leader>uw
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "markdown.mdx" },
  callback = function()
    vim.opt_local.spell = false
  end,
})
