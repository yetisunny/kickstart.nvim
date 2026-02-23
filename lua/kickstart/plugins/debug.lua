return {
  'mfussenegger/nvim-dap',
  lazy = false,
  dependencies = {
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',
    'leoluz/nvim-dap-go',
  },

  config = function()
    local dap = require 'dap'

    require('mason-nvim-dap').setup {
      automatic_installation = true,
      handlers = {},
      ensure_installed = {
        'delve',
        'debugpy',
      },
    }

    require('dap-go').setup {
      delve = {
        detached = vim.fn.has 'win32' == 0,
      },
    }

    vim.keymap.set('n', '<leader>bc', dap.continue,          { desc = 'DAP: Continue/Start' })
    vim.keymap.set('n', '<leader>bb', dap.toggle_breakpoint,  { desc = 'DAP: Toggle Breakpoint' })
    vim.keymap.set('n', '<leader>bR', dap.restart,            { desc = 'DAP: Restart' })
    vim.keymap.set('n', '<leader>bx', dap.terminate,          { desc = 'DAP: Terminate' })
    vim.keymap.set('n', '<leader>bo', dap.step_over,          { desc = 'DAP: Step Over' })
    vim.keymap.set('n', '<leader>bi', dap.step_into,          { desc = 'DAP: Step Into' })
    vim.keymap.set('n', '<leader>bO', dap.step_out,           { desc = 'DAP: Step Out' })
    vim.keymap.set('n', '<leader>bC', function()
      dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
    end, { desc = 'DAP: Conditional Breakpoint' })
  end,
}
