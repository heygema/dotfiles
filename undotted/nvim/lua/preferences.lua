-- ================================ --
-- Theme
-- ================================ --
require("catppuccin").setup()
vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
vim.cmd("colorscheme catppuccin")
vim.g.airline_theme='tomorrow'
vim.g['airline#extensions#tabline#enabled'] = 1
-- you can do it like this too
-- vim.cmd [[colorscheme catppuccin]]
