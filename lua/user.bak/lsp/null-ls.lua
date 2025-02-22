local null_ls = require("null-ls")
local code_actions = null_ls.builtins.code_actions

local formatting = null_ls.builtins.formatting
local hover = null_ls.builtins.hover

local sources = {
	formatting.stylua.with({
		extra_args = { "--config-path ~/.stylua.toml" },
	}),
	formatting.prettier,
}

null_ls.setup({
	sources = sources,
})
