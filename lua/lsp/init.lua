local on_attach = function(_, bufnr)
    -- bindings
    local bufopts = { noremap=true, silent=true, buffer=bufnr }

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition, bufopts)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

for _, server in ipairs({
    "ccls",
    "sumneko_lua",
}) do
    require("lsp." .. server).setup(on_attach, capabilities)
end
