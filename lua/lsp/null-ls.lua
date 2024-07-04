local null_ls = require("null-ls")
local b = null_ls.builtins

local with_root_file = function(...)
  local files = { ... }
  return function(utils)
    return utils.root_has_file(files)
  end
end

local sources = {
  -- formatting
  b.formatting.clang_format,
  b.formatting.gofmt,
  b.formatting.prettier,
  b.formatting.stylua.with({
    condition = with_root_file("stylua.toml"),
  }),
}

local M = {}

M.setup = function(on_attach, _)
  null_ls.setup({
    sources = sources,
    on_attach = on_attach,
  })
end

return M
