local theme = require("core/color")
return {
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
	},
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
		'EdenEast/nightfox.nvim',
		lazy = theme.colorscheme ~= "nightfox",
		priority = 1000,
	},
	{
		'navarasu/onedark.nvim',
		lazy = theme.colorscheme ~= "onedark",
		priority = 1000,
	},
	{
		'sainnhe/everforest',
		lazy = theme.colorscheme ~= "everforest",
		priority = 1000,
	},
	{
		'scottmckendry/cyberdream.nvim',
		lazy = theme.colorscheme ~= "cyberdream",
		priority = 1000,
	},
	{
		'sainnhe/edge',
		lazy = theme.colorscheme ~= "edge",
		priority = 1000,
	},
	{
		'rose-pine/neovim',
		name = 'rose-pine',
		lazy = theme.colorscheme ~= "rose-pine",
		priority = 1000,
	},
}
