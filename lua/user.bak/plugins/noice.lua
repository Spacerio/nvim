require('noice').setup({
	lsp = {
		progress = {
			view = "mini"
		},
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true,
		},
	},
	presets = {
		bottom_search = false,
		command_palette = false,
		long_message_to_split = true,
	},
	notify = {
		enabled = true,
		view = "notify"
	},
	messages = {
		view_search = "mini"
	},
})
