local SERVERS = {
    'lua_ls',
    'clangd',
    'bashls',
    'html',
    'cssls',
    'tailwindcss',
    'gopls',
    'pyright',
    'texlab'
    -- 'neocmake',
    -- 'svelte',
}

return {

    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "folke/neodev.nvim", opts = {} },
    },
    config = function()
        -- local nvim_lsp = require("lspconfig")
        -- local mason_lspconfig = require("mason-lspconfig")

        -- local protocol = require("vim.lsp.protocol")

        local on_attach_wrapper = function(fn)
            return function(client, bufnr)
                if client.name == 'ts_ls' then
                    client.server_capabilities.documentFormattingProvider = false
                end
                -- Mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
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

                fn(client, bufnr);

            end
        end


        -- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        capabilities.textDocument.completion.completionItem.snippetSupport = true

        local lsp_servers = SERVERS

        local default = {
            capabilities = capabilities,
            on_attach = function(client, bufnr) end,
        }

        for _, server in ipairs(lsp_servers) do
            local has_config, config = pcall(require, 'plugins.lsp.configs.' .. server)

            if has_config then
                for k, v in pairs(default) do
                    config[k] = v
                end
            else
                config = default
            end

            config.on_attach = on_attach_wrapper(config.on_attach)

            require('lspconfig')[server].setup(config)
        end
    end,
}


