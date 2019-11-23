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
Plugin 'aperezdc/vim-template'
Plugin 'Raimondi/delimitMate'
Plugin 'Yggdroot/indentLine'
Plugin 'scrooloose/nerdtree'
Plugin 'itchyny/lightline.vim'
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'valloric/youcompleteme'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'posva/vim-vue'
Plugin 'pangloss/vim-javascript'
Plugin 'prettier/vim-prettier'
call vundle#end()            " required

filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:

"filetype plugin on

"

" Brief help

" :PluginList       - lists configured plugins

" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate

" :PluginSearch foo - searches for foo; append `!` to refresh local cache

" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

"

" see :h vundle for more details or wiki for FAQ

" Put your non-Plugin stuff after this line

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

highlight Pmenu ctermfg=15 ctermbg=8
highlight PmenuSel ctermfg=14 ctermbg=NONE
highlight function ctermfg=Yellow
"highlight Keyword ctermfg=Red
syntax on

colorscheme gruvbox

let g:UltiSnipsExpandTrigger = "<c-a>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:lightline = { 'colorscheme': 'gruvbox' }
let g:indentLine_color_term = 8
let NERDTreeShowHidden = 1
let delimitMate_expand_cr = 1
let g:vim_markdown_conceal_code_blocks = 0

map <S-Down> <C-E>
map <S-Up> <C-Y>
map <ScrollWheelUp> 3<C-Y>
map <ScrollWheelDown> 3<C-E>
map <ScrollWheelLeft> 3<C-H>
map <ScrollWheelRight> 3<C-L>
map <C-s> :w<CR>
map <C-n> :NERDTreeTabsToggle<CR>
noremap <Left> :bprevious<CR>
noremap <Right> :bnext<CR>
noremap <S-Left> :bprevious<CR>
noremap <S-Right> :bnext<CR>
noremap <C-w> :BD<CR>
noremap <C-t> :enew<CR>
noremap j gj
noremap k gk
inoremap <C-e> <C-o>A
inoremap jj <Esc>

" Do not change buffers in NERDTree
autocmd FileType nerdtree noremap <buffer> <Left> <nop>
autocmd FileType nerdtree noremap <buffer> <Right> <nop>

set mouse=a

"if !has('gui_running')
"	set t_Co=256
"endif

source ~/local.vimrc
