return {
  { 'akinsho/toggleterm.nvim', version = '*', config = true ,config=function ()
-- ToggleTerm setup
require("toggleterm").setup({
  size = 20,
  open_mapping = [[<leader>tt]],  -- open terminal with leader + t
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  direction = "float",  -- open in floating window
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = {
    border = "curved",  -- other options: 'single', 'double', 'shadow', etc.
    winblend = 5,
  },
})
  end},
}
