" Disable compatibility with vi which can cause unexpected issues
set nocompatible

" Enable type file detection. vim will be able to detect the type of file in use
filetype on

" Enable plugins and load plugin for the detected file type
filetype plugin on

" Load an indent file for the detected file type
filetype indent on


" Turn syntax highlighting on
syntax on	"Or syntax enable. Same thing

" Add numbers to each line on the left-hand side.
set number

" Allow the mouse to be used. Blocks copy and paste. Hold shift to be able to
" copy and paste
set mouse=a

" Highlight cursor line underneath the cursor horizontally.
"set cursorline

" Highlight cursor line underneath the cursor vertically
"set cursorcolumn

" Do not save backup files.
"set nobackup

" Do not let cursor scroll below or above N number of lines when scrolling
set scrolloff=10


"Betty vim changes
" Set shift width to 8 spaces
set shiftwidth=8	"in accordance with Betty

" Set tab width to 8 columns
set tabstop=8		"in accordance with Betty

"indent automatically a line depending on the previous one
set autoindent
set smartindent
set cindent

" Convert spaces into tabs
set noexpandtab		"then use :retab! to change the spaces

"Get rid of trailing white space on save/write :w
autocmd BufWritePre * :%s/\s\+$//e

"Use this block to protect files that need trailing white spaces
set wrap
set linebreak
"note trailing space at end of next line
set showbreak=>\ \ \


"Wild Menu
" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx


" #### New ####
" Use to auto close brackets and quotes
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
inoremap ' ''<Left>
inoremap " ""<Left>

" Create the space in between curly brackets
inoremap <expr> <CR> search('{\%#}', 'n') ? "\<CR>\<CR>\<Up>\<C-f>" : "\<CR>"

" Cause screen splits to happen below
set splitbelow

" Let's save undo info to undodir
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo-dir")
    call mkdir($HOME."/.vim/undo-dir", "", 0700)
endif
set undodir=~/.vim/undo-dir

" Save undo history and allow undos when a file is closed
set undofile "creates the undofile beside the files.

" Copy to system register * clipboard
"set clipboard=unnamedplus

" PLUGINS ---------------------------------------------------------------- {{{

" Plugin code goes here.

call plug#begin('~/.vim/plugged')


  Plug 'dense-analysis/ale' "ALE linter

  Plug 'bstevary/betty-in-vim' "Betty linter extension for ALE

  Plug 'preservim/nerdtree' "NerdTree for navigation

  Plug 'tpope/vim-commentary' "use gcc/gc to comment a line/selection

  Plug 'itchyny/lightline.vim'

  Plug 'drewtempelmeyer/palenight.vim'

  Plug 'joshdick/onedark.vim'

  Plug 'rafi/awesome-vim-colorschemes'

  Plug 'catppuccin/vim', { 'as': 'catppuccin' }

call plug#end()

let g:ale_linters = {'c':['betty-style', 'betty-doc', 'gcc']}

" }}}z


" MAPPINGS --------------------------------------------------------------- {{{

" Mappings code goes here.

" }}}


" VIMSCRIPT -------------------------------------------------------------- {{{

" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" More Vimscripts code goes here.


" }}}


" STATUS LINE ------------------------------------------------------------ {{{

" Status bar code goes here.

" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side.
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%

" Show the status on the second to last line.
set laststatus=2

" }}}

" lightline plugin edits:
let g:lightline = {
	\ 'colorscheme': 'rosepine',
	\ }

" Use a line cursor within insert mode and a block cursor everywhere else.
"
" Reference chart of values:
"   Ps = 0  -> blinking block.
"   Ps = 1  -> blinking block (default).
"   Ps = 2  -> steady block.
"   Ps = 3  -> blinking underline.
"   Ps = 4  -> steady underline.
"   Ps = 5  -> blinking bar (xterm).
"   Ps = 6  -> steady bar (xterm).
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"


"Set the background
set background=dark

"Set termguicolors for catpuccin
set termguicolors

"Set your theme or colorscheme
colorscheme catppuccin_mocha



