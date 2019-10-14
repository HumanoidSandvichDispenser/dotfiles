set nocompatible              " be iMproved, required

filetype off                  " required

call plug#begin()
Plug 'arcticicestudio/nord-vim'
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
Plugin 'Yggdroot/indentLine'
Plugin 'scrooloose/nerdtree'
Plugin 'itchyny/lightline.vim'
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'valloric/youcompleteme'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
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
highlight Pmenu ctermfg=15 ctermbg=8
highlight PmenuSel ctermfg=14 ctermbg=NONE
syntax on

colorscheme nord

set laststatus=2
"let g:deoplete#enable_at_startup = 1
"let g:neosnippet#enable_completed_snippet = 1
let g:UltiSnipsJumpForwardTrigger="<c-b>"

let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:lightline = { 'colorscheme': 'nord' }

let g:indentLine_color_term=8

let NERDTreeShowHidden=1

map <S-Down> <C-E>
map <S-Up> <C-Y>
map <ScrollWheelUp> <C-Y>
map <S-ScrollWheelUp> <C-U>
map <ScrollWheelDown> <C-E>
map <S-ScrollWheelDown> <C-D>
map <C-n> :NERDTreeToggle<CR>

set mouse=a
highlight Pmenu ctermfg=15 ctermbg=0 guifg=#ffffff guibg=#000000
"if !has('gui_running')
"	set t_Co=256
"endif
