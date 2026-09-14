require('luasnip.loaders.from_vscode').lazy_load()

local m = require('plugins.snippets.shorts')

local filetypes = {'cpp'}

for _, filetype in ipairs(filetypes) do
  local has_snippets, snippets = pcall(require, 'plugins.snippets.filetypes.' .. filetype)

  if has_snippets then
    m.ls.add_snippets(filetype, snippets)
  end
end
