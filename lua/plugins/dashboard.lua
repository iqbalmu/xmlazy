return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      enabled = true,
      width = 60,
      row = nil,
      col = nil,
      pane_gap = 4,
      autokeys = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ",

      preset = {
        header = [[


  ██╗  ██╗███╗   ███╗██╗   ██╗██╗   ██╗
  ╚██╗██╔╝████╗ ████║██║   ██║██║   ██║
   ╚███╔╝ ██╔████╔██║██║   ██║██║   ██║
   ██╔██╗ ██║╚██╔╝██║██║   ██║██║   ██║
  ██╔╝ ██╗██║ ╚═╝ ██║╚██████╔╝╚██████╔╝
  ╚═╝  ╚═╝╚═╝     ╚═╝ ╚═════╝  ╚═════╝


        ]],
        keys = {
          { icon = "󰈞 ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = "󰈔 ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = "󰊄 ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = "󰋚 ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          {
            icon = "󰒓 ",
            key = "c",
            desc = "Config",
            action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
          },
          { icon = "󰁯 ", key = "s", desc = "Restore Session", section = "session" },
          { icon = "󰈆 ", key = "q", desc = "Quit", action = ":qa" },
        },
      },

      sections = {
        -- Header di kiri
        {
          pane = 1,
          section = "header",
          padding = 1,
        },

        -- Info section di bawah header (kiri)
        {
          pane = 1,
          icon = "󰃭 ",
          title = "System Info",
          padding = 1,
          indent = 2,
          text = {
            {
              "  Neovim " .. vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch,
              hl = "SnacksDashboardDesc",
            },
            { "  " .. os.date("%A, %d %B %Y"), hl = "SnacksDashboardDesc" },
            { "  " .. os.date("%H:%M:%S"), hl = "SnacksDashboardDesc" },
          },
        },

        -- Startup info di kiri
        {
          pane = 1,
          section = "startup",
          padding = 1,
          indent = 2,
        },

        -- Quick Actions di kanan
        {
          pane = 2,
          icon = "󰓅 ",
          title = "Quick Actions",
          section = "keys",
          indent = 2,
          padding = 1,
        },

        -- Recent Files di kanan
        {
          pane = 2,
          icon = "󰈙 ",
          title = "Recent Files",
          section = "recent_files",
          indent = 2,
          padding = 1,
          limit = 5,
        },

        -- Projects di kanan
        {
          pane = 2,
          icon = "󰉋 ",
          title = "Projects",
          section = "projects",
          indent = 2,
          padding = 1,
          limit = 3,
        },
      },

      formats = {
        key = function(item)
          return { { "[", hl = "special" }, { item.key, hl = "key" }, { "]", hl = "special" } }
        end,
      },
    },
  },

  keys = {
    {
      "<leader>;",
      function()
        Snacks.dashboard()
      end,
      desc = "Dashboard",
    },
  },
}
