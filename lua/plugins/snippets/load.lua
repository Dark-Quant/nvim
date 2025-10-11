require('luasnip.loaders.from_vscode').lazy_load()

local m = require('plugins.snippets.shorts')

local filetypes = {'cpp'}

for _, filetype in ipairs(filetypes) do
  local has_snippets, snippets = pcall(require, 'plugins.snippets.filetypes.' .. filetype)

  if has_snippets then
    m.ls.add_snippets(filetype, snippets)
  end
end

local tex_snippets = {'bibtex', 'floats', 'fonts', 'formatting', 'math', 'structure', 'templates'}
-- m.ls.add_snippets('tex', require('plugins.snippets.bib'))
for _, file in ipairs(tex_snippets) do
    m.ls.add_snippets('tex', require('plugins.snippets.tex.' .. file))
end
