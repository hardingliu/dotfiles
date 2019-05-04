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

Plug 'google/vim-maktaba'

Plug 'google/vim-codefmt'

Plug 'google/vim-glaive'

Plug 'sheerun/vim-polyglot'

" colorschemes
Plug 'tomasr/molokai'

Plug 'NLKNguyen/papercolor-theme'

Plug 'ayu-theme/ayu-vim'

Plug 'danielwe/base16-vim'

Plug 'blueshirts/darcula'

Plug 'altercation/vim-colors-solarized'

Plug 'lifepillar/vim-solarized8'

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
set background=light
set clipboard=unnamed
set t_md=
syntax on

" colorscheme
if $TERM_PROGRAM != 'Apple_Terminal'
  set termguicolors
endif
" let ayucolor="dark"   " for dark version of theme
" colorscheme ayu
" colorscheme base16-spacemacs
colorscheme solarized8

" remove trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Put these lines at the very end of your vimrc file, for ale.
" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
