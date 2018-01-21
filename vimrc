" Zongming's vimrc
set nocompatible

" Vim-plug
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

Plug 'leafgarland/typescript-vim'

Plug 'google/yapf', { 'rtp': 'plugins/vim', 'for': 'python' }

Plug 'tpope/vim-fugitive'

Plug 'jiangmiao/auto-pairs'

Plug 'w0rp/ale'

Plug 'vim-airline/vim-airline'

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

" MacVim settings
if has('gui_running')
    set cursorline
    set guioptions-=L
    set guioptions-=r
    set guioptions+=m
    set guioptions+=T
    set guifont=Monaco:h11
endif

" set termguicolors
" let g:gruvbox_contrast_dark='hard'
" colorscheme gruvbox

colo solarized

" clang-format
map <C-K> :py3f /usr/local/Cellar/clang-format/2017-11-14/share/clang/clang-format.py<cr>

" yapf
map <C-Y> :call yapf#YAPF()<cr>
imap <C-Y> <c-o>:call yapf#YAPF()<cr>

" remove trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Put these lines at the very end of your vimrc file.

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
