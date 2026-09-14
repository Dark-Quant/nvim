return {
    'Pocco81/auto-save.nvim',
    lazy = true,
    ft = 'tex',
    config = function()
        require('auto-save').setup({
            enabled = true,
            debounce_delay = 500,
            conditions = {
                exists = true,
                modifiable = true,
            },
        })
    end,
}
