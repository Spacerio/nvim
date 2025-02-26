-- messes with indentation
-- return {
--     'altermo/ultimate-autopair.nvim',
--     event={'InsertEnter','CmdlineEnter' },
--     branch='v0.6', --recommended as each new version will have breaking changes
--     opts = {
-- 		enabled = true,
--     },
-- }

return {
	'windwp/nvim-autopairs',
	event = "InsertEnter",
	config = true
	-- use opts = {} for passing setup options
	-- this is equivalent to setup{} function
}
