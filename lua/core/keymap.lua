local function map(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { silent = true })
end

--[[
vanilla
]]
vim.keymap.set("n", "j", "gj", { noremap = true, silent = true }) 
vim.keymap.set("n", "k", "gk", { noremap = true, silent = true })

--[[
Nerd-Tree
]]
map('n', '<C-n>', '<CMD>NvimTreeToggle<CR>')
map('n', '<leader>n', '<CMD>NvimTreeFocus<CR>')

--[[
nvim-dap
 ]]
-- map('n', '<leader>b', require('dap').toggle_breakpoint)
map('n', '<F5>', '<cmd>:lua require("dap").continue()<cr>')
map('n', '<F3>', '<cmd>:lua require("dap").terminate()<cr>')
map('n', '<F10>', '<cmd>:lua require("dap").step_over()<cr>')
map('n', '<F11>', '<cmd>:lua require("dap").step_into()<cr>')
map('n', '<F12>', '<cmd>:lua require("dap").step_out()<cr>')

-- snippets

map({'i', 's'}, '<C-i>', '<cmd>:lua require("luasnip").jump(1)<cr>')
