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
Plugin 'brookhong/cscope.vim'                           " sudo apt install cscope
Plugin 'rip-rip/clang_complete'                         " sudo apt install clang
Plugin 'scrooloose/syntastic'
Plugin 'raimondi/delimitmate'                           " jump c-g g or just repeat the action
Plugin 'ervandew/supertab'	                            " c-v + tab for real tab
Plugin 'rhysd/clever-f.vim'                             " use f or F repeat last command
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'henrik/vim-indexed-search'
Plugin 'darfink/starsearch.vim'                         " dont jump next on star search
Plugin 'terryma/vim-smooth-scroll'
Plugin 'matze/vim-move'
Plugin 'ReplaceWithRegister'                            " gr and motion
Plugin 'argtextobj.vim'                                 " argument text object eg. dia, cia, via, daa ..
Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-textobj-entire'                        " motion plus ae or ie to select entire
Plugin 'kana/vim-textobj-function'
Plugin 'tpope/vim-eunuch'                               " bash commands
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'	                        " gc + motion or line with gcc
Plugin 'tpope/vim-unimpaired'                           " pair maps and stuff
Plugin 'ivalkeen/vim-simpledb'
call vundle#end()             " required
filetype plugin indent on     " required
" ----------------------------------------------------------------------------------------
" GENERAL
" ----------------------------------------------------------------------------------------
syntax sync minlines=256
set re=1                                                " fixes slow speed due to syntax highlighting
set synmaxcol=1000                                      " syntax coloring lines that are too long just slows down the world
set t_ut=                                               " disbale background color erase (BCE)
set t_Co=256                                            " enable 256 color
set laststatus=2
set number
set relativenumber
set ruler                                               " show the line number on the bar
set secure                                              " limit what modelines and autocmds can do
set cursorline
set cursorcolumn
set nostartofline                                       " keep cursor column pos
set termencoding=utf-8
set ttimeoutlen=100                                     " speed esc
set tabpagemax=12                                       " only show 12 tabs
set switchbuf=usetab                                    " if opening buffer, search first in opened windows.
set autoindent
set cindent
set smartindent
set tabstop=4                                           " size of a hard tabstop
set softtabstop=4
set shiftwidth=4                                        " size of indent
set shiftround                                          " use multiple of shiftwidth when indenting with '<' and '>'
set expandtab
set smarttab
set textwidth=120
set backspace=indent,eol,start
set omnifunc=syntaxcomplete#Complete
set wildmenu
set wildignore=*.o,*~,*.pyc
set hidden                                              " allow to have buffers with unsaved changes
set nowrap                                              " dont wrap lines by default
set showmatch
set matchtime=3
set showcmd                                             " this shows what you are typing as a command
set noshowmode                                          " hide insert status
set autowrite                                           " automatically save before commands like :next and :make
set autoread                                            " set to auto read when file is changed from outside
set autochdir
set complete-=i
set completeopt=menu,menuone                            " clang complete without preview
set pumheight=20                                        " limit popup menu height (completion) or max 20 whatever
set incsearch                                           " search as characters are entered
set hlsearch                                            " highlight matches
set gdefault                                            " for search and replace
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
set history=1000
set backup
set backupext=.bak                                      " save backup with bak extension
set backupdir=~/.vim/backup
set directory=~/.vim/tmp
set undofile
set undodir^=~/.vim/undo
set viminfo='20,\"100                                   " read/write a .viminfo file, don't store more than 100 lines
set tags=tags;~/                                        " look for the file in the current directory, then south until you reach home.
set listchars=tab:▸\ ,trail:·,extends:❯,precedes:❮,nbsp:×
" ----------------------------------------------------------------------------------------
" COLORS
" ----------------------------------------------------------------------------------------
" color scheme
colorscheme badwolf
let g:badwolf_tabline = 0
" highlight and stuff
highlight clear signcolumn                              " signcolumn should match background
highlight colorcolumn ctermbg=lightgrey
highlight cursorlinenr ctermfg=lightblue
highlight cursorline cterm=NONE ctermbg=234 ctermfg=NONE
highlight cursorcolumn cterm=NONE ctermbg=234 ctermfg=NONE
" airline
let g:airline_theme ='hybrid'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#fnamemod = ':t'        " display only file name
let g:airline#extensions#tabline#tab_nr_type = 1        " tab number
let g:airline#extensions#tabline#show_buffers = 0       " dont display buffers in tab-bar with single tab
let g:airline#extensions#whitespace#enabled = 0         " do not check for whitespaces
let g:airline_section_x = ""
let g:airline_section_b = "%f"
let g:airline_section_y = ""
let g:airline_section_c = '%<%F%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#'
" ----------------------------------------------------------------------------------------
" PLUGINS
" ----------------------------------------------------------------------------------------
" vim move : use c-k and c-j to move current line/selection to up and down
let g:move_key_modifier = 'C'
" netrw
let g:netrw_liststyle = 2
let g:netrw_banner = 0
" clever tab only one line search
let g:clever_f_across_no_line = 1
let g:clever_f_fix_key_direction = 1
" ag disbale message
let g:ag_mapping_message = 0
nnoremap <Leader>A :Ag!<space>
" tagbar
let g:tagbar_sort = 0                                   " order tags based on file order; don't sort alphabetically
nnoremap <silent> <F8> :TagbarToggle<CR>
" delimitmate
let delimitMate_expand_space = 1
imap <expr> <CR> pumvisible() ? "\<c-y>" : "<Plug>delimitMateCR"
" toggle tabs and buffers
let notabs = 0
nnoremap <silent> <F10> :let notabs=!notabs<Bar>:if
            \ notabs<Bar>:tabo<Bar>:else<Bar>:tab ball<Bar>:tabn<Bar>:endif<CR>
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
let g:syntastic_check_on_wq = 0                         " skip check on :wq, :x, :ZZ etc
highlight SyntasticError guibg=#2f0000
nnoremap <silent> <Leader>so :Errors<CR>
nnoremap <silent> <Leader>sl :lclose<CR>
noremap <silent> <Leader>sy :SyntasticToggleMode<cr>
" supertab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
let g:SuperTabNoCompleteAfter = ['^', ',', '\s']
let g:SuperTabCrMapping = 1                             " no newline on supertab
let g:SuperTabClosePreviewOnPopupClose = 1              " autoclose popup
runtime! plugin/supertab.vim                            " real tabs with shift+tab
inoremap <s-tab> <tab>
" ctrlp
set grepprg=ag\ --nogroup\ --nocolor                    " use ag over grep
let g:ctrlp_match_window = 'bottom,order:ttb,results:35'
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0                             " ag is fast enough that CtrlP doesn't need to cache
nnoremap <silent> <C-p> :CtrlP .<cr>
nnoremap <silent> <Leader>b :CtrlPBuffer<cr>
nnoremap <silent> <Leader>n :CtrlP ~<cr>
nnoremap <silent> <Leader>m :CtrlPMRUFiles<cr>
" ----------------------------------------------------------------------------------------
" MAPS
" ----------------------------------------------------------------------------------------
" make Y yank to end of line (like D, or C)
noremap Y y$
" go to position of last edit. mean: 'go to edit'
nnoremap ge `.
" highlight last inserted text
nnoremap gV `[v`]
" select last pasted text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'
" please use leader K to see man page
nnoremap K <Nop>
" too much accident, please use leader J instead
nnoremap J <Nop>
nnoremap <Leader>J J
" add one space
nnoremap [s i<space><esc>
nnoremap ]s a<space><esc>
" use C-Space to Esc out of any mode but terminal sees <C-@> as <C-space> WTF, but ok
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
" re-select visual block after indenting
vnoremap < <gv
vnoremap > >gv
" move tab
nnoremap <silent> + :tabm+<CR>
nnoremap <silent> - :tabm-<CR>
" paste multiple lines multiple times with simple ppppp
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]
" moving around in command mode ctrl+b & ctrl+e move beginning and end
cnoremap <C-l> <right>
cnoremap <C-h> <left>
cnoremap <C-k> <S-Right>
cnoremap <C-j> <S-Left>
" save mysql last query
noremap <Leader>z :w! /tmp/query.sql\| w!<CR>
noremap <Leader>Z :w! /tmp/query.sql\| wq!<CR>
" use j/k to start, then scroll through autocomplete options
inoremap <expr> <C-j> ((pumvisible())?("\<C-n>"):("\<C-x><c-n>"))
inoremap <expr> <C-k> ((pumvisible())?("\<C-p>"):("\<C-x><c-k>"))
" stop autocomment on nextline
nnoremap <expr> O getline('.') =~ '^\s*//' ? 'O<esc>S' : 'O'
nnoremap <expr> o getline('.') =~ '^\s*//' ? 'o<esc>S' : 'o'
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
" type the leader++
nnoremap <silent> <Leader>w :w!<CR>
nnoremap <silent> <Leader>W :wa!<CR>
nnoremap <silent> <Leader>x :x!<CR>
nnoremap <silent> <Leader>q :q<CR>
nnoremap <silent> <Leader>Q :q!<CR>
nnoremap <silent> <Leader>r :bd<CR>
nnoremap <silent> <Leader>R :bd!<CR>
nnoremap <silent> <Leader>t :e .<CR>
nnoremap <silent> <Leader>T :e ~/<CR>
nnoremap <leader>E :e ~/
nnoremap <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <Leader>! :au! BufWritePost *.c :!<space>
nnoremap <Leader>@ :au! BufWritePost *.pas :! fpc<space>
nnoremap <Leader># :au! BufWritePost *.py :! python<space>
nnoremap <Leader>$ :au! BufWritePost *.pl :! perl<space>
nnoremap <Leader>% :au! BufWritePost *.go :! go build<space>
nnoremap <Leader><Leader> V
" disable arrow and prevent show weird characters
nnoremap <silent> <ESC>OA <Nop>
nnoremap <silent> <ESC>OB <Nop>
nnoremap <silent> <ESC>OC <Nop>
nnoremap <silent> <ESC>OD <Nop>
inoremap <silent> <ESC>OA <Nop>
inoremap <silent> <ESC>OB <Nop>
inoremap <silent> <ESC>OC <Nop>
inoremap <silent> <ESC>OD <Nop>
cnoremap <silent> <ESC>OA <Nop>
cnoremap <silent> <ESC>OB <Nop>
cnoremap <silent> <ESC>OC <Nop>
cnoremap <silent> <ESC>OD <Nop>
vnoremap <silent> <ESC>OA <Nop>
vnoremap <silent> <ESC>OB <Nop>
vnoremap <silent> <ESC>OC <Nop>
vnoremap <silent> <ESC>OD <Nop>
onoremap <silent> <ESC>OA <Nop>
onoremap <silent> <ESC>OB <Nop>
onoremap <silent> <ESC>OC <Nop>
onoremap <silent> <ESC>OD <Nop>
" ----------------------------------------------------------------------------------------
" AUTOCMD & FUNCTIONS
" ----------------------------------------------------------------------------------------
" man page, use leader K to open it or :Man 3 {option} in command mode
runtime! ftplugin/man.vim
" remove any trailing whitespace that is in the file
autocmd BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif
" auto remove multiple empty lines at the end of line
autocmd BufWrite * :%s/\(\s*\n\)\+\%$//ge
" replace groups or function of empty or whitespaces-only lines with one empty line
autocmd BufWrite *.c :%s/\(\s*\n\)\{3,}/\r\r/ge
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
" display the numbered register(:Reg), press a key and paste it to the buffer
function! Reg()
    reg
    echo "Register: "
    let char = nr2char(getchar())
    if char != "\<Esc>"
        execute "normal! \"".char."p"
    endif
    redraw
endfunction
command! -nargs=0 Reg call Reg()
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
