return {
    'lervag/vimtex',
    lazy = false,
    config = function()
        vim.g.vimtex_compiler_method = 'latexmk'
        vim.g.vimtex_compiler_latexmk = {
            build_dir = 'build',
            options = {
                '-xelatex',
                '-shell-escape',
                '-file-line-error',
                '-synctex=1',
                '-interaction=nonstopmode',
            },
        }
        vim.g.vimtex_view_method = 'zathura'
        vim.g.vimtex_view_automatic = 0
    end,
}
