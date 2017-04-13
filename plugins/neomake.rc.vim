autocmd! BufEnter, BufWritePost * Neomake
" for c/c++
let g:neomake_cpp_enabled_makers = ['gcc', 'clang']
" for python
let g:neomake_python_enabled_makers = ['python', 'flake8', 'mypy']

