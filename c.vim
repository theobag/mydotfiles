set cindent
imap <expr> <CR> pumvisible() ? "\<c-y>" : "<Plug>delimitMateCR"
