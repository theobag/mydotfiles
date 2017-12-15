set expandtab
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1
nnoremap <expr> O getline('.') =~ '^\s*#' ? 'O<esc>S' : 'O'
nnoremap <expr> o getline('.') =~ '^\s*#' ? 'o<esc>S' : 'o'
