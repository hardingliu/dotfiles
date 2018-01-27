" Zongming's vimrc
set nocompatible

" Vim-plug
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'

Plug 'leafgarland/typescript-vim'

Plug 'tpope/vim-fugitive'

Plug 'jiangmiao/auto-pairs'

Plug 'w0rp/ale'

Plug 'vim-airline/vim-airline'

Plug 'vim-airline/vim-airline-themes'

" colorschemes
Plug 'morhetz/gruvbox'

Plug 'icymind/NeoSolarized'

Plug 'NLKNguyen/papercolor-theme'

Plug 'w0ng/vim-hybrid'

Plug 'altercation/vim-colors-solarized'

Plug 'tomasr/molokai'

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

set termguicolors
colo NeoSolarized

let g:airline_powerline_fonts = 1

"let g:gruvbox_bold=0
"let g:gruvbox_italic=0
"let g:gruvbox_contrast_dark='hard'
"let g:gruvbox_invert_selection=0
"colo gruvbox

" remove trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Put these lines at the very end of your vimrc file, for ale.
" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
