" Harding's vimrc
set nocompatible

" vim-plug
call plug#begin('~/.vim/plugged')

Plug 'OmniSharp/OmniSharp-vim'

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

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

" colors
Plug 'tomasr/molokai'

Plug 'junegunn/seoul256.vim'

Plug 'altercation/vim-colors-solarized'

Plug 'w0ng/vim-hybrid'

Plug 'nanotech/jellybeans.vim'

Plug 'NLKNguyen/papercolor-theme'

Plug 'morhetz/gruvbox'

Plug 'google/vim-colorscheme-primary'

Plug 'jnurmine/Zenburn'

Plug 'vimwiki/vimwiki'

call plug#end()

" general settings
filetype indent plugin on
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
set clipboard=unnamed
set t_md=
syntax on

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
set background=dark
" colorscheme primary
" colorscheme PaperColor
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'

" <C-x><C-o>
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_timeout = 5
set completeopt=longest,menuone,preview
let g:ale_linters = { 'cs': ['OmniSharp'] }

let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

" remove trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Put these lines at the very end of your vimrc file, for ale.
" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
