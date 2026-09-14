local dap = require('dap')

dap.adapters.codelldb = {
  type = 'server',
  port = '${port}',
  executable = {
    command = '/home/egor/.local/share/nvim/mason/bin/codelldb',
    args = { '--port', '${port}' },
  },
}

dap.configurations.cpp = {
  {
    name = 'Launch file',
    type = 'codelldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
  },
  {
    name = 'Launch file with args',
    type = 'codelldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    args = function()
      local args = {}
      local args_string = vim.fn.input('Args: ')
      for word in args_string:gmatch('%S+') do
        table.insert(args, word)
      end
      return args
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = true,
  },
  {
    name = 'Attach to process',
    type = 'codelldb',
    request = 'attach',
    pid = function()
      return vim.fn.input('PID: ')
    end,
    cwd = '${workspaceFolder}',
  },
}