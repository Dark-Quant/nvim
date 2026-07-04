return {
    "lervag/vimtex",
    ft = "tex",
    config = function()
        vim.g.vimtex_syntax_enabled = true
        vim.g.vimtex_indent_enabled = false
        vim.g.tex_indent_items = false
        vim.g.tex_indent_brace = false
        vim.g.vimtex_quickfix_mode = 0
        vim.g.vimtex_log_ignore = {
            'Underfull',
            'Overfull',
            'specifier changed to',
            'Token not allowed in a PDF string',
        }
        vim.g.vimtex_mappings_enabled = false
        vim.g.tex_flavor = 'tex'
    end,
}
