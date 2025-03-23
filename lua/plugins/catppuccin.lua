return { -- TODO: figure out a better way to manage colorschemes
	'catppuccin/nvim',
	name = "catppuccin",
	lazy = false,
	priority = 1000,
	config = function()
		local transparent = false
		transparent = transparent and not vim.g.neovide
		require('catppuccin').setup({
			flavour = "mocha",
			transparent_background = transparent,
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
		vim.cmd.colorscheme("catppuccin")
		if transparent then
			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalFloat", {bg= "none" })
			-- vim.api.nvim_set_hl(0, "NormalFloat", {bg="#1E1E2E"})
			vim.api.nvim_set_hl(0, "LazyNormal", {bg="#1E1E2E"})
			vim.api.nvim_set_hl(0, "MasonNormal", {bg="#1E1E2E"})
		end
		vim.api.nvim_set_hl(0, "FlashLabel", { bg = "#FF00FF" })
	end
}
