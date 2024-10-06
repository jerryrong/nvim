local M = {}

M.setup = function(on_attach, capabilities)
  require("lspconfig").lua_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      Lua = {
        runtime = {
          version = "LuaJIT",
        },
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          preloadFileSize = 350,
        },
        telemetry = { enable = false },
      },
    },
  })
end

return M
