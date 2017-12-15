let loaded_matchparen = 1
let g:matchparen_timeout = 2
let g:matchparen_insert_timeout = 2
imap <expr> <CR> pumvisible() ? "\<c-y>" : "<Plug>delimitMateCR"
