local group = vim.api.nvim_create_augroup("Flutter", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = "dart",
  callback = function()
    vim.bo.shiftwidth = 2
    vim.bo.tabstop = 2
    vim.bo.softtabstop = 2
    vim.bo.expandtab = true
  end,
})
