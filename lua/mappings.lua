local keymap = vim.keymap

-- Bind Ctrl+<movement> keys to move around the windows
keymap.set("n", "<c-h>", "<c-w>h")
keymap.set("n", "<c-j>", "<c-w>j")
keymap.set("n", "<c-k>", "<c-w>k")
keymap.set("n", "<c-l>", "<c-w>l")

-- Make search results appear in the middle on the screen
keymap.set("n", "n", "nzz")
keymap.set("n", "N", "Nzz")

-- Map j and k keys operate on display line
keymap.set("n", "j", "gj")
keymap.set("n", "k", "gk")

-- Map reverse character search command to another key
keymap.set("n", "\\", ",")

-- Remap jj to escape insert mode
keymap.set("i", "jj", "<ESC>")

-- No arrow keys
keymap.set("n", "<up>", "")
keymap.set("n", "<down>", "")
keymap.set("i", "<up>", "")
keymap.set("i", "<down>", "")
keymap.set("i", "<left>", "")
keymap.set("i", "<right>", "")

-- Use left and right to switch buffers
keymap.set("n", "<left>", ":bp<cr>")
keymap.set("n", "<right>", ":bn<cr>")

-- Telescope --
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>f", builtin.find_files, {})
vim.keymap.set("n", "<leader>b", builtin.buffers, {})
vim.keymap.set("n", "<leader>fw", builtin.live_grep, {})
vim.keymap.set("n", "<leader>p", builtin.lsp_document_symbols, {})
