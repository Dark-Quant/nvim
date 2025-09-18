return {
    "frabjous/knap",
    ft = { "tex", "markdown" },
    config = function()
        local g = vim.g

        g.knap_settings = {
            texoutputext = "pdf",
            textopdfviewerlaunch = "zathura %outputfile%",
            textopdfviewerrefresh = "pkill -HUP -f 'zathura.*%outputfile%'",
            delay = 10
        }

        -- горячие клавиши
        local opts = { noremap = true, silent = true }
        vim.keymap.set('n', '<leader>kp', function() require("knap").toggle_autopreviewing() end, opts) -- вкл/выкл live preview
        vim.keymap.set('n', '<leader>kb', function() require("knap").process_once() end, opts)         -- однократная компиляция
        vim.keymap.set('n', '<leader>kv', function() require("knap").forward_jump() end, opts)        -- синхронизация PDF ↔ TeX
    end,
}
