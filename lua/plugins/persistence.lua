-- Session Management with Persistence
return {
  "folke/persistence.nvim",
  event = "BufReadPre",
  opts = {
    dir = vim.fn.stdpath("state") .. "/sessions/",
    options = { "buffers", "curdir", "tabpages", "winsize" },
  },
  keys = {
    {
      "<leader>ss",
      function()
        require("persistence").load()
      end,
      desc = "Restore Session",
    },
    {
      "<leader>sl",
      function()
        require("persistence").load({ last = true })
      end,
      desc = "Restore Last Session",
    },
    {
      "<leader>sd",
      function()
        require("persistence").stop()
      end,
      desc = "Don't Save Current Session",
    },
  },
}
