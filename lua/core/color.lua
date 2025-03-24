local M = {}

M.colorscheme = "catppuccin"
M.transparent = false

vim.api.nvim_create_autocmd("User", {
	pattern = "LazyDone",
	callback = function()
		vim.cmd.colorscheme(M.colorscheme)
		if M.transparent then
			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
			-- vim.api.nvim_set_hl(0, "NormalFloat", {bg="#1E1E2E"})
			vim.api.nvim_set_hl(0, "LazyNormal", { bg = "#1E1E2E" })
			vim.api.nvim_set_hl(0, "MasonNormal", { bg = "#1E1E2E" })
		end
		vim.api.nvim_set_hl(0, "FlashLabel", { bg = "#FF00FF" })
	end,
})

M.transparent = M.transparent and not vim.g.neovide

return M
