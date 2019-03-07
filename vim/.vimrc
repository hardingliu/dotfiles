" Harding's vimrc
set nocompatible

" vim-plug
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

Plug 'leafgarland/typescript-vim'

Plug 'dart-lang/dart-vim-plugin'

Plug 'tpope/vim-fugitive'

Plug 'jiangmiao/auto-pairs'

Plug 'w0rp/ale'

Plug 'vim-airline/vim-airline'

Plug 'vim-airline/vim-airline-themes'

Plug 'google/vim-maktaba'

Plug 'google/vim-codefmt'

Plug 'google/vim-glaive'

" colorschemes
Plug 'google/vim-colorscheme-primary'

Plug 'tomasr/molokai'

Plug 'altercation/vim-colors-solarized'

Plug 'jnurmine/Zenburn'

Plug 'danielwe/base16-vim'

Plug 'chriskempson/vim-tomorrow-theme'

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
set tabstop=2
set shiftwidth=2
set expandtab
set wrap
set linebreak
set nolist
set encoding=utf-8
set fileencoding=utf-8
set background=dark
set clipboard=unnamed
set t_md=
syntax on

" colorscheme
set termguicolors
colorscheme Tomorrow-Night-Bright

" remove trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Put these lines at the very end of your vimrc file, for ale.
" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
