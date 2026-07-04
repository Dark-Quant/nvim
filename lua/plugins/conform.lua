return {
    'stevearc/conform.nvim',
    event = "BufWritePre",
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            python = { "isort", "black" },
            javascript = { "prettier" },
            typescript = { "prettier" },
            javascriptreact = { "prettier" },
            typescriptreact = { "prettier" },
            json = { "prettier" },
            html = { "prettier" },
            css = { "prettier" },
            go = { "gofumpt", "goimports" },
        },
        format_on_save = {
            lsp_fallback = true,
            timeout_ms = 500,
        },
    },
    init = function()
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
}
