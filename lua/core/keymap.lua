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
