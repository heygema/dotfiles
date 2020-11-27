" =========
" Gema Anggada's NEOVIM SETUP 
" =========
" Fri Nov  8 10:07:20 2019

" =========
" NOTE: External Dependencies
" fd, ripgrep, fzf, VimPlug
" =========

" =========
" Custom Key mapping DOCUMENTATION
" =========
" <Leader>k -> clear highlighted search result
" <Leader>g -> grep via vim-clap
" <Leader>t -> NERDTree
" <Leader>l -> fuzzy finder with fzf and fd
" <Leader>q -> to go to next git conflict
" <Leader>f -> open ranger vim (in ranger,<c-h> to show dotfiles, @ to enter execute shell command)
" gj, gk -> navigate between buffers <left, right>
" gq -> close current buffer and move to previous one
" =========

" =========
" Useful Plugin Key mapping DOCUMENTATION
" =========
" [x and ]x -> to navigate between conflict from conflict marker 
"
" =========

" First and Foremost
set nocompatible
filetype off

" =========
" PLUGINS
" =========

call plug#begin('~/.nvim/bundle')

" appearances
Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'machakann/vim-highlightedyank'
Plug 'morhetz/gruvbox'

"syntaxes
" Plug 'udalov/kotlin-vim'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'jparise/vim-graphql'
Plug 'neovimhaskell/haskell-vim'
Plug 'rust-lang/rust.vim'
Plug 'mxw/vim-jsx'
" Plug 'pangloss/vim-javascript'

" tools
Plug 'rhysd/git-messenger.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'reasonml-editor/vim-reason-plus'
Plug 'wakatime/vim-wakatime'
Plug 'mattn/emmet-vim'
" fzf just for relative path
Plug '/usr/local/opt/fzf'
Plug 'chmanie/fzf.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }
" NOTE: bclose to fix ranger-vim not being closed after used
Plug 'rbgrouleff/bclose.vim'
" Plug 'qpkorr/vim-bufkill'

" Questionable plugin
" Plug 'tpope/vim-sleuth'
" Plug 'rhysd/conflict-marker.vim'
" Plug 'Shougo/vimproc.vim', {'do' : 'make'}
" Plug 'Shougo/denite.nvim'

" for neovim
if has('nvim')
  let g:python3_host_prog =  "/usr/local/bin/python3"
endif

call plug#end()

filetype plugin indent on

" =========
" GENERAL SETTINGS
" =========

" THEMING
syntax enable
set cursorline
set hlsearch
set incsearch           " do incremental searching
set showmatch           " jump to matches when entering regexp
set ignorecase          " ignore case when searching
set smartcase " no ignorecase if Uppercase char present
set autoread " autoread file
" let g:gruvbox_contrast_light="medium"
set background=dark    " Setting dark mode
let g:gruvbox_contrast_dark="medium"
let g:gruvbox_italic=1
" let g:molokai_original = 1
colorscheme gruvbox

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
nmap <space> za
command! W w
command! Q q
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor
command! Bfno echo bufnr('%')

" Map to resize split panes
map <silent> ˙ <C-w><
map <silent> ˚ <C-W>-
map <silent> ∆ <C-W>+
map <silent> ¬ <C-w>>

" clear searches
noremap <silent> <Leader>k :let @/=""<cr>

" custom commenting
" autocmd FileType *jsx,*js,*ts,*tsx,typescript map <silent> <Leader>c :s/^/\/\/ <cr> <bar> :noh<cr>
" autocmd FileType *jsx,*js,*ts,*tsx,typescript map <silent> <Leader>x :s/^/\/* <cr> <bar> :s/$/ *\/<cr> <bar> :noh<cr>

" Numbering
set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" BUFFERS
" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

nmap <silent> gk :bnext<cr>
nmap <silent> gj :bprevious<cr>
nmap <silent> gcl :BD<cr>
nmap <silent> <leader>b :enew<cr>
" Close the current buffer and move to the previous one
nmap <silent> gq :bp <BAR> bd #<CR>
" Show all open buffers and their status
nmap <leader>bl :ls<CR>

set encoding=UTF-8

" disabled because of sleuth
set autoindent
set smartindent
" show existing tab with 4 spaces width
set tabstop=2
" when indenting with '>', use 4 spaces width
set shiftwidth=2

set mouse=c
set foldenable
set backspace=2
" On pressing tab, insert 4 spaces
set expandtab

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" Go to Merge Conflict by Git
map <silent> <Leader>q /^\(<\{7\}\\|>\{7\}\\|=\{7\}\\|\|\{7\}\)\( \\|$\)<cr>


" =========
" STARTUP
" =========

" function! StartUp()
"     if 0 == argc()
" " whatever at startup
" "       NERDTree
"     end
" endfunction
"
" autocmd VimEnter * call StartUp()

" =========
" EXPORTED FROM WINCENT
" ========

set scrolloff=3                       " start scrolling 3 lines before edge of viewport
set shortmess+=A                      " ignore annoying swapfile messages
set shortmess+=I                      " no splash screen
set shortmess+=O                      " file-read message overwrites previous
set shortmess+=T                      " truncate non-file messages in middle
set shortmess+=W                      " don't echo "[w]"/"[written]" when writing
set shortmess+=a                      " use abbreviations in messages eg. `[RO]` instead of `[readonly]`
set shortmess+=o                      " overwrite file-written messages
set shortmess+=t                      " truncate file messages at start

" regarding swap files
if exists('$SUDO_USER')
  set noswapfile                      " don't create root-owned files
else
  set directory=~/local/.vim/tmp/swap//
  set directory+=~/.vim/tmp/swap//    " keep swap files out of the way
  set directory=$HOME/.vim/tmp//
endif

" folding
if has('folding')
  if has('windows')
    let &fillchars='vert: '           " less cluttered vertical window separators
  endif
  set foldmethod=indent               " not as cool as syntax, but faster
  set foldlevelstart=99               " start unfolded
endif

" never trust vim with syntax enable
if !exists("g:syntax_on")
    syntax enable
endif

" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" =========
" NERDTREE 
" =========

let NERDTreeShowLineNumbers=1
let NERDTreeIgnore = ['\.git', '__pycache__', '\.pyc$', '\.o$', '\.so$', '\.a$', '\.swp', '*\.swp', '\.swo', '\.swn', '\.swh', '\.swm', '\.swl', '\.swk', '\.sw*$', '[a-zA-Z]*egg[a-zA-Z]*', '.DS_Store']
let NERDTreeShowHidden=1
let g:NERDTreeWinPos="left"
let g:NERDTreeDirArrows=0
map <Leader>t :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"

" =========
" Conflict Marker
" =========

" disable the default highlight group
" let g:conflict_marker_enable_mappings = 0
" let g:conflict_marker_highlight_group = ''

" Include text after begin and end markers
" let g:conflict_marker_begin = '^<<<<<<< .*$'
" let g:conflict_marker_end   = '^>>>>>>> .*$'

" highlight ConflictMarkerBegin guibg=#2f7366
" highlight ConflictMarkerOurs guibg=#2e5049
" highlight ConflictMarkerTheirs guibg=#344f69
" highlight ConflictMarkerEnd guibg=#2f628e


" =======
" RUST.VIM
" =======

let g:rustfmt_autosave = 1

" =========
" Haskell Vim
" =========

let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

" =========
" Vim JS
" =========
let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 0

" =========
" Auto-Pairs
" =========

let g:AutoPairsShortcutToggle = ''

" =========
" Prettier
" =========

" disable for marking
" autocmd BufWritePre *.ts,*.js,*.tsx,*.jsx,*.html,*.css :Prettier<cr>

" =========
" COC NVIM
" =========
" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
nmap <silent> gf :Format<cr>

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
" set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
" set shortmess+=c

" always show signcolumns
" set signcolumn=yes

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

function! StatusDiagnostic() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return '' | endif
  let msgs = []
  if get(info, 'error', 0)
    call add(msgs, 'E' . info['error'])
  endif
  if get(info, 'warning', 0)
    call add(msgs, 'W' . info['warning'])
  endif
  return join(msgs, ' '). ' ' . get(g:, 'coc_status', '')
endfunction

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" format also
" nmap <silent> gf <Plug>(coc-format-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Use K to show documentation in preview window
nnoremap <silent> <cr> :call <SID>show_documentation()<CR>
nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <silent> gh :call <SID>show_documentation()<CR>

" Use <c-space> to trigger completion.
" inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.

" =========
" AIRLINE
" =========

" let g:airline#extensions#disable_rtp_load = 1

let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" the path to python3 is obtained through executing `:echo exepath('python3')` in vim
let g:python3_host_prog = "/usr/local/bin/python3"
let g:python_host_prog = "/usr/local/bin/python"
" inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" =========
" FZF
" =========

" nmap <C-f> :GFiles<cr>
" nmap <C-f> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":GFiles\<cr>"

" ignore what's in gitignore
let $FZF_DEFAULT_COMMAND='fd --type f'
inoremap <expr> <C-l> fzf#vim#complete#path_relative('fd')
nnoremap <silent> <expr> <C-l> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Files\<cr>"

" =========
" NERDCOMMENTER
" =========

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1


" =========
" TYPESCRIPT-VIM
" =========

" set filetypes as typescript.tsx for vim jsx typescript
" autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx

" light-grey
" hi tsxTypeBraces guifg=#999999

" dark-grey
" hi tsxTypes guifg=#666666

" --- NORD --- use this with nord theme
" hi tsxTagName guifg=#86bbcc
" hi tsxCloseString guifg=#86bbcc
" hi tsxAttributeBraces guifg=#F99575
" hi tsxEqual guifg=#71A6DC
" hi tsxAttrib guifg=#71A6DC cterm=italic
" --- NORD --- use this with nord theme

" --- GRUVBOX --- use this with gruvbox theme

" tagName
" hi tsxTagName guifg=#E06C75
" hi tsxCloseTagName guifg=#E06C75
" hi tsxCloseTag guifg=#F99575
" hi tsxAttributeBraces guifg=#F99575
" hi tsxEqual guifg=#F99575
" hi tsxAttrib guifg=#F8BD7F cterm=italic

" --- GRUVBOX --- use this with gruvbox theme

" hi ReactState guifg=#C176A7
" hi ReactProps guifg=#D19A66
" hi Events ctermfg=204 guifg=#56B6C2
" hi ReduxKeywords ctermfg=204 guifg=#C678DD
" hi WebBrowser ctermfg=204 guifg=#56B6C2
" hi ReactLifeCycleMethods ctermfg=204 guifg=#D19A66

" =========
" VIM-CLAP
" =========

" Configure to use grep
map <silent> <Leader>g :Clap grep .<cr>
" map <silent> <Leader>xf :Clap files<cr>


" =========
" VIM-CLAP
" =========
let g:git_messenger_no_default_mappings="true"
nmap <C-w>m <Plug>(git-messenger)
