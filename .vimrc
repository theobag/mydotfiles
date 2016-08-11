set nocompatible              " be improved, required
filetype off                  " required

" set the runtime path to include vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'sjl/badwolf'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'sheerun/vim-polyglot'
Plugin 'majutsushi/tagbar'                          " sudo apt install exuberant-ctags
Plugin 'rip-rip/clang_complete'                     " sudo apt install clang
Plugin 'raimondi/delimitmate'                       " jump <c-g>g or just repeat the action
Plugin 'ervandew/supertab'	                        " c-v+tab for real tab
Plugin 'scrooloose/syntastic'
Plugin 'darfink/starsearch.vim'                     " dont jump next on star search
Plugin 'ReplaceWithRegister'                        " gr and motion
Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-textobj-entire'                    " motion plus ae or ie to select entire
Plugin 'tpope/vim-unimpaired'                       " [ maps and stuff
Plugin 'tpope/vim-capslock'                         " insert: c-l or c-g+c, normal: gC
Plugin 'tpope/vim-eunuch'                           " bash commands
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'	                    " gc + motion or line == gcc
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
call vundle#end()             " required
filetype plugin indent on     " required

set t_Co=256
syntax enable
colorscheme badwolf
let g:badwolf_tabline = 0
set modeline
set secure                                          " limit what modelines and autocmds can do
set laststatus=2
set number
set ruler                                           " show the line number on the bar
set cursorline
set cursorcolumn
hi cursorlinenr ctermfg=blue
hi cursorline cterm=NONE ctermbg=234 ctermfg=NONE
hi cursorcolumn cterm=NONE ctermbg=234 ctermfg=NONE
" ----------------------------------------------------------------------------------------
let g:airline_theme='hybrid'
let g:airline_section_c=""
let g:airline_section_x=""
let g:airline_section_b="%f"
let g:airline_section_y=""
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline_powerline_fonts = 1
let g:airline_inactive_collapse = 0
let g:airline_enable_fugitive=0
let g:airline_enable_syntastic=1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" ----------------------------------------------------------------------------------------
let g:netrw_liststyle = 2
" ----------------------------------------------------------------------------------------
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
set timeoutlen=800
set ttimeoutlen=50
set autoindent
set cindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set textwidth=120
set backspace=indent,eol,start
set showmatch
set comments=sl:/*,mb:\ *,elx:\ */
set omnifunc=syntaxcomplete#Complete
set wildmenu
set wildignore=*.o,*~,*.pyc
set showcmd                                         " this shows what you are typing as a command
set noshowmode                                      " hide insert status
set nowrap                                          " dont wrap lines by default
set autochdir                                       " auto directory
set autowrite                                       " Automatically save before commands like :next and :make
set autoread                                        " set to auto read when file is changed from outside
set complete-=i
set completeopt=menu,menuone                        " clang_complete without preview
set pumheight=20                                    " limit popup menu height (supertab)
set hidden
set ttyfast                                         " smoother changer
set lazyredraw                                      " don't update while executing macros
set title                                           " show title in console title bar
set titlestring=%t                                  " only title not PATH
set scrolloff=1                                     " keep at least 1 lines above/below
set sidescrolloff=5                                 " keep at least 5 lines left/right
set incsearch                                       " search as characters are entered
set hlsearch                                        " highlight matches
set titleold=                                       " don't set the title to 'Thank for flaying Vim' when exiting
set history=200
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp
" ----------------------------------------------------------------------------------------
let mapleader = "\<Space>"
" ----------------------------------------------------------------------------------------
" ; == : in normal mode
noremap ; :
noremap : ;
" make Y yank to end of line (like D, or C)
noremap Y y$
" jj == esc
inoremap jj <Esc>
" highlight last inserted text
nnoremap gV `[v`]
" go to position of last edit. mean: 'go to edit'
nnoremap ge `.
" split line with K
nnoremap K i<CR><ESC>
" paste multiple lines multiple times with simple ppppp
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]
" ----------------------------------------------------------------------------------------
" type the leader++
nnoremap <Leader>w :w<CR>
nnoremap <Leader>x :x<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>a :wqa<CR>
nnoremap <Leader>n :q!<CR>
nnoremap <Leader>b :bd<CR>
nnoremap <Leader>m :bd!<CR>
nnoremap <Leader>t :Texplore<CR>
nnoremap <Leader>e :tabedit<space>
nnoremap <Leader>o :tabonly<CR>
nnoremap <Leader>+ :tabm+<CR>
nnoremap <Leader>- :tabm-<CR>
nnoremap <Leader>! :au! BufWritePost *.c :!<space>
" use leader h/j/k/l to switch between split
nnoremap <Leader>h <c-w>h
nnoremap <Leader>j <c-w>j
nnoremap <Leader>k <c-w>k
nnoremap <Leader>l <c-w>l
" visual mode with leader twice
nnoremap <Leader><Leader> V
" syntastic shortcut
nnoremap <Leader>so :Errors<CR>
nnoremap <Leader>sl :lclose<CR>
noremap <silent> <leader>sy :SyntasticToggleMode<cr>
" save mysql last query
noremap <Leader>z :w! /tmp/query.sql\| w!<CR>
noremap <Leader>Z :w! /tmp/query.sql\| wq!<CR>
" ----------------------------------------------------------------------------------------
" copy and paste to system clipboard
noremap <Leader>r "+
vnoremap <Leader>r "+
noremap <Leader>y "+y
noremap <Leader>Y "+y$
vnoremap <Leader>y "+y
noremap <Leader>d "+d
noremap <Leader>D "+D
vnoremap <Leader>d "+d
noremap <Leader>p "+p
noremap <Leader>P "+P
vnoremap <Leader>p "+p
vnoremap <Leader>P "+P
" ----------------------------------------------------------------------------------------
" use C-Space to Esc out of any mode but Terminal sees <C-@> as <C-space> WTF, but ok
nnoremap <C-@> <Esc>:noh<CR>
vnoremap <C-@> <Esc>gV
onoremap <C-@> <Esc>
cnoremap <C-@> <C-c>
inoremap <C-@> <Esc>`^
" ----------------------------------------------------------------------------------------
" hit enter to go end of line and hit 12 + enter to jump line 12
noremap <CR> G
" move the beginning/end of line
noremap B ^
noremap E g_
" center screen on next/previous selection.
nnoremap n nzz
nnoremap N Nzz
" j == gj
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
" move cursor together with the screen
nnoremap <C-j> j<c-e>
nnoremap <C-k> k<c-y>
" moving around in command mode
cnoremap <C-l> <right>
cnoremap <C-h> <left>
cnoremap <C-k> <S-Right>
cnoremap <C-j> <S-Left>
" ----------------------------------------------------------------------------------------
" tagbar
nnoremap <F8> :TagbarToggle<CR>
" ----------------------------------------------------------------------------------------
" remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif
" ----------------------------------------------------------------------------------------
" use j/k to start, then scroll through autocomplete options
inoremap <expr> <C-j> ((pumvisible())?("\<C-n>"):("\<C-x><c-n>"))
inoremap <expr> <C-k> ((pumvisible())?("\<C-p>"):("\<C-x><c-k>"))
" ----------------------------------------------------------------------------------------
" stop autocomment on nextline
nnoremap <expr> O getline('.') =~ '^\s*//' ? 'O<esc>S' : 'O'
nnoremap <expr> o getline('.') =~ '^\s*//' ? 'o<esc>S' : 'o'
" ----------------------------------------------------------------------------------------
" auto indent delimitmate after enter and expand with space
imap <expr> <CR> pumvisible() ? "\<c-y>" : "<Plug>delimitMateCR"
let delimitMate_expand_space = 1
" ----------------------------------------------------------------------------------------
" by default, vim assumes all .h files to be C++ files
augroup project
    autocmd!
    autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
augroup END
" ----------------------------------------------------------------------------------------
" activate alt
for i in range(65,90) + range(97,122)
    let c = nr2char(i)
    exec "map \e".c." <M-".c.">"
    exec "map! \e".c." <M-".c.">"
endfor
" ----------------------------------------------------------------------------------------
" vp doesn't replace paste buffer
function! RestoreRegister()
    let @" = s:restore_reg
    return ''
endfunction
function! s:Repl()
    let s:restore_reg = @"
    return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()
" ----------------------------------------------------------------------------------------
" movement between tabs or buffers
nnoremap <C-l> :call MyNext()<CR>
nnoremap <C-h> :call MyPrev()<CR>
" MyNext() and MyPrev(): movement between tabs OR buffers
function! MyNext()
    if exists( '*tabpagenr' ) && tabpagenr('$') != 1
        normal gt
    else
        execute ":bnext"
    endif
endfunction
function! MyPrev()
    if exists( '*tabpagenr' ) && tabpagenr('$') != '1'
        normal gT
    else
        execute ":bprev"
    endif
endfunction
" ----------------------------------------------------------------------------------------
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
let g:SuperTabNoCompleteAfter = ['^', ',', '\s']
let g:SuperTabCrMapping = 1                         " no newline on supertab
let g:SuperTabClosePreviewOnPopupClose = 1          " autoclose popup
runtime! plugin/supertab.vim                        " real tabs with shift+tab
inoremap <s-tab> <tab>
" ----------------------------------------------------------------------------------------
highlight SyntasticError guibg=#2f0000
" ----------------------------------------------------------------------------------------
let g:clang_library_path ='/usr/lib/x86_64-linux-gnu/libclang-3.8.so.1'
let g:clang_close_preview = 1
let g:clang_user_options = '|| exit 0'
" ----------------------------------------------------------------------------------------
let g:ctrlp_match_window = 'bottom,order:ttb'       " order mathcing files top to bottom
let g:ctrlp_switch_buffer = 0                       " always open in new buffer
let g:ctrlp_working_path_mode = 0                   " lets us change the working directory
let g:ctrlp_use_caching = 0
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
    let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
    let g:ctrlp_prompt_mappings = {
                \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
                \ }
endif
" ----------------------------------------------------------------------------------------
