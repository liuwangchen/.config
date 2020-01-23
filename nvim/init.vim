let mapleader=" "
set number
set norelativenumber
set cursorline
set showcmd
set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase
noremap j h
noremap J 5h
noremap i k
noremap I 5k
noremap k j
noremap K 5j
noremap L 5l
noremap e i
noremap <LEADER><CR> :nohlsearch<CR>

map <C-s> :w<CR>
map q :q<CR>
map R :source ~/.config/nvim/init.vim<CR>

call plug#begin('plugins')

Plug 'vim-airline/vim-airline'

call plug#end()


