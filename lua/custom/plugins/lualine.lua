return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    -- Function that checks if any toggleterm terminals are open
    local function toggleterm_status()
      local ok, term = pcall(require, 'toggleterm.terminal')
      if not ok then
        return ''
      end
      local terminals = term.get_all()
      if #terminals > 0 then
        return ' ' .. #terminals -- terminal icon + count
      end
      return ''
    end

    local function filename_with_parent_dirs()
      local filename = vim.fn.expand '%:t' -- file name only
      local path = vim.fn.expand '%:p:h' -- full path to the file's folder
      local parts = vim.split(path, '/') -- split path into components
      local n = #parts
      local display = filename
      if n >= 2 then
        -- show last two folders + filename
        display = parts[n - 1] .. '/' .. parts[n] .. '/' .. filename
      elseif n == 1 then
        display = parts[1] .. '/' .. filename
      end
      return display
    end
    require('lualine').setup {
      options = {
        theme = 'catppuccin',
        section_separators = { '', '' },
        component_separators = { '', '' },
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diagnostics' },
        lualine_c = { filename_with_parent_dirs },
        lualine_x = {
          'encoding',
          'fileformat',
          'filetype',
          toggleterm_status, -- 👈 Add this here
        },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
      inactive_sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diagnostics' },
        lualine_c = { filename_with_parent_dirs },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
      tabline = {
        lualine_a = { 'filename' },
      },
      extensions = { 'nvim-tree' },
    }
  end,
}
