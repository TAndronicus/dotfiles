set number 

set autoindent
set smartindent
set smarttab
set tabstop=4
set shiftwidth=4
set expandtab

set showmatch

set hlsearch
set incsearch

set ruler
set backspace=indent,eol,start

set autoread

let $LANG='en'
set langmenu=en
set encoding=utf8

set noerrorbells
set novisualbell
set t_vb=
set tm=500

set foldcolumn=1

if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

try
    colorscheme dracula
catch
endtry

set background=dark

set nobackup
set nowb
set noswapfile

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'junegunn/seoul256.vim'
" Plug 'jonathanfilip/lucius'
" Plug 'scheakur/vim-scheakur'
Plug 'scrooloose/nerdtree'

call plug#end()

colo seoul256
" colo lucius
" colorscheme scheakur

