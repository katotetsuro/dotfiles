set nocompatible "Vi互換をオフ

set showtabline=2 " タブを常に表示
set transparency=5 " 透明度
set imdisable " IME OFF
set guioptions-=T " ツールバー非表示
set antialias " アンチエイリアス
set tabstop=4 " タブサイズ
set shiftwidth=4 " インデント幅
set number " 行番号表示
set nobackup " バックアップなし
set visualbell t_vb= " ビープ音なし

colorscheme desert " カラースキーマ
set columns=120 " 横幅
set lines=45 " 行数

set wrapscan " 検索をファイルの先頭へループしない

" フォント設定
set guifontwide=Osaka:h16
set guifont=Osaka-Mono:h16

" ノーマルモードではセミコロンをコロンに。
nnoremap ; :

" タブの表示
set list
set listchars=tab:>-,trail:-,extends:<,precedes:<
" 全角スペースを視覚化
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/

" 日本語入力をリセット
au BufNewFile,BufRead * set iminsert=0
"-------------------------------------------------
" Move 移動設定
"-------------------------------------------------
" insert mode での移動
inoremap <C-e> <END>
inoremap <C-a> <HOME>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <ESC> <ESC>:set iminsert=0<CR> " ESCでIMEを確実にOFF
" 左右のカーソル移動で行間移動可能にする。
set whichwrap=b,s,<,>,[,]

" 新しい行のインデントを現在行と同じにする
set autoindent

" 新しい行を作ったときに高度な自動インデントを行う
set smartindent

" 挿入モード終了時に IME 状態を保存しない
inoremap <silent> <Esc> <Esc>
inoremap <silent> <C-[> <Esc>
" 「日本語入力固定モード」切り替えキー
inoremap <silent> <C-j> <C-^>
" タブ切り替え
nmap <Tab> gt
nmap <S-Tab> gT

" Programming
set showmatch "対応する括弧を表示
"set cindent "Cのインデント
"set foldmethod=syntax
set grepprg=internal "内蔵grep

"-------------------------------------------
" NERDTree
"-------------------------------------------
let NERDTreeShowHidden = 1
" 引数なしで実行したとき、NERDTreeを実行する
let file_name = expand("%:p")
if has('vim_starting') && file_name == ""
autocmd VimEnter * call ExecuteNERDTree()
endif

" カーソルが外れているときは自動的にnerdtreeを隠す
function! ExecuteNERDTree()
"b:nerdstatus = 1 : NERDTree 表示中
"b:nerdstatus = 2 : NERDTree 非表示中

if !exists('g:nerdstatus')
execute 'NERDTree ./'
let g:windowWidth = winwidth(winnr())
let g:nerdtreebuf = bufnr('')
let g:nerdstatus = 1

elseif g:nerdstatus == 1
execute 'wincmd t'
execute 'vertical resize' 0
execute 'wincmd p'
let g:nerdstatus = 2
elseif g:nerdstatus == 2
execute 'wincmd t'
execute 'vertical resize' g:windowWidth
let g:nerdstatus = 1

endif
endfunction
noremap <c-e> :<c-u>:call ExecuteNERDTree()<cr>
</cr></c-u></c-e>

" VimShell の起動コマンド
noremap <c-s> :sp<cr><c-w><c-w>:VimShell<cr>

"-------------------------------------------
" taglits
"-------------------------------------------
set tags=tags
let Tlist_Show_One_File = 1
let Tlist_Use_Right_Window = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Auto_Open = 1
"-------------------------------------------
" neocomplcache
"-------------------------------------------
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_max_list = 30
let g:neocomplcache_auto_completion_start_length = 2
let g:neocomplcache_enable_smart_case = 1
"" like AutoComplPop
let g:neocomplcache_enable_auto_select = 1
"" search with camel case like Eclipse
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
"imap <C-k> <Plug>(neocomplcache_snippets_expand)
"smap <C-k> <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g> neocomplcache#undo_completion()
inoremap <expr><C-l> neocomplcache#complete_common_string()
" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"
" <CR>: close popup and save indent.
"inoremap <expr><CR> neocomplcache#smart_close_popup() . (&indentexpr != '' ? "\<C-f>\<CR>X\<BS>":"\<CR>")
inoremap <expr><CR> pumvisible() ? neocomplcache#close_popup() : "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup() . "\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup() . "\<C-h>"
inoremap <expr><C-y> neocomplcache#close_popup()
inoremap <expr><C-e> neocomplcache#cancel_popup()

" 自動保管の色
hi Pmenu guibg=#f5f5dc guifg=#000000
hi PmenuSel guibg=#0000ff guifg=#ffffff
hi PmenuSbar guibg=#aaaaaa
hi PmenuThumb guifg=#0000ff
"-------------------------------------------
" 入力補完
"-------------------------------------------
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
inoremap < <><LEFT>
vnoremap { "zdi^V{<C-R>z}<ESC>
vnoremap [ "zdi^V[<C-R>z]<ESC>
vnoremap ( "zdi^V(<C-R>z)<ESC>
vnoremap " "zdi^V"<C-R>z^V"<ESC>
vnoremap ' "zdi'<C-R>z'<ESC>

" 保存時に空白を削除
autocmd BufWritePre * :%s/\s\+$//e
