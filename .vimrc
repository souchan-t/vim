set fenc=utf8
set autoread
set hidden
set showcmd
set number
set cursorline
set smartindent
set showmatch
set laststatus=2
set title
set wildmenu

"タブ文字の設定
set list listchars=tab:\▶\-,eol:↵
"set expandtab
set tabstop=4
set shiftwidth=4

"検索時大文字小文字を無視
set ignorecase
"ただし、検索文字に大文字が含まれていれば区別
set smartcase
"検索を循環
set incsearch
set wrapscan
"検索文字をハイライト
set hlsearch

"新規ウィンドウは右、下に表示
set splitright
set splitbelow

"シンタックスの色付け
syntax on

"Shift-TAB,Shift-tでタブ切り替え
nnoremap <s-TAB> gt
nnoremap <s-t> gt
"Shift-wでウィンドウ切り替え
nnoremap <s-w> <C-w>w
inoremap <s-Down> <C-c>v
inoremap <C-r> <ESC>:%s/[old]/[new]/gc


if &compatible
	set nocompatible
endif

"let $PATH = "~/anaconda3/bin".$PATH

set runtimepath+=~/.vim/dein.vim

"-------------------------------------------------------------
call dein#begin(expand('~/.vim/dein'))


"プラグイン管理
call dein#add('Shougo/dein.vim')

" 補完プラグイン
call dein#add('Shougo/neocomplete.vim')
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_ignore_case = 1
let g:neocomplete#enable_smart_case = 1
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns._ = '\h\w*'
"inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "<\<TAB>"
"inoremap <expr><s-TAB> pumvisible() ? "\<C-p>" : "<\<S-TAB>"

"ファイル表示プラグイン
call dein#add('scrooloose/nerdtree')
nnoremap <silent><F3> :NERDTreeToggle<CR>

"カラーマップのプラグイン
call dein#add('joshdick/onedark.vim')
let g:onedark_termcolor=16
colorscheme onedark

"各種ソースの実行プラグイン
call dein#add('thinca/vim-quickrun')
nnoremap <silent><F5> :QuickRun<CR>

"Python補完プラグイン
call dein#add('davidhalter/jedi-vim')
let g:jedi#completions_command = "<C-Space>"
let g:jedi#popup_on_dot = 1
autocmd FileType python setlocal completeopt-=preview

call dein#add('Shougo/vimproc.vim',{'build':'make'})

call dein#add('Shougo/vimshell.vim')
nnoremap <silent><F4> :sp<CR>:VimShell<CR>

" Nim言語用プラグイン
call dein#add('zah/nim.vim')

" ステータスラインプラグイン
call dein#add('itchyny/lightline.vim')

" 文法チェックなど
"let g:ale_completion_enabled = 1
call dein#add('w0rp/ale')
let g:ale_sign_error = '×'
let g:ale_sign_warning = '⚠'
let g:ale_sign_column_always = 1
"let g:ale_linters = {
"\	'python':['flake8'],
"\	}


call dein#end()
"--------------------------------------------------------------------

