setlocal omnifunc=go#complete#Complete
imap <expr> <CR> pumvisible() ? "\<c-y>" : "<Plug>delimitMateCR"
