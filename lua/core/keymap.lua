local function map(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { silent = true })
end

vim.keymap.set("n", "j", "gj", { noremap = true, silent = true })
vim.keymap.set("n", "k", "gk", { noremap = true, silent = true })

map('n', '<C-n>', '<CMD>NvimTreeToggle<CR>')
map('n', '<leader>n', '<CMD>NvimTreeFocus<CR>')

vim.keymap.set({'i', 's'}, '<C-i>', function()
    require("luasnip").jump(1)
end, { silent = true })

-- LuaSnip expand/jump (Gilles style)
local luasnip = require('luasnip')
vim.keymap.set({ 'i', 's' }, '<Tab>',  function()
    if luasnip.expand_or_jumpable() then
        return luasnip.expand_or_jump()
    else
        return '<Tab>'
    end
end, { silent = true, expr = true })

vim.keymap.set({ 'i', 's' }, '<S-Tab>', function()
    if luasnip.jumpable(-1) then
        return luasnip.jump(-1)
    else
        return '<C-d>'
    end
end, { silent = true, expr = true })

-- Reload snippets
map('n', '<leader>su', function()
    luasnip.reload_snippets()
end)

-- LaTeX (vimtex)
map('n', '<leader>lp', ':VimtexCompile<CR>')
map('n', '<leader>lv', ':VimtexView<CR>')
map('n', '<leader>lc', ':VimtexClean<CR>')
map('n', '<leader>ls', ':VimtexStop<CR>')
