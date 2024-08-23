local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
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
	indent = { enable = true, disable = { "css" } },
	sync_install = false,
})

require("orgmode").setup {
	org_agenda_files = { '~/notes/*' },
	org_defaoult_notes_file = '~/notes/refile.org'
}
