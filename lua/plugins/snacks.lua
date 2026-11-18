return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
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
        -- Header (left pane)
        {
          pane = 1,
          section = "header",
          padding = 1,
        },

        -- System info below header (left pane)
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

        -- Startup info (left pane)
        {
          pane = 1,
          section = "startup",
          padding = 1,
          indent = 2,
        },

        -- Quick actions (right pane)
        {
          pane = 2,
          icon = "󰓅 ",
          title = "Quick Actions",
          section = "keys",
          indent = 2,
          padding = 1,
        },

        -- Recent files (right pane)
        {
          pane = 2,
          icon = "󰈙 ",
          title = "Recent Files",
          section = "recent_files",
          indent = 2,
          padding = 1,
          limit = 5,
        },

        -- Projects (right pane)
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

    picker = {
      enabled = true,
      ---@class snacks.picker.sources.Config
      sources = {
        files = {
          hidden = true,
          follow = true,
        },
        explorer = {
          auto_close = false,
          hidden = true,
          ignored = true, -- show gitignored files (e.g. .env)
          layout = {
            preset = "sidebar",
            width = 0.25,
          },
        },
      },
      layout = {
        preset = "telescope",
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
              border = "rounded",
              title_pos = "center",
            },
          },
        },
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
    {
      "<C-\\>",
      function()
        Snacks.terminal(nil, { win = { position = "right", width = 0.25 } })
      end,
      mode = { "n", "t" },
      desc = "Toggle Terminal (Vertical)",
    },
    {
      "<leader>tf",
      function()
        Snacks.terminal(nil, { win = { position = "float" } })
      end,
      desc = "Terminal Float",
    },
    {
      "<leader>th",
      function()
        Snacks.terminal(nil, { win = { position = "bottom", height = 15 } })
      end,
      desc = "Terminal Horizontal",
    },
    {
      "<leader>tv",
      function()
        Snacks.terminal(nil, { win = { position = "right", width = 0.25 } })
      end,
      desc = "Terminal Vertical",
    },
  },
}
