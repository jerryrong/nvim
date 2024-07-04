local M = {}
local util = require("lspconfig.util")

M.setup = function(on_attach, capabilities)
  require("lspconfig").ccls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    init_options = {
      client = {
        snippetSupport = false,
      },
      cache = {
        directory = ".ccls-cache",
      },
    },
    root_dir = util.root_pattern("compile_commands.json", ".ccls", ".git"),
  })
end

return M
