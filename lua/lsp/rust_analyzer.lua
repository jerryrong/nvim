local M = {}
local util = require("lspconfig.util")

M.setup = function(on_attach, capabilities)
  require("lspconfig").rust_analyzer.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    root_dir = util.root_pattern("Cargo.toml"),
    settings = {
      ["rust-analyzer"] = {},
    },
  })
end

return M
