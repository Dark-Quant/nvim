return {
    "SirVer/ultisnips",
    -- load UltiSnips when entering Insert mode or when a snippet needs to be expanded
    event = { 'InsertEnter', 'CmdlineEnter' },
    -- or maybe even earlier: BufReadPre, depending on your needs
    --
    config = function ()
        vim.g.UltiSnipsSnippetDirectories = {"UltiSnips", "my_snippets"} -- свои сниппеты
        vim.g.UltiSnipsExpandTrigger = "<tab>"
        vim.g.UltiSnipsJumpForwardTrigger = "<tab>"
        vim.g.UltiSnipsJumpBackwardTrigger = "<s-tab>"
        vim.g.UltiSnipsEditSplit = "vertical"   
    end
}
