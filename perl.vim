set iskeyword+=:        " It will then auto-complete module names, etc.
setlocal equalprg=perltidy\ -st
let g:syntastic_perl_checkers = ['perl', 'podchecker']
let g:syntastic_enable_perl_checker = 1
