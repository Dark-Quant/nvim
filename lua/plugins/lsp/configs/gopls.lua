return {
  -- on_attach = on_attach,
  cmd = { 'gopls', 'serve' },
  filetypes = { 'go', 'go.mod' },
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
        shadow = true,
      },
      staticcheck = true,
    }
  }
}
