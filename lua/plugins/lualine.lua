return {
    "nvim-lualine/lualine.nvim",
    build = "make install_jsregexp",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("lualine").setup()
    end,
}
