return {
    'L3MON4D3/LuaSnip',
    dependencies = {
        'saadparwaiz1/cmp_luasnip',
        'rafamadriz/friendly-snippets',
    },
    config = function()
        require('luasnip').config.set_config({
            updateevents = "TextChanged,TextChangedI",
            enable_autosnippets = true,
        })
        require('plugins.snippets.load')
    end,
}
