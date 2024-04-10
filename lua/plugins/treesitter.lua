local config = function()
	local ts = require("nvim-treesitter.configs")

	ts.setup({
		auto_install = true,
		ensure_installed = { "rust", "lua", "help", "c", "cpp", "org", }, -- one of "all" or a list of languages
		ignore_install = { "help" }, -- List of parsers to ignore installing
		highlight = {
			enable = true, -- false will disable the whole extension
			-- disable = { "markdown" }, -- list of language that will be disabled
			additional_vim_regex_highlighting = {'org'},
		},
		autopairs = {
			enable = true,
		},
		indent = { 
			enable = true,
			disable = { "css" }
		},
		textobjects = {
			select = {
				enable = true,
				lookahead = true,
				keymaps = {
					["af"] = { query = "@function.outer", desc = "outer function" },
					["if"] = { query = "@function.inner", desc = "inner function" },
					["aa"] = { query = "@parameter.outer", desc = "outer argument/parameter" },
					["ia"] = { query = "@parameter.inner", desc = "inner argument/parameter" },
					["ac"] = { query = "@class.outer", desc = "outer class" },
					["ic"] = { query = "@class.inner", desc = "inner class" },
				},
			},
		},
		sync_install = false,
	})
end

return {
	'nvim-treesitter/nvim-treesitter',
	build = ":TSUpdate",
	event = 'VeryLazy',
	config = config,
	dependencies = {
		{
			"nvim-orgmode/orgmode",
			"nvim-treesitter/nvim-treesitter-textobjects",
			{
				'windwp/nvim-autopairs',
				config = true,
				opts = { map_c_h = true, map_c_w = true }
			}
		}
	}
}
