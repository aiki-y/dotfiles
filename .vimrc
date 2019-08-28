""""""""""""""""""""
" 操作系
""""""""""""""""""""
" プラグインインストール
" :NeoBundleInstall
" プラグインアップデート
" :NeoBundleUpdate
" プラグイン削除　当該箇所を削除後
" :NeoBundleClean
""""""""""""""""""""

""""""""""""""""""""
" 各種オプションの設定
""""""""""""""""""""
" 挙動をvi互換ではなく、vimのデフォルト設定にする
set nocompatible
" ファイルタイプ関連を無効化する
filetype off
" スワップファイルを使わない
set noswapfile
" 行番号を表示する
set number
" 対応する括弧やプレースを表示する
set showmatch
" 暗い背景色に合わせた配色にする
set background=dark
" 改行時に前の行のインデントを継続する
set autoindent
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent
" タブ文字の表示幅
set tabstop=4
" Vimが挿入するインデントの幅
set shiftwidth=4
" 行頭の余白内でTabを打ち込むと、'shiftwidth'の数だけインデントする
set smarttab
" filetypeの自動検出
filetype on
" tabキーをスペースにする
set expandtab
""""""""""""""""""""


""""""""""""""""""""
" プラグインのセットアップ
""""""""""""""""""""
" bundleで管理するディレクトリを指定
set runtimepath+=~/.vim/bundle/neobundle.vim
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" ファイルをtree表示する
NeoBundle 'scrooloose/nerdtree'

" インデントに色を付けて見やすくする
NeoBundle 'nathanaelkane/vim-indent-guides'

" コメントON/OFFを手軽に実行
NeoBundle 'tomtom/tcomment_vim'

" カラースキーマ
NeoBundle 'tomasr/molokai'

" syntax check
NeoBundle 'scrooloose/syntastic'
let g:syntastic_python_checkers = ['pyflakes', 'pep8']

" 自動的に閉じ括弧
NeoBundle 'cohama/lexima.vim'

" コード補完
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'

filetype plugin indent on
filetype indent on

call neobundle#end()
""""""""""""""""""""

" vimを立ち上げた時に、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup = 1


""""""""""""""""""""
" 最後のカーソル位置を復元する
""""""""""""""""""""
if has("autocmd")
	autocmd BufReadPost *
	\ if line("'\'") > 0 && line ("'\'") <= line("$") |
	\ 	exe "normal! h'\"" |
	\ endif
endif
""""""""""""""""""""

""""""""""""""""""""
" キーマップ
""""""""""""""""""""
" Ctrl+e　NERDTree
nnoremap <silent><C-e> :NERDTreeToggle<CR>
" Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w
" Move window
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l
" Switch tab
nmap <S-Tab> :tabprev<Return>
nmap <Tab> :tabnext<Return>
""""""""""""""""""""


" カラースキーマの指定
colorscheme molokai
" 構文毎に文字色を変化させる
syntax on
" コメントアウトの文字色を指定
hi Comment ctermfg=102
" 選択範囲の色を指定
hi Visual ctermbg=236
" set encodint
set encoding=utf-8
