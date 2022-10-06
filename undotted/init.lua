-- ================================ --
-- WELCOME TO MY NVIM CONFIG --
-- ================================ --

require('basic')
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
require('keymaps')

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
-- ================================ --
-- LSP
-- ================================ --

-- all lsp keymap etc
vim.api.nvim_buf_set_keymap(0, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', {noremap = true})
vim.api.nvim_buf_set_keymap(0, 'n', '<c-]>', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true})

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

local lsp = require "lspconfig"
local coq = require "coq"

--require('lspconfig')['pyright'].setup{
    --on_attach = on_attach,
    --flags = lsp_flags,
--}
--
require('lspconfig')['tsserver'].setup{
    coq.lsp_ensure_capabilities{
      on_attach = on_attach,
      flags = lsp_flags,
    }
}

require('lspconfig')['rust_analyzer'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    -- Server-specific settings...
    settings = {
      ["rust-analyzer"] = {}
    }
}


-- prettier
--
local null_ls = require("null-ls")

null_ls.setup({
  on_attach = function(client, bufnr)
    if client.server_capabilities.documentFormattingProvider then
      vim.cmd("nnoremap <silent><buffer> <Leader>[ :lua vim.lsp.buf.formatting()<CR>")

      -- format on save
      vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()")
    end

    if client.server_capabilities.documentRangeFormattingProvider then
      vim.cmd("xnoremap <silent><buffer> <Leader>[ :lua vim.lsp.buf.range_formatting({})<CR>")
    end
  end,
})
