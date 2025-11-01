-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Prev/Next buffer dengan Tab / Shift Tab
vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev Buffer" })

-- Rename (hanya di file saat ini)
vim.keymap.set("n", "<leader>rr", [[:%s/\<<C-r><C-w>\>/]], {
  noremap = true,
  silent = false,
  desc = "Rename in current buffer only",
})

-- Rename berdasarkan teks yang diseleksi
vim.keymap.set("v", "<leader>re", 'y:%s/<C-r>"/', {
  noremap = true,
  silent = false,
  desc = "Rename selected text in buffer",
})

local opts = { noremap = true, silent = true }

for _, mode in ipairs({ "v", "n", "x" }) do
  -- duplicate line
  vim.keymap.set(mode, "<S-Down>", "<cmd>t.<cr>", opts)
  vim.keymap.set(mode, "<S-Up>", "<cmd>t -1<cr>", opts)

  -- save file
  vim.keymap.set(mode, "<C-s>", "<cmd>silent! w<cr>", opts)
end

-- In insert mode: Ctrl+S = save and go to normal mode
vim.keymap.set("i", "<C-s>", "<Esc><cmd>silent! w<cr>", opts)

-- Insert mode: Duplicate line below and above
vim.keymap.set("i", "<S-Down>", "<Esc><cmd>t.<cr>gi", opts)
vim.keymap.set("i", "<S-Up>", "<Esc><cmd>t -1<cr>gi", opts)

-- duplicate line visual block
vim.keymap.set("x", "<S-Down>", ":'<,'>t'><cr>", opts)
vim.keymap.set("x", "<S-Up>", ":'<,'>t-1<cr>", opts)

-- move text up and down
vim.keymap.set("x", "<A-Down>", ":move '>+1<CR>gv-gv", opts)
vim.keymap.set("x", "<A-Up>", ":move '<-2<CR>gv-gv", opts)
vim.keymap.set("n", "<M-Down>", "<cmd>m+<cr>", opts)
vim.keymap.set("i", "<M-Down>", "<cmd>m+<cr>", opts)
vim.keymap.set("n", "<M-Up>", "<cmd>m-2<cr>", opts)
vim.keymap.set("i", "<M-Up>", "<cmd>m-2<cr>", opts)
