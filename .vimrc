set nocompatible              " be iMproved, required

filetype off                  " required

call plug#begin()
Plug 'arcticicestudio/nord-vim'
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'
Plug 'ap/vim-buftabline'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'qpkorr/vim-bufkill'
"Plug 'wokalski/autocomplete-flow'
"Plug 'Shougo/deoplete.nvim'
"Plug 'roxma/nvim-yarp'
"Plug 'roxma/vim-hug-neovim-rpc'
"Plug 'Shougo/neosnippet-snippets'
"Plug 'Shougo/neosnippet'
call plug#end()

" set the runtime path to include Vundle and initialize

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" Required for Vundle to run
Plugin 'VundleVim/Vundle.vim'

" Templates for new files
Plugin 'aperezdc/vim-template'

" Autocomplete (, [, {, ", etc.
Plugin 'Raimondi/delimitMate'

" Show indents
Plugin 'Yggdroot/indentLine'

" Project drawer
Plugin 'scrooloose/nerdtree'

" Status line
Plugin 'itchyny/lightline.vim'

" Git
Plugin 'tpope/vim-fugitive'

" Autocomplete
Plugin 'valloric/youcompleteme'

" Snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" Auto tabbing / Alignment
Plugin 'godlygeek/tabular'
Plugin 'junegunn/vim-easy-align'

" Kill buffers without closing splits
Plugin 'qpkorr/vim-bufkill'

" Calculator
Plugin 'gregsexton/VimCalc'

" Discord Rich Presence
Plugin 'vbe0201/vimdiscord'

" Language Support
Plugin 'plasticboy/vim-markdown'
Plugin 'posva/vim-vue'
Plugin 'pangloss/vim-javascript'
Plugin 'prettier/vim-prettier'
Plugin 'octol/vim-cpp-enhanced-highlight'
call vundle#end()            " required

filetype plugin indent on    " required

set ruler
set number
set showcmd
set encoding=utf-8
set laststatus=2
set tabstop=4
set shiftwidth=4
set noshowmode
set linebreak
set breakindent
set timeoutlen=250
set hidden
set title
set titlestring="[VIM] %t"

highlight Pmenu ctermfg=15 ctermbg=8
highlight PmenuSel ctermfg=14 ctermbg=NONE
highlight function ctermfg=Yellow
"highlight Keyword ctermfg=Red
syntax on

colorscheme gruvbox

let g:UltiSnipsExpandTrigger = "<c-a>"
let g:UltiSnipsJumpForwardTrigger="<c-x>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:indentLine_color_term = 8
let NERDTreeShowHidden = 1
let delimitMate_expand_cr = 1
"let g:vim_markdown_conceal_code_blocks = 1
let g:vim_markdown_folding_disabled = 1

let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1

" Lightline Config
let g:lightline = { 
\   'colorscheme': 'gruvbox',
\	'active': {
\   'left':[ [ 'mode', 'paste' ],
\       [ 'gitbranch', 'readonly', 'filename', 'modified' ] ] 
\	},
\   'component_function': {
\       'gitbranch': 'fugitive#head',
\   }
\}
let g:lightline.separator = {
	\   'left': '', 'right': ''
\}
let g:lightline.subseparator = {
	\   'left': '', 'right': ''
\}

map <S-Down> <C-E>
map <S-Up> <C-Y>
map <ScrollWheelUp> 3<C-Y>
map <ScrollWheelDown> 3<C-E>
map <ScrollWheelLeft> 3<C-H>
map <ScrollWheelRight> 3<C-L>
map <C-s> :w<CR>
map <C-n> :NERDTreeTabsToggle<CR>
noremap <C-Q> <C-W><C-W>
noremap <Left> :bprevious<CR>
noremap <Right> :bnext<CR>
noremap <C-w> :BD<CR>
noremap <C-t> :enew<CR>
noremap j gj
noremap k gk
inoremap <C-e> <C-o>A
inoremap jj <Esc>
nnoremap <C-p> :YcmShowDetailedDiagnostic<CR>

" Do not change buffers in NERDTree
autocmd FileType nerdtree noremap <buffer> <Left> <nop>
autocmd FileType nerdtree noremap <buffer> <Right> <nop>
autocmd filetype python nnoremap <F7> :w <bar> exec '!python '.shellescape('%')<CR>
autocmd filetype c nnoremap <F7> :w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd filetype cpp nnoremap <F7> :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>

set mouse=a

"if !has('gui_running')
"	set t_Co=256
"endif

source ~/local.vimrc
