return {
	{
		"RRethy/base16-nvim",
		priority = 1000,
		config = function()
			require('base16-colorscheme').setup({

				base00 = '#1e1e2e',
				base01 = '#181825',
				base02 = '#1e1e2e',
				base03 = '#899388',
				base0B = '#ffee72',
				base04 = '#e1eee0',
				base05 = '#f9fff8',
				base06 = '#f9fff8',
				base07 = '#f9fff8',
				base08 = '#ffb59f',
				base09 = '#ffb59f',
				base0A = '#c0f9bb',
				base0C = '#e0ffdd',
				base0D = '#c0f9bb',
				base0E = '#cfffcb',
				base0F = '#cfffcb',
			})

			local current_file_path = vim.fn.stdpath("config") .. "/lua/plugins/dankcolors.lua"
			if not _G._matugen_theme_watcher then
				local uv = vim.uv or vim.loop
				_G._matugen_theme_watcher = uv.new_fs_event()
				_G._matugen_theme_watcher:start(current_file_path, {}, vim.schedule_wrap(function()
					local new_spec = dofile(current_file_path)
					if new_spec and new_spec[1] and new_spec[1].config then
						new_spec[1].config()
						print("Theme reload")
					end
				end))
			end
		end
	}
}
