function color(color, transparent)
	transparent = transparent or true
	color = color or "tokyonight-night"

	if color == "tokyonight-night" then
		require('tokyonight').setup({
			transparent_backround = true,
			styles = {
				comments = { italic = false },
				keywords = { italic = false },
			}
		})
	end

	if color == "catppuccin" then
		require('catppuccin').setup({
			flavour = "mocha",
			transparent = true,
			no_italic = true,
			integrations = {
				treesitter = true,
				noice = true,
				notify = true,
				neotree = true,
			}
		})
	end

	vim.cmd.colorscheme(color)

	if transparent then
		vim.api.nvim_set_hl(0, "Normal", {bg="none"})
		vim.api.nvim_set_hl(0, "NormalFloat", {bg="none"})
		vim.api.nvim_set_hl(0, "NormalNC", {bg="none"})
		vim.api.nvim_set_hl(0, "LazyNormal", {bg="#1E1E2E"})
		vim.api.nvim_set_hl(0, "MasonNormal", {bg="#1E1E2E"})
	end
end
