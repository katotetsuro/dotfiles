"OSの判定
if has('win32')
  let ostype = "Win"
elseif has('mac')
  let ostype = "Mac"
else
  let ostype = system("uname")
endif

set nocompatible "Vi互換をオフ
set showtabline=2 " タブを常に表示
if ostype == 'Mac'
  set transparency=5 " 透明度
endif
set imdisable " IME OFF
set guioptions-=T " ツールバー非表示
set antialias " アンチエイリアス
set tabstop=4 " タブサイズ
set shiftwidth=4 " インデント幅
set number " 行番号表示
set nobackup " バックアップなし
set visualbell t_vb= " ビープ音なし

colorscheme desert "カラースキーマ
set columns=120 " 横幅
set lines=65 " 行数

" フォント設定
if ostype == 'Mac'
  set guifontwide=Ricty-Regular:h18
  set guifont=Ricty-Regular:h18
else

endif

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
"let g:neocomplcache_max_list = 30
"let g:neocomplcache_auto_completion_start_length = 2
"let g:neocomplcache_enable_smart_case = 1
" like AutoComplPop
"let g:neocomplcache_enable_auto_select = 1
" search with camel case like Eclipse
""let g:neocomplcache_enable_camel_case_completion = 1
""let g:neocomplcache_enable_underbar_completion = 1
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" 自動保管の色
hi Pmenu guibg=#f5f5dc guifg=#000000
hi PmenuSel guibg=#0000ff guifg=#ffffff
hi PmenuSbar guibg=#aaaaaa
hi PmenuThumb guifg=#0000ff
"-------------------------------------------
" 入力補完
"-------------------------------------------
"inoremap { {}<LEFT>
"inoremap [ []<LEFT>
"inoremap ( ()<LEFT>
"inoremap " ""<LEFT>
"inoremap ' ''<LEFT>
"inoremap < <><LEFT>
"vnoremap { "zdi^V{<C-R>z}<ESC>
"vnoremap [ "zdi^V[<C-R>z]<ESC>
"vnoremap ( "zdi^V(<C-R>z)<ESC>
"vnoremap " "zdi^V"<C-R>z^V"<ESC>
"vnoremap ' "zdi'<C-R>z'<ESC>
"
" 保存時に空白を削除
autocmd BufWritePre * :%s/\s\+$//e



"jedi
let g:jedi#autocompletion_command = "<C-j>"
