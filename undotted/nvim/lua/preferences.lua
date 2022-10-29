-- ================================ --
-- Theme
-- ================================ --
require("catppuccin").setup()
vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
vim.cmd("colorscheme catppuccin")
vim.g.airline_theme='tomorrow'
vim.g['airline#extensions#tabline#enabled'] = 1
-- you can do it like this too
-- vim.cmd [[colorscheme catppuccin]]

-- minimap
--vim.g.minimap_width = 10
--vim.g.minimap_auto_start = 1
--vim.g.minimap_auto_start_win_enter = 1

-- for nerd font
--vim.cmd [[ set guifont=JetBrainsMono\ Nerd\ Font:h20 ]]
--
vim.cmd [[ let g:airline_powerline_fonts = 1 ]]
vim.cmd [[ let g:WebDevIconsUnicodeDecorateFolderNodes=1 ]]
--vim.cmd [[ set formatoptions-=cro ]]
