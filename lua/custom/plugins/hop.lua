return {
  'smoka7/hop.nvim',
  config = function()
    require('hop').setup()
    vim.keymap.set('n', '<leader>w', function()
      require('hop').hint_words { current_line_only = true, keys = 'jmklnhueyio,.' }
    end)
  end,
}
