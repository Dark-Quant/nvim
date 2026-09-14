return {
    settings = {
        texlab = {
            build = {
                onSave = false,
                executable = 'latexmk',
                args = { '-pdf', '-synctex=1', '-interaction=nonstopmode' },
            },
            chktex = {
                onEdit = true,
                onOpenAndSave = true,
            },
            diagnosticsDelay = 300,
        },
    },
}
