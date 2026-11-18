-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Buffer navigation with Tab / Shift-Tab
map("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })
map("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev Buffer" })

-- Rename within current buffer only
map("n", "<leader>rr", [[:%s/\<<C-r><C-w>\>//g<Left><Left>]], { desc = "Rename in current buffer" })
map("v", "<leader>re", 'y:%s/<C-r>"//g<Left><Left>', { desc = "Rename selected text in buffer" })

-- Save file
map({ "n", "v", "x" }, "<C-s>", "<cmd>silent! w<cr>", { silent = true, desc = "Save file" })
map("i", "<C-s>", "<Esc><cmd>silent! w<cr>", { silent = true, desc = "Save file" })

-- Duplicate line (uses Alt+Shift since Shift+Arrow is used for scrolling in Ghostty)
map({ "n", "v" }, "<A-S-Down>", "<cmd>t.<cr>", { silent = true, desc = "Duplicate line down" })
map({ "n", "v" }, "<A-S-Up>", "<cmd>t -1<cr>", { silent = true, desc = "Duplicate line up" })
map("i", "<A-S-Down>", "<Esc><cmd>t.<cr>gi", { silent = true, desc = "Duplicate line down" })
map("i", "<A-S-Up>", "<Esc><cmd>t -1<cr>gi", { silent = true, desc = "Duplicate line up" })
map("x", "<A-S-Down>", ":'<,'>t'><cr>", { silent = true, desc = "Duplicate selection down" })
map("x", "<A-S-Up>", ":'<,'>t-1<cr>", { silent = true, desc = "Duplicate selection up" })

-- Move lines up and down
map("n", "<A-Down>", "<cmd>execute 'move .+' . v:count1<cr>==", { silent = true, desc = "Move line down" })
map("n", "<A-Up>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { silent = true, desc = "Move line up" })
map("i", "<A-Down>", "<esc><cmd>m .+1<cr>==gi", { silent = true, desc = "Move line down" })
map("i", "<A-Up>", "<esc><cmd>m .-2<cr>==gi", { silent = true, desc = "Move line up" })
map(
  "x",
  "<A-Down>",
  ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv",
  { silent = true, desc = "Move selection down" }
)
map(
  "x",
  "<A-Up>",
  ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv",
  { silent = true, desc = "Move selection up" }
)

-- Window navigation with Ctrl+Shift+Arrow (alternative to Ctrl+hjkl)
map("n", "<C-S-Left>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-S-Down>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-S-Up>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-S-Right>", "<C-w>l", { desc = "Go to right window" })
map("t", "<C-S-Left>", [[<C-\><C-n><C-w>h]], { desc = "Go to left window" })
map("t", "<C-S-Down>", [[<C-\><C-n><C-w>j]], { desc = "Go to lower window" })
map("t", "<C-S-Up>", [[<C-\><C-n><C-w>k]], { desc = "Go to upper window" })
map("t", "<C-S-Right>", [[<C-\><C-n><C-w>l]], { desc = "Go to right window" })

-- Fast horizontal scrolling with Alt+h/l or Alt+Left/Right
map("n", "<A-l>", "20zl", { desc = "Scroll view right" })
map("n", "<A-h>", "20zh", { desc = "Scroll view left" })
map("n", "<A-Right>", "20zl", { desc = "Scroll view right" })
map("n", "<A-Left>", "20zh", { desc = "Scroll view left" })
