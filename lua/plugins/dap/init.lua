return {
  {
    "mfussenegger/nvim-dap",
    version = "*",
    keys = {
      { "<F5>", function() require("dap").continue() end, desc = "DAP: Continue" },
      { "<F3>", function() require("dap").terminate() end, desc = "DAP: Terminate" },
      { "<F10>", function() require("dap").step_over() end, desc = "DAP: Step over" },
      { "<F11>", function() require("dap").step_into() end, desc = "DAP: Step into" },
      { "<F12>", function() require("dap").step_out() end, desc = "DAP: Step out" },
      { "<Leader>b", function() require("dap").toggle_breakpoint() end, desc = "DAP: Toggle breakpoint" },
    },
    config = function()
      require('plugins.dap.configs.cpp')
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "williamboman/mason.nvim",
      "jayp0521/mason-nvim-dap.nvim",
      "mfussenegger/nvim-dap-python",
      "nvim-neotest/nvim-nio",
    },
    keys = {
      { "<Leader>dg", function() require("dapui").toggle({}) end, desc = "DAP: Toggle UI" },
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup({
        force_buffers = true,
        icons = { expanded = '', collapsed = '', current_frame = '' },
        mappings = {
          expand = { '<CR>', '<2-LeftMouse>' },
          open = 'o',
          remove = 'd',
          edit = 'e',
          repl = 'r',
          toggle = 't',
        },
        layouts = {
          {
            elements = {
              { id = 'scopes', size = 0.25 },
              'breakpoints',
              'stacks',
              'watches',
            },
            size = 40,
            position = 'left',
          },
          {
            elements = { 'repl', 'console' },
            size = 0.25,
            position = 'bottom',
          },
        },
        controls = {
          enabled = true,
          element = 'repl',
          icons = {
            pause = '',
            play = '',
            step_into = '',
            step_over = '',
            step_out = '',
            step_back = '',
            run_last = '',
            terminate = '',
          },
        },
        floating = {
          max_height = nil,
          max_width = nil,
          border = 'single',
          mappings = { close = { 'q', '<Esc>' } },
        },
        render = {
          indent = 1,
          max_value_lines = 100,
        },
      })

      vim.fn.sign_define('DapBreakpoint', { text = '🔴', texthl = '', linehl = '', numhl = '' })

      dap.listeners.after.event_initialized['dapui_config'] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated['dapui_config'] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited['dapui_config'] = function()
        dapui.close()
      end
    end,
  },
}
