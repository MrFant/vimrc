" =========================="
" 1. Vundle setting
" =========================="
set nocompatible              " required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tmhedberg/SimpylFold' 
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
if has('gui_running')
    set background=dark
    colorscheme solarized
else
"    colorscheme Zenburn
endif
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

Plugin 'jistr/vim-nerdtree-tabs'
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

let python_highlight_all=1
"
" " Add all your plugins here (note older versions of Vundle used Bundle
" instead of Plugin)
"
" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" =========================="
" 2. 分屏快捷键
" =========================="
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"========================"
"  3.txt文件按照wiki语法高亮"
"========================"
" autocmd BufNewFile *.txt set ft=confluencewiki 
" autocmd BufEnter *.txt set ft=confluencewiki
"========================"
"  4.Code Folding
"========================"
set foldmethod=indent
set foldlevel=99
nnoremap <space> za
"========================"
"  5.PEP8 style
"========================"
" When started as "evim", evim.vim will already have done these settings.
let g:SimpylFold_docstring_preview=1		" Don't know 
if v:progname =~? "evim"
  finish
endif
" set smartindent		" when open a new line ,auto indent
" set shiftwidth=4
" set smarttab
map 9 $				" 
map <silent> <C-A> gg v G	" Ctrl-A select all
" filetype on			" 
filetype plugin on		" 加载文件类型插件
set wildmenu			" tab auto fix
set autochdir
" set fdm=expr
" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  set undofile		" keep an undo file (undo changes after closing)
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set nu			" show the line number
set cursorline		" Undeline the line you local
" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
" if has('mouse')
"  set mouse=a
" endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
" if &t_Co > 2 || has("gui_running")
"   syntax on
"   set hlsearch
" endif
syntax on
set hlsearch
" Only do this part when compiled with support for autocommands.
if has("autocmd")
  au BufNewFile,BufRead *.py
"	\ set tabstop=4
	\ set softtabstop=4
	\ set shiftwidth=4
	\ set textwidth=79
	\ set expandtab
	\ set autoindent
	\ set fileformat=unix
  au BufNewFile,BufRead *.js, *.html, *.css
	\ set tabstop=2
	\ set softtabstop=2
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/		" use to mark empty char
"
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on
  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langnoremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If unset (default), this may break plugins (but it's backward
  " compatible).
  set langnoremap
endif


" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
packadd matchit
