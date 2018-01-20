set number
set ignorecase
set smartcase
set incsearch
set hlsearch
set noswapfile
set shiftround
set infercase
set virtualedit=all
set autoindent
set mouse=a
colorscheme onedark
filetype plugin indent on
syntax enable

set statusline+=%{gutentags#statusline()}

if has('nvim')
  set clipboard+=unnamedplus
  "if has('mouse')
  "  set mouse=
  "endif
else
  set laststatus=2
  set wildmenu
  set clipboard=unnamed,autoselect set backspace=indent,eol,start
endif

nnoremap <C-]> g<C-]>


"----------------------------------------------
" disable default plugins
"----------------------------------------------
let g:loaded_gzip                = 1
let g:loaded_tar                 = 1
let g:loaded_tarPlugin           = 1
let g:loaded_zip                 = 1
let g:loaded_zipPlugin           = 1
let g:loaded_rrhelper            = 1
let g:loaded_2html_plugin        = 1
let g:loaded_vimball             = 1
let g:loaded_vimballPlugin       = 1
let g:loaded_getscript           = 1
let g:loaded_getscriptPlugin     = 1
let g:loaded_netrw               = 1
let g:loaded_netrwPlugin         = 1
let g:loaded_netrwSettings       = 1
let g:loaded_netrwFileHandlers   = 1
let g:loaded_LogiPat             = 1
let g:loaded_logipat             = 1
let g:loaded_tutor_mode_plugin   = 1
let g:loaded_spellfile_plugin    = 1
let g:loaded_man                 = 1
let g:loaded_matchit             = 1

let g:deoplete#enable_at_startup = 1

"----------------------------------------------
" for Lang
"----------------------------------------------
" for vim script
autocmd FileType vim setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd FileType vim setlocal dictionary=/usr/local/share/nvim/runtime/syntax/vim/generated.vim

" for shell script
autocmd FileType sh setlocal tabstop=2 shiftwidth=2 softtabstop=2 noexpandtab
autocmd FileType sh setlocal dictionary=/usr/local/share/nvim/runtime/syntax/sh.vim

" for python
autocmd FileType python setlocal cindent
autocmd FileType python setlocal cinwords=if,else,elif,for,try,except,finally,def,class
autocmd FileType python setlocal tabstop=8 shiftwidth=4 softtabstop=4 expandtab
autocmd FileType python setlocal smarttab nosmartindent textwidth=80 colorcolumn=81
autocmd FileType python setlocal dictionary=/usr/local/share/nvim/runtime/syntax/python.vim
syntax match pythonOperator "\(+\|=\|-\|^\|*\)"
syntax match pythonDelimiter "\(,\|.\|:\)"
syntax keyword pythonSpecialWord self
highlight link pythonSpecialWord Special
highlight link pythonDelimiter Special

let b:current_after_syntax = 'python'

" for C, C++
autocmd FileType c,cpp setlocal cindent
autocmd FileType c,cpp setlocal smarttab smartindent textwidth=80
autocmd FileType c setlocal dictionary=/usr/local/share/nvim/runtime/syntax/c.vim
autocmd FileType cpp setlocal dictionary=/usr/local/share/nvim/runtime/syntax/cpp.vim
