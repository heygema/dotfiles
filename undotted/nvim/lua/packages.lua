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
  use 'ms-jpq/coq_nvim'
  use {'nvim-treesitter/nvim-treesitter'}
  use "nvim-lua/plenary.nvim"

  -- language deps
  use 'tomlion/vim-solidity'
  use 'leafgarland/typescript-vim'
  use 'peitalin/vim-jsx-typescript'
  use 'jparise/vim-graphql'
  use 'neovimhaskell/haskell-vim'
  use 'mxw/vim-jsx'
end)
