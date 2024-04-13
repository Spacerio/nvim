return {
	'simrat39/symbols-outline.nvim',
	config = function()
		require("symbols-outline").setup({
			auto_close = true,
		})
	end,
	cmd = "SymbolsOutline",
	keys = {
		 vim.keymap.set('n', 'go', '<cmd>SymbolsOutline<cr>')
	}
}
