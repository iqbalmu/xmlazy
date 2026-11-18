return {
  "nickjvandyke/opencode.nvim",
  version = "*",
  dependencies = {
    {
      "folke/snacks.nvim",
      optional = true,
    },
  },
  keys = {
    {
      "<leader>oa",
      function()
        require("opencode").ask("@this: ", { submit = true })
      end,
      mode = { "n", "x" },
      desc = "Ask opencode",
    },
    {
      "<leader>ox",
      function()
        require("opencode").select()
      end,
      mode = { "n", "x" },
      desc = "Execute opencode action",
    },
    {
      "<leader>ot",
      function()
        require("opencode").toggle()
      end,
      mode = { "n", "t" },
      desc = "Toggle opencode",
    },
    {
      "go",
      function()
        return require("opencode").operator("@this ")
      end,
      mode = { "n", "x" },
      desc = "Add range to opencode",
      expr = true,
    },
    {
      "goo",
      function()
        return require("opencode").operator("@this ") .. "_"
      end,
      mode = { "n" },
      desc = "Add line to opencode",
      expr = true,
    },
  },
  config = function()
    vim.g.opencode_opts = {}
    vim.o.autoread = true
  end,
}
