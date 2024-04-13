return {
	{
		"nvim-neorg/neorg",
		dependencies = { "vhyrro/luarocks.nvim", priority = 5000, config = true },
		enabled = false,
		cmd = "Neorg",
		lazy = false,
		version = "*",
		config = true,
		opts = {
			load = {
				["core.defaults"] = {},
				["core.keybinds"] = {
					config = { neorg_leader = "<leader>" }
				},
				["core.concealer"] = {},
				["core.dirman"] = {
					config = {
						workspaces = {
							notes = "~/notes",
						},
						default_workspace = "notes",
					}
				},
			},
			["core.completion"] = { config = { engine = "nvim-cmp", name = "[Norg]" } },
		}
	},
}
