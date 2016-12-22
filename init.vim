augroup MyAutoCmd
  autocmd!
augroup END

if &compatible
  set nocompatible
endif

let g:cache_home = empty($XDG_CACHE_HOME) ? expand('$HOME/.cache') : $XDG_CACHE_HOME
let g:config_home = empty($XDG_CONFIG_HOME) ? expand('$HOME/.config') : $XDG_CONFIG_HOME
let s:dein_cache_dir = g:cache_home . '/dein'

let g:python3_host_prog = $PYENV_ROOT . '/shims/python3'

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
  if has ('nvim')
    call dein#load_toml(s:toml_dir . '/neovim.toml', {'lazy': 1})
  endif

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
let g:airline_theme='one'
set background=dark
colorscheme one


" -------------------------------------------------------------------
" Key mappings 
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
autocmd FileType vim setl tabstop=2 shiftwidth=2 softtabstop=2 noexpandtab
autocmd FileType vim setl dictionary=/usr/local/share/nvim/runtime/syntax/vim/generated.vim

" for python
autocmd FileType python setl cindent
autocmd FileType python setl cinwords=if,elif,else,for,try,except,finally,def,class
autocmd FileType python setl autoindent
autocmd FileType python setl tabstop=8 shiftwidth=4 softtabstop=4 expandtab
autocmd FileType python setl smarttab nosmartindent textwidth=80 colorcolumn=81
autocmd FileType python setl dictionary=/usr/local/share/nvim/runtime/syntax/python.vim


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
