return {
  'shortcuts/no-neck-pain.nvim',
  opts = {},
  config = function()
    require('no-neck-pain').setup {
      buffers = {
        -- Enable/disable No Neck Pain for specific buffer types
        -- See `:help buftype` for more info
        exclude_buftypes = { 'terminal', 'prompt', 'nofile', 'quickfix' },
        -- Enable/disable No Neck Pain for specific file types
        -- See `:help filetype` for more info
        exclude_filetypes = { 'TelescopePrompt', 'Trouble', 'lazy', 'mason', 'toggleterm' },
      },
      width = 195, -- The maximum width of the window
      autocmds = {
        enableOnVimEnter = true, -- Enable No Neck Pain when Vim is started
        enable_on_buf_read = false, -- Enable No Neck Pain when a buffer is read (e.g. `:e some_file`)
        disable_on_insert = false, -- Disable No Neck Pain when entering insert mode
        restore_on_quit = true, -- Restore window layout when quitting last No Neck Pain window
      },
      -- Set to true to save and restore the cursor column position
      -- when enabling/disabling No Neck Pain
      preserve_cursor_column = false,
      -- Callback function that is executed when enabling/disabling No Neck Pain
      -- on_enable = function() end,
      -- on_disable = function() end,
    }
  end,
}
