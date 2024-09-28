-- Diagnostic = "󰒡"
DiagnosticError = ""
DiagnosticHint = "󰌵"
DiagnosticInfo = "󰋼"
DiagnosticWarn = ""

local signs = {
  { name = "DiagnosticSignError", text = DiagnosticError, texthl = "DiagnosticSignError" },
  { name = "DiagnosticSignWarn", text = DiagnosticWarn, texthl = "DiagnosticSignWarn" },
  { name = "DiagnosticSignHint", text = DiagnosticHint, texthl = "DiagnosticSignHint" },
  { name = "DiagnosticSignInfo", text = DiagnosticInfo, texthl = "DiagnosticSignInfo" },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, sign)
end

vim.diagnostic.config({
  virtual_text = true,
  underline = true,
  signs = true,
  update_in_insert = false,
})

local on_attach = function(client, bufnr)
  -- bindings
  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  vim.keymap.set("n", "K", vim.lsp.buf.hover)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
  vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, bufopts)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

for _, server in ipairs({
  -- "ccls",
  "clangd",
  "lua_ls",
  "pyright",
  "gopls",
  "rust_analyzer",
}) do
  require("lsp." .. server).setup(on_attach, capabilities)
end
