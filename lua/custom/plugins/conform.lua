return {
  'stevearc/conform.nvim',
  opts = {},
  config = function()
    require('conform').setup {
      formatters_by_ft = {
        javascript = { 'prettier' },
        typescript = { 'prettier' },
        lua = { 'stylua' },
        json = { 'jq' },
        html = { 'prettier' },
        css = { 'prettier' },
      },
    }
  end,
}
