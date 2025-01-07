vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  update_in_insert = false,
  virtual_text = true,
  severity_sort = true,
})

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = ' ', Warn = '', Hint = '', Info = '' }
for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
end

vim.diagnostic.config {
  virtual_text = false,
  update_in_insert = true,
  float = {
    source = 'always', -- Or "if_many"
  },
}

return {}
