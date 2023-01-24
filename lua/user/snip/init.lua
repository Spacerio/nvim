local ls = require('luasnip')

ls.config.set_config({
	region_check_events = 'InsertEnter',
	delete_check_events = 'InsertLeave'
})

require('luasnip.loaders.from_vscode').lazy_load()
<<<<<<< HEAD
<<<<<<< Updated upstream
=======
require('luasnip.loaders.from_lua').lazy_load {
	paths = "./lua/user/snip/snippets"
}
>>>>>>> Stashed changes
=======
require('luasnip.loaders.from_lua').lazy_load({paths = "./snippets"})
>>>>>>> 953c196... Add snippets folder
