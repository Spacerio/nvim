return {
	'folke/trouble.nvim',
	cmd = "Trouble",
	branch = "dev",
	config = function()
		require("trouble").setup({
			focus = true,
			follow = true,
			modes = {
				show = {
					mode = "diagnostics",
					preview = {
						type = "split",
						relative = "win",
						position = "right",
						size = 0.3,
					},
				},
			},
		})
	end,
	keys = {
		{ "gl", "<cmd>Trouble show toggle<cr>", silent = true, noremap = true},
	}
}

-- for lsp_document_symbols
-- Array         = " ",
-- Boolean       = "󰨙 ",
-- Class         = " ",
-- Constant      = "󰏿 ",
-- Constructor   = " ",
-- Enum          = " ",
-- EnumMember    = " ",
-- Event         = " ",
-- Field         = " ",
-- File          = " ",
-- Function      = "󰊕 ",
-- Interface     = " ",
-- Key           = " ",
-- Method        = "󰊕 ",
-- Module        = " ",
-- Namespace     = "󰦮 ",
-- Null          = " ",
-- Number        = "󰎠 ",
-- Object        = " ",
-- Operator      = " ",
-- Package       = " ",
-- Property      = " ",
-- String        = " ",
-- Struct        = "󰆼 ",
-- TypeParameter = " ",
-- Variable      = "󰀫 ",
