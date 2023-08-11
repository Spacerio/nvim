local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

require("orgmode").setup_ts_grammar()

configs.setup({
	auto_install = true,
	ensure_installed = { "rust", "lua", "help", "c", "cpp", }, -- one of "all" or a list of languages
	ignore_install = { "help" }, -- List of parsers to ignore installing
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "markdown" }, -- list of language that will be disabled
		additional_vim_regex_highlighting = {'org'},
	},
	autopairs = {
		enable = true,
	},
	indent = { enable = true, disable = { "css" } },
})

require("orgmode").setup {
}
