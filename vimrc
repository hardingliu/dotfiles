" Zongming's vimrc
set nocompatible

" Vim-plug
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

Plug 'leafgarland/typescript-vim'

Plug 'tpope/vim-fugitive'

Plug 'jiangmiao/auto-pairs'

Plug 'w0rp/ale'

Plug 'vim-airline/vim-airline'

" colorschemes
Plug 'morhetz/gruvbox'

Plug 'altercation/vim-colors-solarized'

Plug 'tomasr/molokai'

Plug 'itchyny/landscape.vim'

Plug 'junegunn/seoul256.vim'

call plug#end()

" general settings
filetype plugin indent on
set backspace=indent,eol,start
set laststatus=2
set showcmd
set ruler
set number
set wildmenu
set incsearch
set hlsearch
set ignorecase
set smartcase
set autoindent
set smartindent
set cindent
set tabstop=4
set shiftwidth=4
set expandtab
set wrap
set linebreak
set nolist
set encoding=utf-8
set fileencoding=utf-8
set background=dark
syntax on

" colorscheme setting
" let g:molokai_original = 1
colorscheme molokai

" remove trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" let ale use pycodestyle as the python linter
let g:ale_linters = {
\   'python': ['pycodestyle'],
\}

" Put these lines at the very end of your vimrc file, for ale.
" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
