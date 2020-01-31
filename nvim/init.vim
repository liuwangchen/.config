
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
" ===
" === Create a _machine_specific.vim file to adjust machine specific stuff, like python interpreter location
" ===
let has_machine_specific_file = 1
source ~/.config/nvim/special.vim
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
" find and replace
noremap \s :%s//g<left><left>
imap  <Left>
map <C-s> :w<CR>
map q :q<CR>
map R :source ~/.config/nvim/init.vim<CR>
" Call figlet
noremap tx :r !figlet
" Clipboard
" vnoremap Y "+y
set clipboard=unnamed

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
" map <up> :res +5<CR>
" map <down> :res -5<CR>
map <left> :vertical resize+5<CR>
map <right> :vertical resize-5<CR>
map sv <C-w>t<C-w>H
map sh <C-w>t<C-w>K

" ================tab
map tu :tabe<CR>
map tj :-tabnext<CR>
map tl :+tabnext<CR>
map tq :tabclose<CR>



" ==================plugin
call plug#begin('~/.config/nvim/plugged')
" Pretty Dress
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" some plug
" some plug
Plug 'junegunn/vim-peekaboo'
Plug 'tomasiser/vim-code-dark'
Plug 'AndrewRadev/switch.vim' " gs to switch
Plug 'tpope/vim-surround' " type yskw' to wrap the word with '' or type cs'` to change 'word' to `word`


" ===
" === NERDTree
" ===
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
nmap tt :NERDTreeToggle<CR><LEADER>l
nmap tf :NERDTreeFind<CR>
nmap tr :NERDTreeCWD<CR><LEADER>l
let NERDTreeMenuDown = "k"
let NERDTreeMenuUp = "i"
let NERDTreeMapOpenSplit = ""
let NERDTreeMapActivateNode = "l"
let NERDTreeMapOpenRecursively = "L"
let NERDTreeMapCloseDir = "j"
let NERDTreeMapCloseChildren = "J"
let NERDTreeMapJumpLastChild = "K"
let NERDTreeMapJumpFirstChild = "I"
""当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
""打开vim时自动打开NERDTree
" autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" ==
" == NERDTree-git
" ==
Plug 'Xuyuanp/nerdtree-git-plugin'
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
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim' " For ranger.vim
nnoremap ra :Ranger<CR>
let g:ranger_map_keys = 0

" ===
" === FZF
" ===
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
nnoremap <silent> ff :Files<CR>
nnoremap <silent> fh :History<CR>
nnoremap <silent> fc :History:<CR>
nnoremap <silent> fa :Ag<CR>
nnoremap <silent> fs :BLines<CR>
nnoremap <silent> fb :Buffers<CR>
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(
  \   '',
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%', '?'),
  \   <bang>0)

let $FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border --bind alt-k:down,alt-i:up --exact'
" 打开 fzf 的方式选择 floating window
let g:fzf_layout = { 'window': 'call OpenFloatingWin()' }
function! OpenFloatingWin()
  let height = &lines - 3
  let width = float2nr(&columns - (&columns * 2 / 10))
  let col = float2nr((&columns - width) / 2)

  " 设置浮动窗口打开的位置，大小等。
  " 这里的大小配置可能不是那么的 flexible 有继续改进的空间
  let opts = {
        \ 'relative': 'editor',
        \ 'row': height * 0.3,
        \ 'col': col + 30,
        \ 'width': width * 2 / 3,
        \ 'height': height / 2
        \ }

  let buf = nvim_create_buf(v:false, v:true)
  let win = nvim_open_win(buf, v:true, opts)

  " 设置浮动窗口高亮
  call setwinvar(win, '&winhl', 'Normal:Pmenu')

  setlocal
        \ buftype=nofile
        \ nobuflisted
        \ bufhidden=hide
        \ nonumber
        \ norelativenumber
        \ signcolumn=no
endfunction

" ====================================commenter
Plug 'scrooloose/nerdcommenter' " in <space>cn to comment a line
let g:NERDSpaceDelims=1

" =====================================mark
Plug 'MattesGroeger/vim-bookmarks'
let g:bookmark_sign = '♥'



" =======================================coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-j> coc#refresh()

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd :call CocActionAsync('jumpDefinition')<CR>
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window
nnoremap <silent> sd :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <LEADER>rn <Plug>(coc-rename)
" nmap <M-j>f <Plug>(coc-format)
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"

Plug 'sbdchd/neoformat'
let g:neoformat_try_formatprg = 1
let g:neoformat_basic_format_align = 0
let g:neoformat_basic_format_retab = 0
let g:neoformat_basic_format_trim = 1
let g:neoformat_enabled_go = ['goimports', 'gofmt']
nmap <leader>f :Neoformat<CR>

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
let g:tex_flavor = "latex"
inoremap <c-p> <nop>
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"
let g:UltiSnipsSnippetDirectories = ['ultiSnips']
silent! au BufEnter,BufRead,BufNewFile * silent! unmap <c-r>
call plug#end()











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
    :res -15
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
    :res -15
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

