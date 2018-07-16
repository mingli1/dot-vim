set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
" alternatively, pass a path where Vundle should install plugins
call vundle#begin('~/.vim/plugins')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'surround.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'nightsense/snow'
Plugin 'airblade/vim-gitgutter'
Plugin 'Raimondi/delimitMate'
Plugin 'mattn/emmet-vim'
Plugin 'cocopon/iceberg.vim'
Plugin 'LucHermitte/lh-vim-lib'
Plugin 'LucHermitte/lh-brackets'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set encoding=utf-8
set ruler
set showmatch
set showmode

" files
set confirm
set fileencoding=utf-8

" edit
set tabstop=4
set shiftwidth=4
set expandtab
set nojoinspaces
set nu
set autoindent
set cindent
set colorcolumn=100

" search
set nohlsearch

" sounds
set belloff=all

set background=dark
colorscheme iceberg
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

" Ctrl+O for NERDTree toggle
map <C-o> :NERDTreeTabsToggle<CR>
" show hidden NERDTree files
let NERDTreeShowHidden=1

"inoremap {<CR> {<CR>}<C-o>==<C-o>O
"inoremap {{ <CR>{<CR>}<C-o>==<C-o>O
let g:delimitMate_expand_cr=1
let g:delimitMate_expand_space=1

let g:user_emmet_leader_key='<C-Z>'
function! Expander()
    let line = getline(".")
    let col = col(".")
    let first = line[col-2]
    let second = line[col-1]
    let third = line[col]

    if first ==# ">"
        if second ==# "<" && third ==# "/"
            return "\<CR>\<C-o>==\<C-o>O"
        else 
            return "\<CR>"
        endif
    else
        return "\<CR>"
    endif
endfunction

inoremap <expr> <CR> Expander()

let b:usemarks=0

" Use a blinking upright bar cursor in Insert mode, a blinking block in normal
if &term == 'xterm-256color' || &term == 'screen-256color'
    let &t_SI = "\<Esc>[5 q"
    let &t_EI = "\<Esc>[1 q"
endif
        
if exists('$TMUX')
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
endif
