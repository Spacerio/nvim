return {
	'catppuccin/nvim',
	name = "catppuccin",
	lazy = false,
	priority = 1000,
	config = function()
		local transparent = true,
		require('catppuccin').setup({
			flavour = "mocha",
			transparent_background = true,
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
			}
		})
		vim.cmd.colorscheme("catppuccin")
		if transparent and not vim.g.neovide then
			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalFloat", {bg="#1E1E2E"})
			vim.api.nvim_set_hl(0, "LazyNormal", {bg="#1E1E2E"})
			vim.api.nvim_set_hl(0, "MasonNormal", {bg="#1E1E2E"})
		end
	end
}
