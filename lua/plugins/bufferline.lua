return {
    'akinsho/bufferline.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    event = "UIEnter",
    config = function()
        require('bufferline').setup {
            options = {
                buffer_close_icon = '󰅖',
                close_command = 'bdelete %d',
                close_icon = '󰅖',
                indicator = {
                    style = 'icon',
                    icon = ' ',
                },
                left_trunc_marker = '',
                modified_icon = '●',
                offsets = { { filetype = 'NvimTree' } },
                right_mouse_command = 'bdelete! %d',
                right_trunc_marker = '',
                show_close_icon = false,
                show_tab_indicators = true,
            },
        }
    end,
}
