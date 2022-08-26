-- ================================ --
-- WELCOME TO MY NVIM CONFIG --
-- ================================ --

-- just sample
-- o.termguicolors = true
-- o.syntax = 'on'
-- o.errorbells = false
-- o.smartcase = true
-- o.showmode = false
-- bo.swapfile = false
-- o.backup = false
-- o.undodir = vim.fn.stdpath('config') .. '/undodir'
-- o.undofile = true
-- o.incsearch = true
-- o.hidden = true
-- o.completeopt='menuone,noinsert,noselect'
-- bo.autoindent = true
-- bo.smartindent = true
-- o.tabstop = 2
-- o.softtabstop = 2
-- o.shiftwidth = 2
-- o.expandtab = true
-- wo.number = true
-- wo.relativenumber = true
-- wo.signcolumn = 'yes'
-- wo.wrap = false

vim.o.termguicolors = false
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
vim.o.nu = true 
vim.o.foldlevelstart = 99
vim.o.scrolloff = 7
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
-- use y and p with the system clipboard
vim.o.clipboard = "unnamedplus"
-- vim.g.mapleader = "\\"


-- ================================ --
-- PLUGINS --
-- ================================ --
local use = require('packer').use

require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- Package manager
  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
  use { 'junegunn/fzf', run = ":call fzf#install()" }
  use { 'junegunn/fzf.vim' }
  use 'itchyny/lightline.vim'
  use 'joshdick/onedark.vim'
end)

vim.cmd("colorscheme onedark")

-- ================================ --
-- Custom KeyMaps --
-- ================================ --

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

-- nmap {"<leader>b", ":enew<CR>"}
--
-- vim.keymap.set('n', '<leader>g', vim.api.nvim_command("Rg"))
vim.keymap.set('n', '<leader>g', vim.cmd("Rg"))
vim.keymap.set('n', '<leader>c', function() print("real lua function") end)
