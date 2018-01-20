let g:deoplete#enable_at_startup = 1
" <TAB>: completion.
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" : 
    \ <SID>check_back_space() ? "\<TAB>" :
    \ deoplete#manual_complete()
function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col -1] =~ '\s'
endfunction"}}}

" <S-TAB>: completion back
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" <BS>: close popup and delete backward char.
inoremap <expr><BS> deoplete#smart_close_popup()."\<C-h>"

" neosnippet
inoremap <expr><tab> pumvisible() ? "\<C-n>" :
      \ neosnippet#expandable_or_jumpable() ?
      \    "\<Plug>(neosnippet_expand_or_jump)" : "\<tab>"

" Use auto delimiter
call deoplete#custom#set('_', 'converters', [
      \ 'converter_remove_paren',
      \ 'converter_remove_overlap',
      \ 'converter_truncate_abbr',
      \ 'converter_truncate_menu',
      \ 'converter_auto_delimiter',
      \ ])

let g:deoplete#enable_camel_case = 1
let g:deoplete#auto_complete_delay = 0
let g:deoplete#sources#clang#libclang_path='/usr/lib/llvm-3.8/lib/libclang-3.8.so.1'
let g:deoplete#sources#clang#clang_header='/usr/lib/llvm-3.8/lib/clang/3.8.1/include'
