# base_vimrc
My first vimrc file. Will be updated over time

## Setup

### Create .vimrc in home directory
```shell
vi .vimrc
```

### Create vim file tree
```shell
mkdir -p ~/.vim ~/.vim/autoload ~/.vim/backup ~/.vim/colors ~/.vim/plugged
```

---

## Different sets
### Vimrc Starter lines 

```vimrc
" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on
```


### Useful commands
```
" Turn syntax highlighting on
syntax on	"Or syntax enable. Same thing

" Add numbers to each line on the left-hand side.
set number

" Allow the mouse to be used
set mouse=a

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Highlight cursor line underneath the cursor vertically
"set cursorcolumn

" Do not let cursor scroll below or N number of lines when scrolling
set scrolloff=10

```

### Commands for Betty

```
"Betty vim changes
" Set shift width to 4 spaces
set shiftwidth=8	"in accordance with Betty

" Set tab width to 4 columns
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
```

---

## Add color-schemes

First navigate to ~/.vim/colors 
```bash
cd ~/.vim/colors
```

Then download the color-scheme or theme

```bash
curl -o molokai.vim https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim
```

Use  `:colorscheme molokai` to change the colorscheme. You can do that straight up in the vimrc file.

---

## Wild menu???
```vimrc
" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
```

---

## Organize Vimrc

### Basic Structure
```vimrc
" PLUGINS ---------------------------------------------------------------- {{{

" Plugin code goes here.

" }}}


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

" }}}
```

Use `:source ~/.vimrc`

`zo` to open a single fold under the cursor.

`zc` to close the fold under the cursor.

`zR` to open all folds.

`zM` to close all folds.

---

## Adding plugins

### Installing vim-plug
Vim-plug github: https://github.com/junegunn/vim-plug

Linux & Mac
```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Windows powershell
```powershell
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni $HOME/vimfiles/autoload/plug.vim -Force
```

Vim-plug github: https://github.com/junegunn/vim-plug
Ale github: https://github.com/dense-analysis/ale
Nerdtree github: https://github.com/preservim/nerdtree

```
" PLUGINS ---------------------------------------------------------------- {{{

call plug#begin('~/.vim/plugged')


  Plug 'dense-analysis/ale'

  Plug 'preservim/nerdtree'

  Plug 'bstevary/betty-in-vim'  

call plug#end()

" }}}
```

Use `:source ~/.vimrc` to effect changes

`:PlugInstall` to download and install plugins

### NERDTree

NERDtree github: https://github.com/preservim/nerdtree

Use `:NERDTree` to open up the tree list. `?` for help.

### ALE
ALE github: https://github.com/dense-analysis/ale

---

## Configure the Status Bar

```vimrc
" STATUS LINE ------------------------------------------------------------ {{{

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
```

`%F` – Display the full path of the current file.

`%M` – Modified flag shows if file is unsaved.

`%Y` – Type of file in the buffer.

`%R` – Displays the read-only flag.

`%b` – Shows the ASCII/Unicode character under cursor.

`0x%B` – Shows the hexadecimal character under cursor.

`%l` – Display the row number.

`%c` – Display the column number.

`%p%%` – Show the cursor percentage from the top of the file.

---

## Get rid of spaces
`%s/    /^I/g`

`:s/<search_phrase>/<replace_phrase>/options`




