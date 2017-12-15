set cindent
imap <expr> <CR> pumvisible() ? "\<c-y>" : "<Plug>delimitMateCR"
" by default, vim assumes all .h files to be C++ files
augroup project
	autocmd!
	autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
augroup END
