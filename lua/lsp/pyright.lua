local M = {}

M.setup = function(on_attach, capabilities)
  require("lspconfig").pyright.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          diagnosticMode = "workspace",
          useLibraryCodeForTypes = true,
        },
      },
    },
  })
end

return M
