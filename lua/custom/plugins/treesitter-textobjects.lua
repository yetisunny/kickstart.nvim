return {
  'nvim-treesitter/nvim-treesitter-textobjects',
  after = 'nvim-treesitter',
  requires = 'nvim-treesitter/nvim-treesitter',
  config = function()
    if not pcall(require, 'nvim-treesitter.configs') then
      return
    end
    require('nvim-treesitter.configs').setup {
      textobjects = {
        select = {
          enable = true,
          lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ['ai'] = '@conditional.outer',
            ['ii'] = '@conditional.inner',
            -- Additional helpful mappings for Python
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',
          },
        },
      },
    }
  end,
}
