return {
	settings = {
		Lua = {
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
					-- [vim.fn.stdpath("data") .. "/lazy"] = true,
				}
			}
		}
	}
}
