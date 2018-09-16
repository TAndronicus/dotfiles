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
