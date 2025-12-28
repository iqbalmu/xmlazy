return {
  "olimorris/onedarkpro.nvim",
  priority = 1000,
  config = function()
    require("onedarkpro").setup({
      options = {
        transparency = true,
        terminal_colors = true,
        lualine_transparency = true,
      },
      -- Customize highlight groups for dashboard
      highlights = {
        -- Dashboard header colors
        DashboardHeader = { fg = "#c678dd" },
        DashboardFooter = { fg = "#61afef" },
        DashboardShortcut = { fg = "#e5c07b" },
        DashboardIcon = { fg = "#98c379" },
        DashboardKey = { fg = "#e06c75" },
        DashboardDesc = { fg = "#abb2bf" },
        DashboardProjectTitle = { fg = "#d19a66" },
        DashboardProjectIcon = { fg = "#56b6c2" },
        DashboardMruTitle = { fg = "#d19a66" },
        DashboardMruIcon = { fg = "#56b6c2" },
        DashboardFiles = { fg = "#abb2bf" },
      },
    })
    vim.cmd("colorscheme vaporwave")

    -- Apply dashboard highlights after colorscheme loads
    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "*",
      callback = function()
        vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#c678dd", bold = true })
        vim.api.nvim_set_hl(0, "DashboardFooter", { fg = "#61afef", italic = true })
        vim.api.nvim_set_hl(0, "DashboardShortcut", { fg = "#e5c07b" })
        vim.api.nvim_set_hl(0, "DashboardIcon", { fg = "#98c379" })
        vim.api.nvim_set_hl(0, "DashboardKey", { fg = "#e06c75", bold = true })
        vim.api.nvim_set_hl(0, "DashboardDesc", { fg = "#abb2bf" })
        vim.api.nvim_set_hl(0, "DashboardProjectTitle", { fg = "#d19a66", bold = true })
        vim.api.nvim_set_hl(0, "DashboardProjectIcon", { fg = "#56b6c2" })
        vim.api.nvim_set_hl(0, "DashboardMruTitle", { fg = "#d19a66", bold = true })
        vim.api.nvim_set_hl(0, "DashboardMruIcon", { fg = "#56b6c2" })
        vim.api.nvim_set_hl(0, "DashboardFiles", { fg = "#abb2bf" })
      end,
    })
  end,
}
