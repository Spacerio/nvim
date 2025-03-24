local theme = require("core/color")
table.foreach({}, function ()
	
end)
return {
	{
		'AlphaTechnolog/pywal.nvim',
		lazy = theme.colorscheme ~= "pywal",
		priority = 1000,
	},
	{

		"folke/tokyonight.nvim",
		lazy = theme.colorscheme ~= "tokyonight",
		priority = 1000,
		opts = { style = "moon" },
	},
	{
		'catppuccin/nvim',
		name = "catppuccin",
		lazy = theme.colorscheme ~= "catppuccin",
		priority = 1000,
		config = function()
			require('catppuccin').setup({
				flavour = "mocha",
				transparent_background = theme.transparent,
				no_italic = false,
				dim_inactive = {
					enabled = true,
					shade = "dark",
					percentage = 0.15,
				},
				integrations = {
					treesitter = true,
					telescope = true,
					noice = true,
					notify = true,
					neotree = true,
					blink_cmp = true,
					which_key = true,
					flash = true,
				}
			})
		end
	}
}
