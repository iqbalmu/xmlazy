return {
  "akinsho/toggleterm.nvim",
  event = "VeryLazy",
  config = function()
    require("toggleterm").setup({
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4 -- 40% lebar layar
        end
      end,
      open_mapping = [[<c-\>]], -- Toggle dari normal mode
      direction = "vertical", -- default float, bisa override per command
      -- float_opts = {
      --   border = "curved",
      -- },
    })
  end,
  keys = {
    { "<C-\\>", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal", mode = "n" },
    { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Terminal Float" },
    { "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Terminal Horizontal" },
    { "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", desc = "Terminal Vertical" },
  },
}
