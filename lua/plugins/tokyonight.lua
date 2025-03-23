local theme = require("core/color")
return {
	"folke/tokyonight.nvim",
	lazy = theme.colorscheme ~= "tokyonight",
	opts = { style = "moon" },
}
