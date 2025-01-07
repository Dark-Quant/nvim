return {
  {
    "mfussenegger/nvim-dap",
    version = "*",
    keys = {
      { "<F5>", function() require("dap").continue() end, desc = "DAP: Continue execution" },
      { "<Leader>b", function() require("dap").toggle_breakpoint() end, desc = "DAP: Add/remove breakpoint into the current line" },
    },
    config = function()
       require'plugins.dap.configs.cpp'
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
        "nvim-dap",
        'williamboman/mason.nvim',
        'jayp0521/mason-nvim-dap.nvim',
        'mfussenegger/nvim-dap-python',
        'nvim-neotest/nvim-nio'
    },
    keys = {
      { "<Leader>dg", function() require("dapui").toggle({}) end, desc = "DAP: Toggle DAP GUI" },
    },
    config = function(_, opts)
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup(opts)
      dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
        -- require'plugins.dap.dapui'
    end,
    opts = {},
  }
}
