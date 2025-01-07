local dap = require('dap')

--[
--[[
cpptools
 ]]
local setupCommands = {
  {
    text = '-enable-pretty-printing',
    description = 'enable pretty printing',
    ignoreFailures = true,
  },
}

dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  command = '/home/egor/.local/share/nvim/mason/bin/OpenDebugAD7',
}
dap.configurations.cpp = {
  {
    name = 'Launch file',
    type = 'cppdbg',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    -- stopAtEntry = true,
    setupCommands = setupCommands,
  },
  {
    name = 'Launch file with args',
    type = 'cppdbg',
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
    stopAtEntry = true,
    setupCommands = setupCommands,
  },

  {
    name = 'Attach to gdbserver :1234',
    type = 'cppdbg',
    request = 'launch',
    MIMode = 'gdb',
    miDebuggerServerAddress = 'localhost:1234',
    miDebuggerPath = '/usr/bin/gdb',
    cwd = '${workspaceFolder}',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    setupCommands = setupCommands,
  },
}

