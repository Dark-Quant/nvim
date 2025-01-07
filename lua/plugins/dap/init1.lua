return {
    'mfussenegger/nvim-dap',
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'williamboman/mason.nvim',
      'jayp0521/mason-nvim-dap.nvim',
      'mfussenegger/nvim-dap-python',
      'nvim-neotest/nvim-nio',
    },
    keys = {
      { "<Leader>dg", function() require("dapui").toggle({}) end, desc = "DAP: Toggle DAP GUI" },
    },
    config = function()
        local dap = require('dap')

        --[[
        SIGNS CONFIGURATION
         ]]
        vim.fn.sign_define('DapBreakpoint', { text = '🔴', texthl = '', linehl = '', numhl = '' })
        vim.fn.sign_define('DapStopped', { text = '➡️', texthl = '', linehl = '', numhl = '' })

        --[[
        Languages configurations
         ]]

        require('plugins.dap.configs.cpp')
        -- Use cpp config for Rust and C
        dap.configurations.c = dap.configurations.cpp
        dap.configurations.rust = dap.configurations.cpp


        require('plugins.dap.dapui')
    end,
}
