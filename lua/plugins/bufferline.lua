local function configure()
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
    --[[ highlights = {
        -- buffers
        background = { fg = C.vscCursorLight, bg = C.vscTabOther },
        buffer_visible = { fg = C.vscCursorLight, bg = C.vscTabOther },
        buffer_selected = { fg = C.vscFront, bg = C.vscTabCurrent }, -- current
        -- Duplicate
        duplicate_selected = { fg = C.vscFront, bg = C.vscTabCurrent },
        duplicate_visible = { fg = C.vscCursorLight, bg = C.vscTabOther },
        duplicate = { fg = C.vscCursorLight, bg = C.vscTabOther },
        -- tabs
        tab = { fg = C.vscCursorLight, bg = C.vscTabOther },
        tab_selected = { fg = C.vscBlue, bg = C.vscTabCurrent, bold = true },
        tab_separator = { fg = C.vscCursorLight, bg = C.vscTabOther },
        tab_close = { fg = C.vscRed, bg = C.vscTabOther },
        indicator_selected = { fg = C.vscBlueGreen, bg = C.vscBlueGreen },
        -- separators
        separator = { fg = C.vscCursorLight, bg = C.vscTabOther },
        separator_visible = { fg = C.vscCursorLight, bg = C.vscTabOther },
        separator_selected = { fg = C.vscBlueGreen, bg = C.vscBlueGreen },
        offset_separator = { fg = C.vscCursorLight, bg = C.vscTabCurrent },
        -- close buttons
        close_button = { fg = C.vscCursorLight, bg = C.vscTabOther },
        close_button_visible = { fg = C.vscCursorLight, bg = C.vscTabOther },
        close_button_selected = { fg = C.vscRed, bg = C.vscTabCurrent },
        -- Empty fill
        fill = { fg = C.vscCursorLight, bg = C.vscTabOutside },
        -- Numbers
        numbers = { fg = C.vscPopupFront, bg = C.vscTabOther },
        numbers_visible = { fg = C.vscPopupFront, bg = C.vscTabOther },
        numbers_selected = { fg = C.vscPopupFront, bg = C.vscTabCurrent },
        -- Errors
        error = { fg = C.vscRed, bg = C.vscTabOther },
        error_visible = { fg = C.vscRed, bg = C.vscTabOther },
        error_selected = { fg = C.vscRed, bg = C.vscTabCurrent },
        error_diagnostic = { fg = C.vscRed, bg = C.vscTabOther },
        error_diagnostic_visible = { fg = C.vscRed, bg = C.vscTabOther },
        error_diagnostic_selected = { fg = C.vscRed, bg = C.vscTabCurrent },
        -- Warnings
        warning = { fg = C.vscYellow, bg = C.vscTabOther },
        warning_visible = { fg = C.vscYellow, bg = C.vscTabOther },
        warning_selected = { fg = C.vscYellow, bg = C.vscTabCurrent },
        warning_diagnostic = { fg = C.vscYellow, bg = C.vscTabOther },
        warning_diagnostic_visible = { fg = C.vscYellow, bg = C.vscTabOther },
        warning_diagnostic_selected = { fg = C.vscYellow, bg = C.vscTabCurrent },
        -- Infos
        info = { fg = C.vscBlue, bg = C.vscTabOther },
        info_visible = { fg = C.vscBlue, bg = C.vscTabOther },
        info_selected = { fg = C.vscBlue, bg = C.vscTabCurrent },
        info_diagnostic = { fg = C.vscBlue, bg = C.vscTabOther },
        info_diagnostic_visible = { fg = C.vscBlue, bg = C.vscTabOther },
        info_diagnostic_selected = { fg = C.vscBlue, bg = C.vscTabCurrent },
        -- Hint
        hint = { fg = C.vscBlue, bg = C.vscTabOther },
        hint_visible = { fg = C.vscBlue, bg = C.vscTabOther },
        hint_selected = { fg = C.vscBlue, bg = C.vscTabCurrent },
        hint_diagnostic = { fg = C.vscBlue, bg = C.vscTabOther },
        hint_diagnostic_visible = { fg = C.vscBlue, bg = C.vscTabOther },
        hint_diagnostic_selected = { fg = C.vscBlue, bg = C.vscTabCurrent },
        -- Diagnostics
        diagnostic = { fg = C.vscPopupFront, bg = C.vscTabOther },
        diagnostic_visible = { fg = C.vscPopupFront, bg = C.vscTabOther },
        diagnostic_selected = { fg = C.vscPopupFront, bg = C.vscTabCurrent },
        -- Modified
        modified = { fg = C.vscGitModified, bg = C.vscTabOther },
        modified_selected = { fg = C.vscGitModified, bg = C.vscTabCurrent },
      }, ]]
    -- }
end

return {

    'akinsho/bufferline.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    config = configure,
}

