local map = vim.keymap.set

map("n", "<leader>Fr", "<cmd>FlutterRun<CR>", { desc = "Flutter Run" })
map("n", "<leader>FR", "<cmd>FlutterRestart<CR>", { desc = "Flutter Restart" })
map("n", "<leader>Fh", "<cmd>FlutterHotReload<CR>", { desc = "Hot Reload" })
map("n", "<leader>FH", "<cmd>FlutterHotRestart<CR>", { desc = "Hot Restart" })
map("n", "<leader>Fd", "<cmd>FlutterDevices<CR>", { desc = "Flutter Devices" })
map("n", "<leader>Fe", "<cmd>FlutterEmulators<CR>", { desc = "Flutter Emulators" })
map("n", "<leader>Fo", "<cmd>FlutterOutline<CR>", { desc = "Flutter Outline" })
map("n", "<leader>Fv", "<cmd>FlutterVisualDebug<CR>", { desc = "Visual Debug" })
map("n", "<leader>Fq", "<cmd>FlutterQuit<CR>", { desc = "Flutter Quit" })
map("n", "<leader>Ft", "<cmd>FlutterTest<CR>", { desc = "Flutter Test" })
