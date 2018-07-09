set encoding=utf-8
set ruler
set showmatch
set showmode

set confirm
set fileencoding=utf-8

set tabstop=4
set softtabstop=4
set nojoinspaces
set nu
set autoindent
set colorcolumn=100

set nohlsearch

set belloff=all

filetype on

set background=dark
syntax enable

" enter on cmd mode for new line
map <Enter> o<ESC>

" center view on the search result
noremap n nzz
noremap N Nzz

" press F4 to fix indentation in whole file; overwrites marker 'q' position
noremap <F4> mqggVG=`qzz
inoremap <F4> <Esc>mqggVG=`qzza

" press F5 to sort selection or paragraph
vnoremap <F5> :sort i<CR>
nnoremap <F5> Vip:sort i<CR>

" press F8 to turn the search results highlight off
noremap <F8> :nohl<CR>
inoremap <F8> <Esc>:nohl<CR>a

" press F12 to toggle showing the non-printable charactes
noremap <F12> :set list!<CR>
inoremap <F12> <Esc>:set list!<CR>a
