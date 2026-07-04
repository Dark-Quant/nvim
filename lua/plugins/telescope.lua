return {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
        { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Find files' },
        { '<leader>fg', '<cmd>Telescope live_grep<cr>', desc = 'Live grep' },
        { '<leader>fb', '<cmd>Telescope buffers<cr>', desc = 'Buffers' },
        { '<leader>fs', '<cmd>Telescope git_status<cr>', desc = 'Git status' },
        { '<leader>fc', '<cmd>Telescope git commits<cr>', desc = 'Git commits' },
    },
    config = function()
        require('telescope').setup {
            defaults = {},
            pickers = {
                find_files = {
                    theme = 'dropdown',
                },
            },
            extensions = {},
        }
    end,
}
