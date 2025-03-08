vim.o.makeprg = "dotnet run &";
-- vim.keymap.set('n', '<cr>', '<cmd>make<cr>', require("core.remap").opts)
require("core.remap").BindMake()
