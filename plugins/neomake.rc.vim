autocmd! BufWritePost * Neomake "run neomake when you save the file.
" for c/c++
let g:neomake_cpp_enabled_makers = ['clang']
let g:neomake_cpp_clang_args = ["-std=c++14", "-Wextra", "-Wall", "-fsanitize=undefined", "-g"]
" for python
let g:neomake_python_enabled_makers = ['pep8', 'flake8', 'mypy']

