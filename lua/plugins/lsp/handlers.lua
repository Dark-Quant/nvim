local signs = { Error = ' ', Warn = '', Hint = '', Info = '' }
for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
end

vim.diagnostic.config {
    virtual_text = false,
    update_in_insert = true,
    float = {
        source = 'always',
    },
    signs = true,
    underline = true,
    severity_sort = true,
}

return {}
