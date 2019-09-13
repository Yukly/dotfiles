" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイル（後述）を用意しておく
  let g:rc_dir    = expand('~/.cache/dein/userconfig')
  let s:toml      = g:rc_dir . '/plugins.toml'
  let s:lazy_toml = g:rc_dir . '/plugins_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif



" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB>
 \ pumvisible() ? "\<C-n>" :
 \ neosnippet#expandable_or_jumpable() ?
 \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

"set snippet file dir
let g:neosnippet#snippets_directory='~/.cache/dein/repos/github.com/Shougo/neosnippet-snippets/neosnippets'

filetype plugin indent on
syntax enable




"setting
" 文字コードをUFT-8に設定
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" [{}]をハイライトしない
let c_no_bracket_error = 1
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd
" クリップボードを共有する
set clipboard=unnamed
" TABを削除できるようにする
set backspace=indent,eol,start 
" 全角スペースを可視化
autocmd Colorscheme * highlight FullWidthSpace ctermbg=white
autocmd VimEnter * match FullWidthSpace /　/
" leaderをSpaceに設定する
let mapleader = "\<Space>"
" jjでESCできるようにする
inoremap <silent> jj <ESC>
" ノーマルモード時Enterで改行
nnoremap <CR> A<CR><ESC>
" Ctrl+@でRunnerを実行
nnoremap <C-@> :call Runner() <cr>
" Space+tでNREDTreeを起動
nnoremap <silent><Leader>t :NERDTreeToggle<CR>
" Space+wで保存
nnoremap <Leader>w :w<CR>
" Space+y,d,pでクリップボードの操作
vmap <Leader>y "+y
nmap <Leader>p "+p
vmap <Leader>p "+p
" 疑似Runner
function! Runner()
    :w
    let name = expand("%:e")
    if name == "cpp"
        :! bash ~/Desktop/shell/cpprun.sh %
    elseif name == "c"
        :! bash ~/Desktop/shell/crun.sh %
    elseif name == "py"
        :! bash ~/Desktop/shell/pyrun.sh %
    elseif name == "sml"
        :! bash ~/Desktop/shell/smlrun.sh %
    endif
endfunction

" smlnj Runner
function! SML()
    :w
    :! sml %
endfunction

" Set input
function! Input()
    :vsp ~/Desktop/programing/input.txt
    :execute ":normal! \<C-w>L"
    :execute ":normal! \<C-W>h"
    :execute ":normal! \<C-w>25>"
endfunction

"copy
function! Copy()
    :w
    :! cat % | pbcopy
endfunction


" 見た目系
" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" タイトルの表示
set title
" 現在の行を強調表示（縦）
set cursorcolumn
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk

autocmd ColorScheme * highlight Comment ctermfg=110
autocmd ColorScheme * highlight Visual ctermbg=18 

" color
colorscheme tender

" Tab系
" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=4
" 行頭でのTab文字の表示幅
set shiftwidth=4


" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight LineNr ctermbg=none
highlight Folded ctermbg=none
highlight EndOfBuffer ctermbg=none 
