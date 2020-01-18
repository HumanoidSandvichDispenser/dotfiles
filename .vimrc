set nocompatible              " be iMproved, required

filetype off                  " required

call plug#begin()
Plug 'arcticicestudio/nord-vim'
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'
"Plug 'ap/vim-buftabline'
Plug 'jistr/vim-nerdtree-tabs'
"Plug 'qpkorr/vim-bufkill'

" Discord Rich Presence
Plug 'vbe0201/vimdiscord'
call plug#end()

" set the runtime path to include Vundle and initialize

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" Required for Vundle to run
Plugin 'VundleVim/Vundle.vim'
:
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
Plugin 'sheerun/vim-polyglot'

" Search StackOverflow
Plugin 'hienvd/vim-stackoverflow'

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
set clipboard=unnamedplus
set title
set titlestring="[VIM] %t"

highlight Pmenu ctermfg=15 ctermbg=8
highlight PmenuSel ctermfg=14 ctermbg=NONE
highlight function ctermfg=Yellow
"highlight Keyword ctermfg=Red
syntax on

colorscheme gruvbox

" UltiSnips
let g:UltiSnipsExpandTrigger = "<c-a>"
let g:UltiSnipsJumpForwardTrigger="<c-x>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:indentLine_color_term = 8
let delimitMate_expand_cr = 1
let NERDTreeShowHidden = 1
let NERDTreeMapOpenInTab='<ENTER>'

" Language
let g:vim_markdown_conceal_code_blocks = 1
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_folding_disabled = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_scope_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_concepts_highlight = 1

" YCM
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_filetype_blacklist={'notes': 1, 'unite': 1, 'tagbar': 1, 'pandoc': 1, 'qf': 1, 'vimwiki': 1, 'text': 1, 'infolog': 1, 'mail': 1}

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

" Scrolling
map <S-Down> <C-E>
map <S-Up> <C-Y>
map <ScrollWheelUp> 3<C-Y>
map <ScrollWheelDown> 3<C-E>
map <ScrollWheelLeft> 3<C-H>
map <ScrollWheelRight> 3<C-L>

" Editor shortcuts
map <C-s> :w<CR>
map <C-f> /
map <C-n> :NERDTreeTabsToggle<CR>
nmap <S-Left>  :tabmove -1<CR>
nmap <S-Right> :tabmove +1<CR>
nmap <silent> <C-h> :noh<CR>
noremap <C-q> <C-w><C-w>
noremap <C-w> :tabclose<CR>
noremap <C-t> :tabnew<CR>

" Remappings
noremap <silent> j gj
noremap <silent> k gk
inoremap <C-e> <C-o>A
inoremap jj <Esc>
nnoremap <C-p> :YcmShowDetailedDiagnostic<CR>
nnoremap <Left> :tabprevious<CR>
nnoremap <Right> :tabnext<CR>

" Do not change buffers in NERDTree
autocmd FileType nerdtree noremap <buffer> <Left> <nop>
autocmd FileType nerdtree noremap <buffer> <Right> <nop>
autocmd filetype python nnoremap <F7> :w <bar> exec '!python '.shellescape('%')<CR>
autocmd filetype c nnoremap <F7> :w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd filetype cpp nnoremap <F7> :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>

vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>

set mouse=a

"if !has('gui_running')
"	set t_Co=256
"endif

source ~/local.vimrc
