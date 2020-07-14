set nocompatible              " be iMproved, required

filetype off                  " required

call plug#begin()
" ALL PLUGINS

" Themes
Plug 'arcticicestudio/nord-vim'
Plug 'morhetz/gruvbox'

" Templates for new files
Plug 'aperezdc/vim-template'

" Autocomplete (, [, {, ", etc.
"Plug 'Raimondi/delimitMate'

" Show indents
Plug 'Yggdroot/indentLine'

" Project drawer
Plug 'scrooloose/nerdtree'
Plug 'Nopik/vim-nerdtree-direnter'
Plug 'jistr/vim-nerdtree-tabs'

" Status line
Plug 'itchyny/lightline.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-conflicted'

" Autocomplete
"Plug 'valloric/youcompleteme'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Snippets
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'

" Auto tabbing / Alignment
Plug 'godlygeek/tabular'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/goyo.vim'

" Calculator
Plug 'gregsexton/VimCalc'

" Discord Rich Presence
Plug 'vbe0201/vimdiscord'

" Language Support
Plug 'sheerun/vim-polyglot'
Plug 'plasticboy/vim-markdown'
Plug 'lervag/vimtex'

" Search StackOverflow
Plug 'hienvd/vim-stackoverflow'

" Other Utilities
Plug 'ryanoasis/vim-devicons' " Icons for NERDTree
Plug 'psliwka/vim-smoothie' " Smooth scrolling
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'idanarye/vim-vebugger' " Debugger
Plug 'mhinz/vim-startify' " Startup screen

call plug#end()

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
set termguicolors
set cursorline

" Syntax highlighting / theming
colorscheme gruvbox
syntax on

hi! Pmenu ctermfg=15 ctermbg=2 guibg=#303030
hi! PmenuSel ctermfg=14 ctermbg=NONE
hi! function ctermfg=Yellow
hi! Comment cterm=italic

let g:gruvbox_sign_column = "bg0"
let g:gruvbox_italicize_comments = 1
let g:gruvbox_italicize_strings = 1
let g:gruvbox_invert_selection = 0


let g:loaded_python_provider = 0

" UltiSnips
let g:UltiSnipsExpandTrigger = "<c-f>"
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
let g:vimtex_compiler_method = 'latexrun'

" Autocomplete configuration
"let g:ycm_autoclose_preview_window_after_insertion = 1
"let g:ycm_autoclose_preview_window_after_completion = 1
"let g:ycm_filetype_blacklist={'notes': 1, 'unite': 1, 'tagbar': 1, 'pandoc': 1, 'qf': 1, 'vimwiki': 1, 'text': 1, 'infolog': 1, 'mail': 1}
let g:coc_global_extensions = [
\	'coc-snippets',
\	'coc-pairs',
\	'coc-tsserver',
\	'coc-prettier',
\	'coc-clangd',
\	'coc-sh',
\	'coc-python',
\]
highlight CocErrorHighlight ctermfg=1

" Lightline configuration
let g:lightline = { 
\   'colorscheme': 'gruvbox',
\	'active': {
\	   'left': [
\			[ 'mode', 'paste' ],
\			[ 'gitbranch', 'readonly', 'filename', 'modified' ]
\		] 
\	},
\
\	'separator': {
\  		'left': '', 'right': ''
\	},
\
\	'subseparator': {
\	   'left': '', 'right': ''
\	},
\	
\	'tabline': {
\		'left': [ [ 'tabs' ] ],
\		'right': [ [ 'close' ] ] 
\	},
\
\	'tab': {
\		'active': [ 'filetypeicon', 'filename', 'modified' ],
\		'inactive': [ 'tabnum', 'filename', 'modified' ]
\	},
\
\   'component_function': {
\		'gitbranch': 'LightlineFugitive',
\		'filetype': 'MyFiletype',
\		'fileformat': 'MyFileformat',
\		'readonly': 'LightlineReadonly',
\   },
\
\	'tab_component_function': {
\		'filetypeicon': 'LightlineFileicon',
\		'readonly': 'LightlineReadonly',
\		'gitbranch': 'LightlineFugitive',
\		'modified': 'LightlineModified'
\	}
\}
"let g:webdevicons_enable_lightline = 1

" Startify
let g:startify_bookmarks = [
\	{ 'v': '$DOTFILES/.vimrc' },
\	{ 'z': '$DOTFILES/.zshrc' },
\]
let g:startify_custom_header = startify#fortune#cowsay('', '─','│','╭','╮','╯','╰')
let g:webdevicons_enable_startify = 1
highlight StartifyHeader ctermfg=7

" Scrolling
let g:smoothie_base_speed = 10

map <S-Down> <C-E>
map <S-Up> <C-Y>
map <ScrollWheelUp> 3<C-Y>
map <ScrollWheelDown> 3<C-E>
map <ScrollWheelLeft> 3zh
map <ScrollWheelRight> 3zl

" Editor shortcuts
map <C-s> :w<CR>
map <silent> ` :VBGtoggleBreakpointThisLine<CR>
map <silent> <S-`> :VBGclearBreakpints<CR>
nmap <S-Left>  :tabmove -1<CR>
nmap <S-Right> :tabmove +1<CR>
nmap <silent> <C-/> :noh<CR>
noremap <C-q> <C-w><C-w>
noremap <C-w> :tabclose<CR>
noremap <C-t> :tabnew<CR>
noremap <silent> <Esc><Esc> :Startify<CR>

" Remappings
nmap ; :
noremap <silent> j gj
noremap <silent> k gk
inoremap jj <Esc>

" Emacs
imap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-BS> <C-W>

" Plugin Shortcuts
map <silent> <C-n> :NERDTreeTabsToggle<CR>
nnoremap m :Goyo 75%x100%-4<CR>
nnoremap M :Goyo!<CR>
nnoremap <Left> :tabprevious<CR>
nnoremap <Right> :tabnext<CR>
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Autocommands
autocmd FileType nerdtree noremap <buffer> <Left> <nop>
autocmd FileType nerdtree noremap <buffer> <Right> <nop>
autocmd FileType python nnoremap <F7> :w <bar> exec '!python '.shellescape('%')<CR>
autocmd FileType c nnoremap <F7> :w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd FileType cpp nnoremap <F7> :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd FileType tex nnoremap <F7> :VimtexCompile<CR>
autocmd InsertEnter * set conceallevel=0
autocmd InsertLeave * set conceallevel=1
autocmd User Startified setlocal cursorline

vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>

set mouse=a

"if !has('gui_running')
"	set t_Co=256
"endif

" Functions
function! MyFiletype()
	return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
	return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

function! LightlineFileicon(n)
	let buflist = tabpagebuflist(a:n)
	let winnr = tabpagewinnr(a:n)
	return WebDevIconsGetFileTypeSymbol(expand('#'.buflist[winnr - 1].':p'))
endfunction

function! LightlineModified(n)
	return lightline#tab#modified(a:n) == '+' ? '' : ''
endfunction

function! LightlineReadonly()
		return &readonly ? '' : ''
endfunction

function! LightlineFugitive()
	if exists('*FugitiveHead')
		let branch = FugitiveHead()
		return branch !=# '' ? ' '.branch : ''
	endif
	return ''
endfunction

source ~/local.vimrc
