vim.opt.termguicolors = false
-- vim.opt.termguicolors = true
--vim.g.mapleader = " "
vim.wo.number = true
vim.wo.relativenumber = true
--vim.o.ls = 1
--vim.o.ch = 1
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
--
--vim.o.smartcase = true
--
-- fucking legacy vimscript from old vimrc
vim.cmd [[ set foldenable ]]
vim.cmd [[ set ignorecase ]]
vim.cmd [[ set smartcase ]]
vim.cmd [[
if has('folding')
  if has('windows')
    let &fillchars='vert: '           " less cluttered vertical window separators
  endif
  set foldmethod=indent               " not as cool as syntax, but faster
  set foldlevelstart=99               " start unfolded
endif
]]
