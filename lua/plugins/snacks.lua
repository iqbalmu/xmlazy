return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    picker = {
      enabled = true,
      ---@class snacks.picker.sources.Config
      sources = {
        files = {
          hidden = true, -- show hidden files
          follow = true,
        },
        explorer = {
          auto_close = true,
          hidden = true,
          layout = {
            preset = "default",
          },
        },
      },
      layout = {
        -- presets options : "default" , "ivy" , "ivy-split" , "telescope" , "vscode", "select" , "sidebar"
        -- override picker layout in keymaps function as a param below
        preset = "telescope", -- defaults to this layout unless overidden
        cycle = false,
      },
      layouts = {
        telescope = {
          layout = {
            box = "vertical",
            backdrop = false,
            width = 0.7,
            height = 0.8,
            border = "none",
            {
              box = "vertical",
              {
                win = "input",
                height = 1,
                border = "rounded",
                title = "{title} {live} {flags}",
                title_pos = "center",
              },
              { win = "list", title = " Results ", title_pos = "center", border = "rounded" },
            },
            {
              win = "preview",
              title = "{preview:Preview}",
              -- width = 0.50,
              border = "rounded",
              title_pos = "center",
            },
          },
        },
      },
    },
  },
}
