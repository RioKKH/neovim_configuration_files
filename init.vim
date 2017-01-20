augroup MyAutoCmd
  autocmd!
augroup END

if &compatible
  set nocompatible
endif

let g:cache_home = empty($XDG_CACHE_HOME) ? expand('$HOME/.cache') : $XDG_CACHE_HOME
let g:config_home = empty($XDG_CONFIG_HOME) ? expand('$HOME/.config') : $XDG_CONFIG_HOME
let s:dein_cache_dir = g:cache_home . '/dein'

let g:python3_host_prog = $PYENV_ROOT . '/shims/python'

if &runtimepath !~# '/dein.vim'
  let s:dein_repo_dir = s:dein_cache_dir . "/repos/github.com/Shougo/dein.vim"
  if !isdirectory(s:dein_repo_dir)
    call system("git clone https://github.com/Shougo/dein.vim" . shellexcape(s:dein_repo_dir))
  endif
  execute 'set runtimepath^=' . s:dein_repo_dir
endif

" dein.vim settings
let g:dein#install_max_processes = 16
let g:dein#install_progress_type = "title"
let g:dein#install_message_type = "none"
let g:dein#enable_notification = 1

if dein#load_state(s:dein_cache_dir)
  "call dein#begin('/home/kakehi/.cache/dein/')
  call dein#begin(s:dein_cache_dir)
  let s:toml_dir = g:config_home . '/nvim'

  call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy': 0})
  call dein#load_toml(s:toml_dir . '/dein_lazy.toml', {'lazy': 1})
  "if has ('nvim')
    "call dein#load_toml(s:toml_dir . '/neovim.toml', {'lazy': 1})
  "endif

  call dein#add('Shougo/neosnippet-snippets')
  call dein#end()
  call dein#save_state()
endif

if has('vim_starting') && dein#check_install()
  call dein#install()
endif


" -------------------------------------------------------------------
" Vim settings 
" -------------------------------------------------------------------
set number
set ignorecase
set smartcase
set incsearch
set hlsearch
set noswapfile
set shiftround
set infercase
set virtualedit=all
filetype plugin indent on
syntax enable
"let g:airline_theme='one'
set background=dark
"colorscheme one
colorscheme onedark
let g:lightline = {
  \ 'colorscheme' : 'onedark',
  \ }


" -------------------------------------------------------------------
" Key mappings cnoremap
" -------------------------------------------------------------------
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

nnoremap j gj
nnoremap k gk

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h

inoremap <C-e> <C-o>$

" -------------------------------------------------------------------
" Settings for each for programing language 
" -------------------------------------------------------------------
" for bash script
autocmd FileType sh setl autoindent
autocmd FileType sh setl tabstop=2 shiftwidth=2 softtabstop=2 noexpandtab
autocmd FileType sh setl dictionary=/usr/local/share/nvim/runtime/syntax/sh.vim

" for vim script
autocmd FileType vim setl autoindent
autocmd FileType vim setl tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd FileType vim setl dictionary=/usr/local/share/nvim/runtime/syntax/vim/generated.vim

" for python
autocmd FileType python setl cindent
autocmd FileType python setl cinwords=if,elif,else,for,try,except,finally,def,class
autocmd FileType python setl autoindent
autocmd FileType python setl tabstop=8 shiftwidth=4 softtabstop=4 expandtab
autocmd FileType python setl smarttab nosmartindent textwidth=80 colorcolumn=81
autocmd FileType python setl dictionary=/usr/local/share/nvim/runtime/syntax/python.vim

" for c, c++
autocmd FileType c,cpp setl cindent
autocmd FileType c,cpp setl autoindent
autocmd FileType c,cpp setl smarttab smartindent
autocmd FileType c setl dictionary=/usr/local/share/nvim/runtime/syntax/c.vim
autocmd FileType cpp setl dictionary=/usr/local/share/nvim/runtime/syntax/cpp.vim
autocmd FileType c,cpp inoremap <buffer> <expr> . smartchr#loop('.', '->', '...')

" for R script
autocmd FileType r setl autoindent
autocmd FileType r setl tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd FileType r setl dictionary=/usr/local/share/nvim/runtime/syntax/r.vim


" -------------------------------------------------------------------
" Settings for tag files
" -------------------------------------------------------------------
function! Getctags()
	let dirgit7k = '/home/kakehi/work/git/autoeos/src/autoeos7000-src'
	let dirgit9k = '/home/kakehi/work/git/autoeos/src/autoeos9000-src'
	let dirgitMB = 'home/kakehi/work/git/autoeos/src/autoeosMB-src'
	let cwd = getcwd()
	if cwd =~ dirgitMB
		set tags+=/home/kakehi/work/tags/autoeosMB_local.ctags
	elseif cwd =~ dirgit7k
		set tags+=/home/kakehi/work/tags/autoeos_git_7k.ctags
	elseif cwd =~ dirgit9k
		set tags+=/home/kakehi/work/tags/autoeos_git_9k.ctags
	endif
endfunction

nnoremap <C-]> g<C-]>


" -------------------------------------------------------------------
" 文字コードの自動認識
" -------------------------------------------------------------------
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
 let s:enc_euc = 'euc-jp'
 let s:enc_jis = 'iso-2022-jp'
 " iconvがeucJP-msに対応しているかをチェック
 if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
 let s:enc_euc = 'eucjp-ms'
 let s:enc_jis = 'iso-2022-jp-3'
 " iconvがJISX0213に対応しているかをチェック
 elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
 let s:enc_euc = 'euc-jisx0213'
 let s:enc_jis = 'iso-2022-jp-3'
 endif
 " fileencodingsを構築
 if &encoding ==# 'utf-8'
 let s:fileencodings_default = &fileencodings
 let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
 let &fileencodings = &fileencodings .','. s:fileencodings_default
 unlet s:fileencodings_default
 else
 let &fileencodings = &fileencodings .','. s:enc_jis
 set fileencodings+=utf-8,ucs-2le,ucs-2
 if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
 set fileencodings+=cp932
 set fileencodings-=euc-jp
 set fileencodings-=euc-jisx0213
 set fileencodings-=eucjp-ms
 let &encoding = s:enc_euc
 let &fileencoding = s:enc_euc
 else
 let &fileencodings = &fileencodings .','. s:enc_euc
 endif
 endif
 " 定数を処分
 unlet s:enc_euc
 unlet s:enc_jis
endif
" 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd')
 function! AU_ReCheck_FENC()
 if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
 let &fileencoding=&encoding
 endif
 endfunction
 autocmd BufReadPost * call AU_ReCheck_FENC()
endif
" 改行コードの自動認識
set fileformats=unix,dos,mac
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
 set ambiwidth=double
endif

