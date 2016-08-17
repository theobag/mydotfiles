set nocompatible              " be improved, required
filetype off                  " required
" ----------------------------------------------------------------------------------------
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'sjl/badwolf'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'sheerun/vim-polyglot'
Plugin 'majutsushi/tagbar'                              " sudo apt install exuberant-ctags
Plugin 'rip-rip/clang_complete'                         " sudo apt install clang
Plugin 'raimondi/delimitmate'                           " jump c-g g or just repeat the action
Plugin 'ervandew/supertab'	                            " c-v + tab for real tab
Plugin 'scrooloose/syntastic'
Plugin 'darfink/starsearch.vim'                         " dont jump next on star search
Plugin 'SearchComplete'                                 " tab completion inside search
Plugin 'ReplaceWithRegister'                            " gr and motion
Plugin 'kien/ctrlp.vim'
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
" ----------------------------------------------------------------------------------------
syntax enable                                           " syntax highlighting
set synmaxcol=2048                                      " Syntax coloring lines that are too long just slows down the world
set t_Co=256                                            " enable 256 color
set t_ut=                                               " disbale background color erase (BCE)
colorscheme badwolf
let g:badwolf_tabline = 0
set laststatus=2
set number
set ruler                                               " show the line number on the bar
set secure                                              " limit what modelines and autocmds can do
set cursorline
set cursorcolumn
set re=1                                                " fixes slow speed due to syntax highlighting
syntax sync minlines=256
" ----------------------------------------------------------------------------------------
function! CustomHighlighting()
    highlight clear Normal
    highlight clear NonText
    highlight clear SignColumn                          " SignColumn should match background
    highlight ColorColumn ctermbg=lightGrey
    highlight cursorlinenr ctermfg=blue
    highlight cursorline cterm=NONE ctermbg=234 ctermfg=NONE
    highlight cursorcolumn cterm=NONE ctermbg=234 ctermfg=NONE
endfunction
call CustomHighlighting()
" ----------------------------------------------------------------------------------------
function! MyAirline()
    let g:airline_theme ='hybrid'
    let g:airline_section_c = ""
    let g:airline_section_x = ""
    let g:airline_section_b = "%f"
    let g:airline_section_y = ""
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#left_sep = ''
    let g:airline#extensions#tabline#left_alt_sep = ''
    let g:airline#extensions#tabline#fnamemod = ':t'    " display only file name
    let g:airline#extensions#tabline#tab_nr_type = 1    " tab number
    let g:airline#extensions#whitespace#enabled = 0     " do not check for whitespaces
    let g:airline#extensions#tabline#show_buffers = 0   " dont display buffers in tab-bar with single tab
    let g:airline_powerline_fonts = 1
endfunction
call MyAirline()
" ----------------------------------------------------------------------------------------
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
set ttimeoutlen=200
set tabpagemax=10                                       " only show 10 tabs
set autoindent
set cindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
set smarttab
set textwidth=120
set backspace=indent,eol,start
set whichwrap+=<,>,h,l                                  " configure backspace so it acts as it should act
set comments=sl:/*,mb:\ *,elx:\ */
set omnifunc=syntaxcomplete#Complete
set wildmenu
set wildignore=*.o,*~,*.pyc
set iskeyword+=.,#,-,_                                  " .,#,-,_ recognize as word
set hidden                                              " allow to have buffers with unsaved changes
set nowrap                                              " dont wrap lines by default
set showmatch
set showcmd                                             " this shows what you are typing as a command
set noshowmode                                          " hide insert status
set autowrite                                           " Automatically save before commands like :next and :make
set autoread                                            " set to auto read when file is changed from outside
set autochdir
set complete-=i
set completeopt=menu,menuone                            " clang_complete without preview
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
" ----------------------------------------------------------------------------------------
let mapleader = "\<Space>"
" ; == : in normal mode
noremap ; :
noremap : ;
" make Y yank to end of line (like D, or C)
noremap Y y$
" highlight last inserted text
nnoremap gV `[v`]
" go to position of last edit. mean: 'go to edit'
nnoremap ge `.
" split line with K
nnoremap K i<CR><ESC>
" man page
nnoremap <F10> K
" paste multiple lines multiple times with simple ppppp
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]
" ----------------------------------------------------------------------------------------
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
nnoremap <silent> <Leader>e :e<space>
nnoremap <silent> <Leader>E :tabedit<space>
nnoremap <silent> <Leader>+ :tabm+<CR>
nnoremap <silent> <Leader>- :tabm-<CR>
nnoremap <silent> <Leader>! :au! BufWritePost *.c :!<space>
" visual mode with leader twice
nnoremap <Leader><Leader> V
" syntastic shortcut
nnoremap <silent> <Leader>so :Errors<CR>
nnoremap <silent> <Leader>sl :lclose<CR>
noremap <silent> <leader>sy :SyntasticToggleMode<cr>
" save mysql last query
noremap <Leader>z :w! /tmp/query.sql\| w!<CR>
noremap <Leader>Z :w! /tmp/query.sql\| wq!<CR>
" ----------------------------------------------------------------------------------------
" copy and paste to system clipboard
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
nnoremap <silent> <C-@> <Esc>:noh<CR>
vnoremap <silent> <C-@> <Esc>gV
onoremap <silent> <C-@> <Esc>
cnoremap <silent> <C-@> <C-c>
inoremap <silent> <C-@> <Esc>`^
" ----------------------------------------------------------------------------------------
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
" ----------------------------------------------------------------------------------------
" tagbar
nnoremap <silent> <F8> :TagbarToggle<CR>
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
" ----------------------------------------------------------------------------------------
function! MySuperTab()
    let g:SuperTabDefaultCompletionType = "context"
    let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
    let g:SuperTabNoCompleteAfter = ['^', ',', '\s']
    let g:SuperTabCrMapping = 1                         " no newline on supertab
    let g:SuperTabClosePreviewOnPopupClose = 1          " autoclose popup
    runtime! plugin/supertab.vim                        " real tabs with shift+tab
    inoremap <s-tab> <tab>
endfunction
call MySuperTab()
" ----------------------------------------------------------------------------------------
let g:ctrlp_match_window = 'bottom,order:ttb,results:100'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor                " use ag over Grep
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    let g:ctrlp_use_caching = 0                         " ag is fast enough that CtrlP doesn't need to cache
endif
" ----------------------------------------------------------------------------------------
highlight SyntasticError guibg=#2f0000
let g:netrw_liststyle = 2
let g:netrw_banner = 0
" ----------------------------------------------------------------------------------------
let g:clang_library_path ='/usr/lib/x86_64-linux-gnu/libclang-3.8.so.1'
let g:clang_close_preview = 1
let g:clang_user_options = '|| exit 0'
" ----------------------------------------------------------------------------------------
