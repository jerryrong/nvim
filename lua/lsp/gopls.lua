local M = {}

local util = require("lspconfig.util")

M.setup = function(on_attach, capabilities)
  require("lspconfig").gopls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    root_dir = util.root_pattern("go.mod", ".git"),
    settings = {},
  })
end

return M
