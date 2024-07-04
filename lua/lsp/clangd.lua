local M = {}
local util = require("lspconfig.util")

M.setup = function(on_attach, capabilities)
  require("lspconfig").clangd.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = {
      "clangd",
      "--header-insertion=never",
      "--completion-style=detailed",
    },
    root_dir = util.root_pattern(".clangd", ".clang-tidy", ".clang-format", "compile_commands.json", ".git"),
  })
end

return M
