return {
  "olimorris/onedarkpro.nvim",
  priority = 1000, -- Ensure it loads first,
  config = function()
    require("onedarkpro").setup({
      options = {
        transparency = true,
        terminal_colors = true,
        lualine_transparency = true,
      },
    })
    vim.cmd("colorscheme vaporwave")
  end,
}
