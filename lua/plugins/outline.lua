return {
	'hedyhli/outline.nvim',
	opts = {
		outline_window = {
			auto_close = true,
			show_numbers = true,
			show_relative_numbers = true,
		}
	},
	cmd = "Outline",
	keys = {
		 vim.keymap.set('n', 'go', '<cmd>Outline<cr>')
	}
}
