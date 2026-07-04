return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        {
            "L3MON4D3/LuaSnip",
            version = "v2.*",
            build = "make install_jsregexp",
        },
        "rafamadriz/friendly-snippets",
        "onsails/lspkind.nvim",
    },
    config = function()
        local cmp = require('cmp')
        local lspkind = require('lspkind')
        local luasnip = require('luasnip')

        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup {
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = {
                ['<C-k>'] = cmp.mapping.select_prev_item(),
                ['<C-j>'] = cmp.mapping.select_next_item(),
                ['<S-Tab>'] = cmp.mapping.select_prev_item(),
                ['<Tab>'] = cmp.mapping.select_next_item(),
                ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-1), { 'i', 'c' }),
                ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(1), { 'i', 'c' }),
                ['<C-e>'] = cmp.mapping {
                    i = cmp.mapping.abort(),
                    c = cmp.mapping.close(),
                },
                ['<C-Space>'] = cmp.mapping.confirm {
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true,
                },
            },
            window = {
                completion = {
                    border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
                    scrollbar = '║',
                },
                documentation = {
                    border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
                    scrollbar = '║',
                },
            },
            formatting = {
                format = lspkind.cmp_format {
                    menu = {
                        nvim_lsp = '[LSP]',
                        path = '[Path]',
                        luasnip = '[LuaSnip]',
                        nvim_lua = '[Lua]',
                        buffer = '[Buffer]',
                    },
                },
            },
            sources = {
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'nvim_lua' },
                { name = 'path' },
                { name = 'buffer' },
            },
            experimental = {
                ghost_text = false,
                native_menu = false,
            },
            sorting = {
                comparators = {
                    cmp.config.compare.offset,
                    cmp.config.compare.exact,
                    cmp.config.compare.recently_used,
                    cmp.config.compare.kind,
                    cmp.config.compare.sort_text,
                    cmp.config.compare.length,
                    cmp.config.compare.order,
                },
            },
        }
        cmp.event:on('confirm_done', require('nvim-autopairs.completion.cmp').on_confirm_done())
    end,
}
