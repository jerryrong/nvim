local actions = require("telescope.actions")
require('telescope').setup{
  pickers = {
    find_files = {
      find_command = {"fdfind", "--type", "file"}
    },
    buffers = {
        initial_mode = "normal",
        mappings = {
            i = {
                ["<C-d>"] = actions.delete_buffer,
            },
            n = {
                ["dd"] = actions.delete_buffer,
            }
        }
    },
  },
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<leader>p', builtin.lsp_document_symbols, {})
