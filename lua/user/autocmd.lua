local os = require("os")

local path_to_desktop = os.getenv("USERPROFILE") .. "\\Desktop"


local vim_enter_group = vim.api.nvim_create_augroup("vim_enter_group", { clear = true })

vim.api.nvim_create_autocmd(
    {"VimEnter"},

    { pattern = "*", command = "cd " .. path_to_desktop, group = vim_enter_group }
)
