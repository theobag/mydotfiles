set tabstop=2                                           " size of a hard tabstop
set softtabstop=2
set shiftwidth=2                                        " size of indent
set expandtab
set omnifunc=rubycomplete#Complete
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1
nnoremap <expr> O getline('.') =~ '^\s*#' ? 'O<esc>S' : 'O'
nnoremap <expr> o getline('.') =~ '^\s*#' ? 'o<esc>S' : 'o'
