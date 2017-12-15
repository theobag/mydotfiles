set omnifunc=csscomplete#CompleteCSS
imap <expr> <CR> pumvisible() ? "\<c-y>" : "<Plug>delimitMateCR"
