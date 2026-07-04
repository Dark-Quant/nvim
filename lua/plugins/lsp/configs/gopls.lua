return {
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
