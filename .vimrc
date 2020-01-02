set fenc=utf8
set ambiwidth=double
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
set list listchars=tab:\>\-,eol:↵
"set expandtab
set tabstop=4
set shiftwidth=4

vnoremap > >gv
vnoremap < <gv

if has("autocmd")
	filetype plugin on
	filetype indent on

	autocmd FileType javascript     setlocal sw=4 sts=4 ts=4 et
	autocmd FileType typescript     setlocal sw=4 sts=4 ts=4 et
	autocmd FileType python         setlocal sw=4 sts=4 ts=4 et
	autocmd FileType ruby           setlocal sw=2 sts=2 ts=2 et
	autocmd FileType nim            setlocal sw=2 sts=2 ts=2 et
	autocmd FileType scala          setlocal sw=2 sts=2 ts=2 et
	autocmd FileType java           setlocal sw=4 sts=4 ts=4
endif



"検索時大文字小文字を無視
set ignorecase
"ただし、検索文字に大文字が含まれていれば区別
set smartcase
"検索を循環
set incsearch
set wrapscan
"検索文字をハイライト
set hlsearch
nnoremap <silent><Esc><Esc> :noh<CR>

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

tnoremap <Esc> <C-\><C-n>

" 検索はベリーマジックにする
nnoremap / /\v

if &compatible
	set nocompatible
endif

"let $PATH = "~/anaconda3/bin".$PATH

set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

"-------------------------------------------------------------
call dein#begin(expand('~/.vim/dein'))

"プラグイン管理
call dein#add('Shougo/dein.vim')

" 補完プラグイン
"call dein#add('Shougo/neocomplete.vim')
"let g:neocomplete#enable_at_startup = 1
"let g:neocomplete#enable_ignore_case = 1
"let g:neocomplete#enable_smart_case = 1
"if !exists('g:neocomplete#keyword_patterns')
"  let g:neocomplete#keyword_patterns = {}
"endif
"let g:neocomplete#keyword_patterns._ = '\h\w*'
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><s-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

" 補完プラグイン
"
"call dein#add('Shougo/deoplete.nvim')
"if !has('nvim')
"	call dein#add('roxma/nvim-yarp')
"	call dein#add('roxma/vim-hug-neovim-rpc')
"endif
"let g:deoplete#enable_at_startup = 1
"
"call dein#add('Shougo/neosnippet.vim')
"call dein#add('Shougo/neosnippet-snippets')
"imap <C-k> <Plug>(neosnippet_expand_or_jump)
"smap <C-k> <Plug>(neosnippet_expand_or_jump)
"xmap <C-k> <Plug>(neosnippet_expand_target)
"
"smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
"
"call dein#add('Shougo/neco-syntax')
"call dein#add('Shougo/deoplete-clangx')
"call dein#add('zchee/deoplete-jedi')



"ファイル表示プラグイン
call dein#add('scrooloose/nerdtree')
nnoremap <silent><F3> :NERDTreeToggle<CR>

"カラーマップのプラグイン
call dein#add('joshdick/onedark.vim')
let g:onedark_termcolor=256
colorscheme onedark

call dein#add('tomasr/molokai')
"colorscheme molokai
"
call dein#add('jonathanfilip/vim-lucius')
colorscheme lucius

call dein#add('jdkanani/vim-material-theme')


set termguicolors
set background=dark

"各種ソースの実行プラグイン
call dein#add('thinca/vim-quickrun')
nnoremap <silent><F5> :QuickRun<CR>

"Python補完プラグイン
"call dein#add('davidhalter/jedi-vim')
"let g:jedi#completions_command = "<C-Space>"
"let g:jedi#popup_on_dot = 1
"autocmd FileType python setlocal completeopt-=preview

call dein#add('Shougo/vimproc.vim',{'build':'make'})

call dein#add('Shougo/vimshell.vim')
nnoremap <silent><F4> :sp<CR>:VimShell<CR>

" Nim言語用プラグイン
call dein#add('zah/nim.vim')

" 自動閉じタグ
call dein#add('alvan/vim-closetag')
let g:closetag_filenames = '*.html,*.htm,*.jsp,*.ejs'

" ステータスラインプラグイン
call dein#add('itchyny/lightline.vim')
"lightlineがモード表示するので、デフォルトの表示を消す
set noshowmode

" JavaScriptシンタックス
call dein#add('othree/yajs.vim')

call dein#add('derekwyatt/vim-scala')
call dein#add('neoclide/coc.nvim',{'merged':0,'rev':'release'})
au BufRead,BufNewFile *.sbt set filetype=scala

" TypeScriptシンタックス
call dein#add('leafgarland/typescript-vim')
au BufRead,BufNewFile *.ts set filetype=typescript

" 文法チェックなど
"let g:ale_completion_enabled = 1
call dein#add('w0rp/ale')
let g:ale_sign_error = '×'
let g:ale_sign_warning = '⚠'
let g:ale_sign_column_always = 1
let g:ale_lint_on_text_change = 'never'
let g:ale_lint_on_save = 1
let g:ale_lint_on_enter = 1
let g:ale_echo_cursor = 0
"let g:ale_linters = {
"\	'python':['flake8'],
"\	}


call dein#end()
"--------------------------------------------------------------------
syntax on
