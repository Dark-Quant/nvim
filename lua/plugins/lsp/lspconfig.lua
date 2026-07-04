local SERVERS = {
    'lua_ls',
    'clangd',
    'bashls',
    'html',
    'cssls',
    'tailwindcss',
    'gopls',
    'pyright',
    'texlab',
}

return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "folke/neodev.nvim", opts = {} },
        "ray-x/lsp_signature.nvim",
    },
    config = function()
        local on_attach = function(client, bufnr)
            if client.name == 'ts_ls' then
                client.server_capabilities.documentFormattingProvider = false
            end

            local bufopts = { noremap = true, silent = true, buffer = bufnr }
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
            vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
            vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
            vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
            vim.keymap.set('n', '<leader>wl', function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end, bufopts)
            vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
            vim.keymap.set('n', '<leader>f', function()
                vim.lsp.buf.format { async = true }
            end, bufopts)
        end

        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        capabilities.textDocument.completion.completionItem.snippetSupport = true

        local default = {
            capabilities = capabilities,
        }

        for _, server in ipairs(SERVERS) do
            local has_config, config = pcall(require, 'plugins.lsp.configs.' .. server)

            if has_config then
                config.capabilities = default.capabilities
            else
                config = vim.deepcopy(default)
            end

            local existing = config.LspAttach
            if existing then
                config.LspAttach = function(client, bufnr)
                    on_attach(client, bufnr)
                    existing(client, bufnr)
                end
            else
                config.LspAttach = on_attach
            end

            vim.lsp.config(server, config)
            vim.lsp.enable({ server })
        end
    end,
}
