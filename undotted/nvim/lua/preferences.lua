-- ================================ --
-- Theme
-- ================================ --

--require("catppuccin").setup()
--vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
--vim.cmd("colorscheme catppuccin")

--vim.g.catppuccin_flavour = "mocha"
--vim.cmd("colorscheme catppuccin")

vim.g.airline_theme='catppuccin'
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


-- Some cheat sheet
-- ctrl+w to delete previous words

require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
    transparent_background = false,
    show_end_of_buffer = false, -- show the '~' characters after the end of buffers
    term_colors = false,
    dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
    },
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    color_overrides = {},
    custom_highlights = {},
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        notify = false,
        mini = false,
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
})

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"
