-- ================================ --
-- PLUGINS --
-- ================================ --
local use = require('packer').use
require('packer').startup(function()
  use {'glepnir/dashboard-nvim'}
  use 'wbthomason/packer.nvim' -- Package manager
  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
  use 'tpope/vim-obsession'
  --use 'ibhagwan/fzf-lua'
  -- optional for icon support
    --requires = { 'kyazdani42/nvim-web-devicons' }
  use { 'junegunn/fzf', run = ":call fzf#install()" }
  use { 'junegunn/fzf.vim' }
  --try telescope sometimes
  --use 'nvim-telescope/telescope.nvim'
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  --use 'joshdick/onedark.vim'
  use 'preservim/nerdtree'
  use 'ryanoasis/vim-devicons'

  --use 'kyazdani42/nvim-web-devicons'
  use { "catppuccin/nvim", as = "catppuccin" }
  use 'tpope/vim-fugitive'
  use 'scrooloose/nerdcommenter'
  use 'jiangmiao/auto-pairs'
  use('jose-elias-alvarez/null-ls.nvim')
  use('MunifTanjim/prettier.nvim')
  use {'nvim-treesitter/nvim-treesitter'}
  use "nvim-lua/plenary.nvim"
  --use 'folke/lsp-colors.nvim'
  use 'rbgrouleff/bclose.vim'
  use 'francoiscabrol/ranger.vim'
  use 'natecraddock/sessions.nvim'
  --use 'yavko/minimap.nvim'


  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin

  -- language deps
  
  use 'preservim/vim-markdown'
  use 'evanleck/vim-svelte'
  use 'tomlion/vim-solidity'
  use 'leafgarland/typescript-vim'
  use 'peitalin/vim-jsx-typescript'
  use 'jparise/vim-graphql'
  use 'neovimhaskell/haskell-vim'
  use 'mxw/vim-jsx'
end)
