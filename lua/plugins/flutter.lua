return {
  {
    "akinsho/flutter-tools.nvim",
    ft = "dart",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      flutter_path = "flutter",
      fvm = true,
      widget_guides = {
        enabled = true,
      },
      dev_log = {
        enabled = true,
      },
    },
    keys = {
      { "<leader>Fr", "<cmd>FlutterRun<cr>", desc = "Flutter Run" },
      { "<leader>FR", "<cmd>FlutterRestart<cr>", desc = "Flutter Restart" },
      { "<leader>Fh", "<cmd>FlutterHotReload<cr>", desc = "Hot Reload" },
      { "<leader>FH", "<cmd>FlutterHotRestart<cr>", desc = "Hot Restart" },
      { "<leader>Fd", "<cmd>FlutterDevices<cr>", desc = "Flutter Devices" },
      { "<leader>Fe", "<cmd>FlutterEmulators<cr>", desc = "Flutter Emulators" },
      { "<leader>Fo", "<cmd>FlutterOutline<cr>", desc = "Flutter Outline" },
      { "<leader>Fv", "<cmd>FlutterVisualDebug<cr>", desc = "Visual Debug" },
      { "<leader>Fq", "<cmd>FlutterQuit<cr>", desc = "Flutter Quit" },
      { "<leader>Ft", "<cmd>FlutterTest<cr>", desc = "Flutter Test" },
    },
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        dart = { "dart_format" },
      },
    },
  },
}
