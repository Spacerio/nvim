return {
	'catppuccin/nvim',
	name = "catppuccin",
	lazy = false,
	priority = 1000,
	config = function()
		require('catppuccin').setup({
			flavour = "mocha",
			transparent = true,
			no_italic = false,
			integrations = {
				treesitter = true,
				noice = true,
				notify = true,
				neotree = true,
			}
		})
		vim.cmd.colorscheme("catppuccin")
	end
}
