set nocompatible              " be improved, required
filetype off                  " required

let mapleader = "\<Space>"

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'sjl/badwolf'
Plugin 'mhinz/vim-startify'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'sheerun/vim-polyglot'
Plugin 'majutsushi/tagbar'                              " sudo apt install exuberant-ctags
Plugin 'rip-rip/clang_complete'                         " sudo apt install clang
Plugin 'scrooloose/syntastic'
Plugin 'raimondi/delimitmate'                           " jump c-g g or just repeat the action
Plugin 'ervandew/supertab'	                            " c-v + tab for real tab
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'darfink/starsearch.vim'                         " dont jump next on star search
Plugin 'henrik/vim-indexed-search'
Plugin 'SearchComplete'                                 " tab completion inside search
Plugin 'terryma/vim-smooth-scroll'
Plugin 'ReplaceWithRegister'                            " gr and motion
Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-textobj-entire'                        " motion plus ae or ie to select entire
Plugin 'tpope/vim-unimpaired'                           " pair maps and stuff
Plugin 'tpope/vim-eunuch'                               " bash commands
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'	                        " gc + motion or line with gcc
Plugin 'tpope/vim-fugitive'
Plugin 'ivalkeen/vim-simpledb'
call vundle#end()             " required
filetype plugin indent on     " required

syntax enable                                           " syntax highlighting
syntax sync minlines=256
set re=1                                                " fixes slow speed due to syntax highlighting
set synmaxcol=1000                                      " syntax coloring lines that are too long just slows down the world
set t_ut=                                               " disbale background color erase (BCE)
set t_Co=256                                            " enable 256 color
set laststatus=2
set number
set ruler                                               " show the line number on the bar
set secure                                              " limit what modelines and autocmds can do
set cursorline
set cursorcolumn
set enc=utf-8                                           " encoding used for displaying file
set fenc=utf-8                                          " encoding used when saving file
set termencoding=utf-8
set ttimeoutlen=200                                     " speed esc
set tabpagemax=10                                       " only show 10 tabs
set autoindent
set cindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround                                          " use multiple of shiftwidth when indenting with '<' and '>'
set expandtab
set smarttab
set textwidth=120
set backspace=indent,eol,start
set comments=sl:/*,mb:\ *,elx:\ */
set omnifunc=syntaxcomplete#Complete
set wildmenu
set wildignore=*.o,*~,*.pyc
set hidden                                              " allow to have buffers with unsaved changes
set nowrap                                              " dont wrap lines by default
set showmatch
set showcmd                                             " this shows what you are typing as a command
set noshowmode                                          " hide insert status
set autowrite                                           " automatically save before commands like :next and :make
set autoread                                            " set to auto read when file is changed from outside
set autochdir
set complete-=i
set completeopt=menu,menuone                            " clang complete without preview
set pumheight=20                                        " limit popup menu height (completion)
set incsearch                                           " search as characters are entered
set hlsearch                                            " highlight matches
set confirm                                             " ask to save buffer
set nojoinspaces	  	                                " use only one space after '.' when joining
set lazyredraw                                          " don't update while executing macros
set ttyfast                                             " smoother changer
set title                                               " show title in console title bar
set titlestring=%t                                      " only title not PATH
set scrolloff=1                                         " keep at least 1 lines above/below
set sidescrolloff=5                                     " keep at least 5 lines left/right
set shortmess+=I                                        " don't display the intro message on starting vim.
set titleold=                                           " don't display 'Thank for flaying Vim' when exiting
set history=200
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp
set viminfo='20,\"50                                    " read/write a .viminfo file, don't store more than 50 lines

" ----------------------------------------------------------------------------------------
                                        " PLUGINS
" ----------------------------------------------------------------------------------------
" color scheme
colorscheme badwolf
let g:badwolf_tabline = 0
" highlight
highlight clear SignColumn                              " signcolumn should match background
highlight ColorColumn ctermbg=lightGrey
highlight cursorlinenr ctermfg=lightblue
highlight cursorline cterm=NONE ctermbg=234 ctermfg=NONE
highlight cursorcolumn cterm=NONE ctermbg=234 ctermfg=NONE
" airline
let g:airline_theme ='hybrid'
let g:airline_section_c = ""
let g:airline_section_x = ""
let g:airline_section_b = "%f"
let g:airline_section_y = ""
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#fnamemod = ':t'        " display only file name
let g:airline#extensions#tabline#tab_nr_type = 1        " tab number
let g:airline#extensions#whitespace#enabled = 0         " do not check for whitespaces
let g:airline#extensions#tabline#show_buffers = 0       " dont display buffers in tab-bar with single tab
let g:airline_powerline_fonts = 1
" tagbar
nnoremap <silent> <F8> :TagbarToggle<CR>
" netrw
let g:netrw_liststyle = 2
let g:netrw_banner = 0
" delimitmate
imap <expr> <CR> pumvisible() ? "\<c-y>" : "<Plug>delimitMateCR"
let delimitMate_expand_space = 1
" clang
let g:clang_library_path ='/usr/lib/x86_64-linux-gnu/libclang-3.8.so.1'
let g:clang_close_preview = 1
let g:clang_user_options = '|| exit 0'
" smooth_scroll
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>
" syntastic
nnoremap <silent> <Leader>so :Errors<CR>
nnoremap <silent> <Leader>sl :lclose<CR>
noremap <silent> <Leader>sy :SyntasticToggleMode<cr>
highlight SyntasticError guibg=#2f0000
let g:syntastic_check_on_wq = 0                         " skip check on :wq, :x, :ZZ etc
" supertab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
let g:SuperTabNoCompleteAfter = ['^', ',', '\s']
let g:SuperTabCrMapping = 1                             " no newline on supertab
let g:SuperTabClosePreviewOnPopupClose = 1              " autoclose popup
runtime! plugin/supertab.vim                            " real tabs with shift+tab
inoremap <s-tab> <tab>
" ctrlp
nnoremap <silent> <Leader>n :CtrlP ~<cr>
nnoremap <silent> <Leader>b :CtrlPBuffer<cr>
nnoremap <silent> <Leader>m :CtrlPMRUFiles<cr>
let g:ctrlp_match_window = 'bottom,order:ttb,results:35'
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor                " use ag over grep
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    let g:ctrlp_use_caching = 0                         " ag is fast enough that CtrlP doesn't need to cache
endif

" ----------------------------------------------------------------------------------------
                                        " MAPS
" ----------------------------------------------------------------------------------------
" make Y yank to end of line (like D, or C)
noremap Y y$
" go to position of last edit. mean: 'go to edit'
nnoremap ge `.
" highlight last inserted text
nnoremap gV `[v`]
" split line with K
nnoremap K i<CR><ESC>
" man page
nnoremap <F10> K
" paste multiple lines multiple times with simple ppppp
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" type the leader++
nnoremap <silent> <Leader>w :w!<CR>
nnoremap <silent> <Leader>W :wa!<CR>
nnoremap <silent> <Leader>x :x!<CR>
nnoremap <silent> <Leader>q :q<CR>
nnoremap <silent> <Leader>Q :q!<CR>
nnoremap <silent> <Leader>r :bd<CR>
nnoremap <silent> <Leader>R :bd!<CR>
nnoremap <silent> <Leader>a :wqa!<CR>
nnoremap <silent> <Leader>t :Texplore<CR>
nnoremap <silent> <Leader>T :Texplore.<CR>
nnoremap <Leader>e :e<space>
nnoremap <Leader>E :tabedit<space>
nnoremap <Leader>! :au! BufWritePost *.c :!<space>
" visual mode with leader twice
nnoremap <Leader><Leader> V
" save mysql last query
noremap <Leader>z :w! /tmp/query.sql\| w!<CR>
noremap <Leader>Z :w! /tmp/query.sql\| wq!<CR>
" copy and paste to system clipboard
nnoremap <Leader>y "+y
nnoremap <Leader>Y "+y$
vnoremap <Leader>y "+y
nnoremap <Leader>d "+d
nnoremap <Leader>D "+D
vnoremap <Leader>d "+d
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P
vnoremap <Leader>p "+p
vnoremap <Leader>P "+P

" use C-Space to Esc out of any mode but Terminal sees <C-@> as <C-space> WTF, but ok
inoremap <C-@> <Esc>`^
vnoremap <C-@> <Esc>gV
onoremap <C-@> <Esc>
cnoremap <C-@> <C-c>
nnoremap <C-@> <Esc>:noh<CR>

" hit enter to go end of line and hit 12 + enter to jump line 12
noremap <CR> G
" move the beginning/end of line
noremap B ^
noremap E g_
" center screen on next/previous selection.
nnoremap n nzz
nnoremap N Nzz
" easier horizontal scrolling
nnoremap zl zL
nnoremap zh zH
" move tab
nnoremap <silent> + :tabm+<CR>
nnoremap <silent> - :tabm-<CR>
" j == gj
nnoremap <silent> j gj
nnoremap <silent> k gk
vnoremap <silent> j gj
vnoremap <silent> k gk
" move cursor together with the screen
nnoremap <C-j> j<c-e>
nnoremap <C-k> k<c-y>
" moving around in command mode
cnoremap <C-l> <right>
cnoremap <C-h> <left>
cnoremap <C-k> <S-Right>
cnoremap <C-j> <S-Left>

" use j/k to start, then scroll through autocomplete options
inoremap <expr> <C-j> ((pumvisible())?("\<C-n>"):("\<C-x><c-n>"))
inoremap <expr> <C-k> ((pumvisible())?("\<C-p>"):("\<C-x><c-k>"))
" stop autocomment on nextline
nnoremap <expr> O getline('.') =~ '^\s*//' ? 'O<esc>S' : 'O'
nnoremap <expr> o getline('.') =~ '^\s*//' ? 'o<esc>S' : 'o'
" remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif
" remove multiple empty lines
function! DeleteMultipleEmptyLines()
    g/^\_$\n\_^$/d
endfunction
nnoremap <leader>ld :call DeleteMultipleEmptyLines()<CR>
" by default, vim assumes all .h files to be C++ files
augroup project
    autocmd!
    autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
augroup END
" activate alt
for i in range(65,90) + range(97,122)
    let c = nr2char(i)
    exec "map \e".c." <M-".c.">"
    exec "map! \e".c." <M-".c.">"
endfor
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
" movement between tabs or buffers
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
nnoremap <silent> <C-l> :call MyNext()<CR>
nnoremap <silent> <C-h> :call MyPrev()<CR>
