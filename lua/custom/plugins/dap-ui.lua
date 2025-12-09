return {
  'rcarriga/nvim-dap-ui',
  dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' },
  config = function()
    require('dapui').setup()
    require('nvim-dap-virtual-text').setup()
    local dap, dapui = require 'dap', require 'dapui'
    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end
    local dap = require 'dap'
    local dapui = require 'dapui'

    vim.keymap.set('n', '<leader>bh', function()
      require('dapui').eval()
    end, { desc = 'DAP: Hover variable' })
    -- Toggle DAP UI
    vim.keymap.set('n', '<leader>bu', function()
      dapui.toggle()
    end, { desc = 'DAP UI: Toggle' })

    -- Toggle Breakpoint
    vim.keymap.set('n', '<leader>bb', function()
      dap.toggle_breakpoint()
    end, { desc = 'DAP: Toggle Breakpoint' })

    -- Set Conditional Breakpoint
    vim.keymap.set('n', '<leader>bc', function()
      dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
    end, { desc = 'DAP: Conditional Breakpoint' })

    -- Logpoint
    vim.keymap.set('n', '<leader>bl', function()
      dap.set_breakpoint(nil, nil, vim.fn.input 'Log point message: ')
    end, { desc = 'DAP: Log Point' })

    -- Start/Continue Debugging
    vim.keymap.set('n', '<leader>bs', function()
      dap.continue()
    end, { desc = 'DAP: Start/Continue' })

    -- Step Over
    vim.keymap.set('n', '<leader>bo', function()
      dap.step_over()
    end, { desc = 'DAP: Step Over' })

    -- Step Into
    vim.keymap.set('n', '<leader>bi', function()
      dap.step_into()
    end, { desc = 'DAP: Step Into' })

    -- Step Out
    vim.keymap.set('n', '<leader>bO', function()
      dap.step_out()
    end, { desc = 'DAP: Step Out' })

    -- Terminate Session
    vim.keymap.set('n', '<leader>bx', function()
      dap.terminate()
    end, { desc = 'DAP: Terminate' })

    dapui.setup {
      icons = { expanded = '▾', collapsed = '▸' }, -- cleaner arrows
      mappings = {
        expand = { '<CR>', '<2-LeftMouse>' },
        open = 'o',
        remove = 'd',
        edit = 'e',
        repl = 'r',
      },
      -- Only show essential elements
      layouts = {
        {
          elements = {
            { id = 'scopes', size = 0.6 },
            { id = 'breakpoints', size = 0.4 },
            -- remove 'stacks' and 'watches' if too cluttered
          },
          size = 40, -- width in columns
          position = 'left',
        },
        {
          elements = {
            { id = 'repl', size = 1.0 },
          },
          size = 10, -- height in rows
          position = 'bottom',
        },
      },
      floating = {
        max_height = nil,
        max_width = nil,
        border = 'rounded',
        mappings = {
          close = { 'q', '<Esc>' },
        },
      },
      controls = {
        enabled = true,
        element = 'repl',
        icons = {
          pause = '⏸',
          play = '▶',
          step_into = '↳',
          step_over = '⏭',
          step_out = '↰',
          step_back = 'b',
          run_last = '▶▶',
          terminate = '⏹',
        },
      },
      render = {
        max_type_length = nil, -- don't truncate long variables
      },
    }
  end,
}
