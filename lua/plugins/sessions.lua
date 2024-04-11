return {
	'natecraddock/sessions.nvim',
	lazy = false,
	cmd = "SessionLoad",
	keys = {
		 vim.keymap.set('n', '<leader>q', '<cmd>SessionsSave<cr><cmd>qa!<cr>', {noremap = true, silent = true})
	},
	config = function()
		require("sessions").setup {
			session_filepath = vim.fn.stdpath("data") .. "/sessions",
			absolute = true,
		}
	end,
}
