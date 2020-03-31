
" __  ____   __  _   ___     _____ __  __ ____   ____
"|  \/  \ \ / / | \ | \ \   / /_ _|  \/  |  _ \ / ___|
"| |\/| |\ V /  |  \| |\ \ / / | || |\/| | |_) | |
"| |  | | | |   | |\  | \ V /  | || |  | |  _ <| |___
"|_|  |_| |_|   |_| \_|  \_/  |___|_|  |_|_| \_\\____|

" Author: @liuwangchen

" Checkout-list
" vim-esearch
" fmoralesc/worldslice
" SidOfc/mkdx


" ===
" === Auto load for first time uses
" ===
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs http://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" General {{{
set nocompatible

scriptencoding utf-8
set fileencodings=utf-8
set termencoding=utf-8
set encoding=utf-8

set autowrite
set autoread
set hidden

" Backup
set nobackup
set directory=/tmp//

" Match and search
set hlsearch
set ignorecase
set smartcase
set incsearch
" Visual {{{
set t_Co=256

set number

set laststatus=2

set splitbelow
set splitright

set mousehide
set mouse=a

set cursorline

set winminheight=0

set virtualedit=onemore

set noerrorbells
set vb t_vb=
if has("autocmd") && has("gui")
	au GUIEnter * set t_vb=
endif

set completeopt=

set nofoldenable
let mapleader=" "
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" Auto change directory to current dir
" autocmd BufEnter * silent! lcd %:p:h
" Auto reload
au FocusGained * :checktime

" Update time
set updatetime=300

" Syntax
syntax on
"}}}

" Formatting {{{
set fo+=o
set fo-=r
set fo-=t

set backspace=indent,eol,start

set smarttab
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab

set autoindent
set cindent
set cinoptions=:s,ps,ts,cs
set cinwords=if,else,while,do,for,switch,case
"}}}

" ===============LEADER
noremap <LEADER><CR> :nohlsearch<CR>
noremap <LEADER>rc :e ~/.vimrc<CR>
" Press space twice to jump to the next '<++>' and edit it
noremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l
noremap <LEADER>sc :set spell!<CR>


" ===================map
noremap j h
noremap J 5h
noremap i k
noremap I 5k
noremap k j
noremap K 5j
noremap L 5l
noremap e i
noremap E I
noremap h e
noremap H E
noremap <Space> <nop>
noremap ! :!
map ci ce
map yi ye
map di de
map vi de
" find and replace
noremap \s :%s//g<left><left>
imap  <Left>
noremap s :w<CR>
map q :q<CR>
map R :source ~/.vimrc<CR>
" Call figlet
noremap tx :r !figlet
" Clipboard
" vnoremap Y "+y
set clipboard=unnamed

map <LEADER>l <C-w>l
map <LEADER>j <C-w>h
map <LEADER>i <C-w>k
map <LEADER>k <C-w>j
map <LEADER>v <C-v>
map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize+5<CR>
map <right> :vertical resize-5<CR>
map sv <C-w>t<C-w>H
map sh <C-w>t<C-w>K

" ================tab
map tu :tabe<CR>
map tj :-tabnext<CR>
map tl :+tabnext<CR>
map tq :tabclose<CR>



" ==================pluginhahafdsfds
call plug#begin('~/.vim/plugged')
" Pretty Dress
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Editor Enhancement
Plug 'AndrewRadev/switch.vim' " gs to switch
Plug 'tpope/vim-surround' " type yskw' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'tomasiser/vim-code-dark'
Plug 'jiangmiao/auto-pairs'
" ===
" === vim-easymotion
" ===
Plug 'easymotion/vim-easymotion'
map <Leader> <Plug>(easymotion-prefix)
nmap mw <Plug>(easymotion-w)
nmap mb <Plug>(easymotion-b)
hi link EasyMotionTarget search
call plug#end()

" ====================================theme
"
let g:airline_theme = 'codedark'
let g:codedark_conservative = 1
colorscheme codedark
set t_Co=256
set t_ut=
let g:codedark_term256=1

" xp 调换字母位置  
" ddp调换两个行的位置 
" ha快速跳到当前单词最后并进入插入模式
