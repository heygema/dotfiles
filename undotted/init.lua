-- ================================ --
-- WELCOME TO MY NVIM CONFIG --
-- ================================ --

vim.opt.termguicolors = false
-- vim.opt.termguicolors = true
vim.wo.number = true
vim.wo.relativenumber = true
vim.o.ma = true
vim.o.mouse = a
vim.o.cursorline = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.autoread = true
vim.o.autoindent = true
vim.o.nu = true 
vim.o.foldlevelstart = 99
vim.o.scrolloff = 7
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
-- use y and p with the system clipboard
vim.o.clipboard = "unnamedplus"
-- vim.g.mapleader = "\\"
-- vim.cmd [[command!  ]]
-- ================================ --
-- PLUGINS --
-- ================================ --
local use = require('packer').use
require('packer').startup(function()
  use {'glepnir/dashboard-nvim'}
  use 'wbthomason/packer.nvim' -- Package manager
  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
  use { 'junegunn/fzf', run = ":call fzf#install()" }
  use { 'junegunn/fzf.vim' }
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use 'joshdick/onedark.vim'
  use 'preservim/nerdtree'
  use 'kyazdani42/nvim-web-devicons'
  use { "catppuccin/nvim", as = "catppuccin" }
  use 'tpope/vim-fugitive'
  use 'scrooloose/nerdcommenter'
  use 'jiangmiao/auto-pairs'
  use('jose-elias-alvarez/null-ls.nvim')
  use('MunifTanjim/prettier.nvim')

  -- language deps
  use 'tomlion/vim-solidity'
  use 'leafgarland/typescript-vim'
  use 'peitalin/vim-jsx-typescript'
  use 'jparise/vim-graphql'
  use 'neovimhaskell/haskell-vim'
  use 'mxw/vim-jsx'
end)

-- ================================ --
-- Custom KeyMaps --
-- ================================ --

local keymap = function(tbl)
	-- Some sane default options
	local opts = { noremap = true, silent = true }
	-- Dont want these named fields on the options table
	local mode = tbl['mode']
	tbl['mode'] = nil
	local bufnr = tbl['bufnr']
	tbl['bufnr'] = nil

	for k, v in pairs(tbl) do
		if tonumber(k) == nil then
			opts[k] = v
		end
	end


	if bufnr ~= nil then
		vim.api.nvim_buf_set_keymap(bufnr, mode, tbl[1], tbl[2], opts)
	else
		vim.api.nvim_set_keymap(mode, tbl[1], tbl[2], opts)
	end
end

local nmap = function(tbl)
	tbl['mode'] = 'n'
	keymap(tbl)
end

local imap = function(tbl)
	tbl['mode'] = 'i'
	keymap(tbl)
end

local example_func = function(a, b)
      print("A is: ", a)
      print("B is: ", b)
end
-- function fuck()
--    vim.api.nvim_command("Rg")
-- end
nmap {"<leader>b", ":enew<CR>"}
nmap {"<leader>e", ":e ~/0/dotfiles/undotted/init.lua<CR>"}
nmap {"<c-l>", ":Files<CR>"}
nmap {"<leader>f", ":Rg<CR>"}
-- buffer config
nmap {"gj", ":bprev<CR>"}
nmap {"gk", ":bnext<CR>"}
nmap {"gq", ":bd<CR>"}
-- nmap {}
-- vim.keymap.set('n', 'C-l', "", {silent=true})
-- vim.keymap.set('n', '<C-l>', ":Files<CR>", {silent = true})
vim.keymap.set('n', '<leader>k', ":let @/=\"\"<CR>", {silent=true})
vim.keymap.set('n', '<leader>g', ":Rg<CR>", {silent = true})
vim.keymap.set('n', '<leader>c', function() print("real lua function") end)
-- ================================ --
-- CUSTOM FUNCTIONS --
-- ================================ --
--
--local JsFzfImport = function()
 --   print("Henlo!")
--end
-- imap {"<c-l>", JsFzfImport()}
vim.keymap.set('i', '<c-l>', function() print("real lua function") end)
-- ================================ --
-- PLUGIN CONFIGS --
-- ================================ --
nmap {"<leader>n", ":NERDTreeFocus<CR>"}
nmap {"<C-n>", ":NERDTree<CR>"}
nmap {"<C-t>", ":NERDTreeToggle<CR>"}
nmap {"<C-f>", ":NERDTreeFind<CR>"}
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
