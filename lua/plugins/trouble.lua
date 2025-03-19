return {
	'folke/trouble.nvim',
	cmd = { "Trouble", "TroubleToggle" },
	opts = {
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
	},
	keys = {
		-- TODO: add leader binds for other functions
		{ "gl", "<cmd>Trouble diagnostics toggle<cr>", silent = true, noremap = true},
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
