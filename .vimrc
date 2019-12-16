set mouse=a

set number 
set relativenumber

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

let mapleader = ","

noremap <leader>s :split<CR>
noremap <leader>v :vsplit<CR>
noremap <leader>j <C-w><C-j>
noremap <leader>k <C-w><C-k>
noremap <leader>h <C-w><C-h>
noremap <leader>l <C-w><C-l>
noremap <leader>q :q<CR>
noremap <leader>w :wq<CR>

noremap <leader>n :NERDTree<CR>

let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

set clipboard=unnamedplus

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'junegunn/seoul256.vim'
" Plug 'jonathanfilip/lucius'
" Plug 'scheakur/vim-scheakur'
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdcommenter'
Plug 'jiangmiao/auto-pairs'

call plug#end()

colo seoul256
" colo lucius
" colorscheme scheakur

let g:camelchar = "A-Z0-9_.,;:{([`'\""
nnoremap <silent><C-Left> :<C-u>call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%^','bW')<CR>
nnoremap <silent><C-Right> :<C-u>call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%$','W')<CR>
inoremap <silent><C-Left> <C-o>:call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%^','bW')<CR>
inoremap <silent><C-Right> <C-o>:call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%$','W')<CR>
vnoremap <silent><C-Left> :<C-U>call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%^','bW')<CR>v`>o
vnoremap <silent><C-Right> <Esc>`>:<C-U>call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%$','W')<CR>v`<o

