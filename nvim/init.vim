  
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
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let mapleader=" "
set number
set norelativenumber
set cursorline
set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase
let &t_ut=''
set mouse=a
set encoding=utf-8
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set list
set listchars=tab:▸\ ,trail:▫
set scrolloff=5
set tw=0
set indentexpr=
set backspace=indent,eol,start
set foldmethod=indent
set foldlevel=99
set laststatus=2
set autochdir
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" ===============LEADER
noremap <LEADER><CR> :nohlsearch<CR>
noremap <LEADER>rc :e ~/.config/nvim/init.vim<CR>
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

map <C-s> :w<CR>
map q :q<CR>
map R :source ~/.config/nvim/init.vim<CR>
" Call figlet
noremap tx :r !figlet 
" Copy to system clipboard
vnoremap Y "+y


" ==============split
map sl :set splitright<CR>:vsplit<CR>
map sj :set nosplitright<CR>:vsplit<CR>
map sk :set splitbelow<CR>:split<CR>
map si :set nosplitbelow<CR>:split<CR>
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
map tp :-tabnext<CR>
map tn :+tabnext<CR>



" ==================plugin
call plug#begin('~/.config/nvim/plugged')
" Pretty Dress
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-bufferline'
Plug 'liuchengxu/space-vim-theme'

" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim' " For ranger.vim
Plug 'junegunn/vim-peekaboo'
Plug 'tomasiser/vim-code-dark'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'AndrewRadev/switch.vim' " gs to switch
Plug 'scrooloose/nerdcommenter' " in <space>cn to comment a line
Plug 'tpope/vim-surround' " type yskw' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'MattesGroeger/vim-bookmarks'
call plug#end()

" ===
" === NERDTree
" ===
nmap tt :NERDTreeToggle<CR>
nmap tc :NERDTreeCWD<CR>
let NERDTreeMenuDown = "k"
let NERDTreeMenuUp = "i"
let NERDTreeMapOpenSplit = ""
let NERDTreeMapActivateNode = "l"
let NERDTreeMapOpenRecursively = "L"
let NERDTreeMapCloseDir = "j"
let NERDTreeMapCloseChildren = "J"
let NERDTreeMapJumpLastChild = "K"
let NERDTreeMapJumpFirstChild = "I"
nmap tj <C-w>h
nmap tl <C-w>l
""当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
""打开vim时自动打开NERDTree
" autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" ==
" == NERDTree-git
" ==
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" ===
" === Ranger.vim
" ===
nnoremap ra :Ranger<CR>
let g:ranger_map_keys = 0

" ===
" === FZF
" ===
nnoremap <silent> ff :Files<CR>
nnoremap <silent> fh :History<CR>
nnoremap <silent> fa :Ag<CR>
nnoremap <silent> fb :Buffers<CR>
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(
  \   '',
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%', '?'),
  \   <bang>0)

" ====================================commenter
let g:NERDSpaceDelims=1

" =====================================mark
let g:bookmark_sign = '♥'

" Compile function
noremap r :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:res -15
		:term ./%<
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "!".g:mkdp_browser." % &"
	elseif &filetype == 'markdown'
		exec "MarkdownPreview"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'go'
		set splitbelow
		:sp
    :res -10
		:term go run %
	endif
endfunc

" ====================================theme
"
let g:codedark_conservative = 1
colorscheme codedark
let g:airline_theme = 'codedark'
set t_Co=256
set t_ut=
let g:codedark_term256=1


