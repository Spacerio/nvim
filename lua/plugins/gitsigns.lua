return {
	'lewis6991/gitsigns.nvim',
	event = "VeryLazy",
	opts = {
		-- signs = {
		-- 	add = {text = "▎"},
		-- 	change = {text = "▎"},
		-- 	delete = {text = "_"},
		-- 	topdelete = {text = "_"},
		-- 	changedelete = {text = "▎"},
		-- },
		signcolumn = true,
		numhl = true,
		linehl = false,
		word_diff = false,
		watch_gitdir = {
			interval = 1000,
			follow_files = true
		},
		attach_to_untracked = true,
		current_line_blame = false,
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = "right_align",
			delay = 1,
			ignore_whitespace = false,
		},
		trouble = true,
	},
	keys = {
		vim.keymap.set("n", "gk", "<cmd>Gitsigns toggle_current_line_blame<cr>", {silent = true}),
		vim.keymap.set("n", "gK", "<cmd>Gitsigns blame_line<cr>", {silent = true}),
	}
}
