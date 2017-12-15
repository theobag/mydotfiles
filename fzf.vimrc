set nocompatible              " be improved, required
filetype off                  " required
let mapleader = "\<Space>"

call plug#begin('~/.vim/plugged')
Plug 'sjl/badwolf'
Plug 'mhinz/vim-startify'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'
Plug 'majutsushi/tagbar'                              " sudo apt install exuberant-ctags
Plug 'rip-rip/clang_complete', {'for': ['c', 'cpp']}  " sudo apt install clang
Plug 'scrooloose/syntastic'
Plug 'raimondi/delimitmate'                           " jump c-g g or just repeat the action
Plug 'ervandew/supertab'	                            " c-v + tab for real tab
Plug '~/.fzf'
Plug 'rhysd/clever-f.vim'                             " use f or F repeat last command
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rking/ag.vim'
Plug 'henrik/vim-indexed-search'
Plug 'darfink/starsearch.vim'                         " dont jump next on star search
Plug 'terryma/vim-smooth-scroll'
Plug 'matze/vim-move'
Plug 'vim-scripts/ReplaceWithRegister'								" gr and motion
Plug 'vim-scripts/argtextobj.vim'											" argument text object eg. dia, cia, via, daa ..
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'                        " motion plus ae or ie to select entire
Plug 'kana/vim-textobj-function'
Plug 'tpope/vim-eunuch'                               " bash commands
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'														" gc + motion or line with gcc
Plug 'tpope/vim-unimpaired'                           " pair maps and stuff
Plug 'vim-scripts/loremipsum'
Plug 'ap/vim-css-color', {'for': ['css']}
Plug 'ivalkeen/vim-simpledb', {'for': ['sql']}
Plug 'tpope/vim-endwise', {'for': ['ruby']}
Plug 'tpope/vim-rails', {'for': ['ruby']}
Plug 'vim-ruby/vim-ruby', {'for': ['ruby']}
Plug 'othree/html5.vim', {'for': ['html']}
Plug 'gregsexton/matchtag', {'for': ['html']}
Plug 'docunext/closetag.vim', {'for': ['html']}
call plug#end()
" ----------------------------------------------------------------------------------------
" GENERAL
" ----------------------------------------------------------------------------------------
syntax sync minlines=256
set re=1                                                " fixes slow speed due to syntax highlighting
set synmaxcol=1000                                      " syntax coloring lines that are too long just slows down the world
set t_ut=                                               " disbale background color erase (BCE)
set t_Co=256                                            " enable 256 color
set title                                               " show title in console title bar
set titlestring=%t                                      " only title not PATH
set shortmess+=I                                        " don't display the intro message on starting vim.
set titleold=                                           " don't display 'Thank for flaying Vim' when exiting
set laststatus=2
set number
set ruler                                               " show the line number on the bar
set termencoding=utf-8
set notimeout																						" make vim and terminal work properly :h notimeout
set ttimeout
set ttimeoutlen=10																			" speed esc
set modelines=0
set secure                                              " limit what modelines and autocmds can do
set visualbell t_vb=
set tabpagemax=12                                       " only show 12 tabs
set switchbuf=usetab                                    " if opening buffer, search first in opened windows.
set autoindent
set smartindent
set copyindent
set tabstop=2                                           " size of a hard tabstop
set softtabstop=2
set shiftwidth=2                                        " size of indent
set shiftround                                          " use multiple of shiftwidth when indenting with '<' and '>'
set smarttab
set textwidth=106
set backspace=indent,eol,start
set omnifunc=syntaxcomplete#Complete
set complete-=i
set completeopt=menu,menuone                            " clang complete without preview
set pumheight=20                                        " limit popup menu height (completion) or max 20 whatever
set wildmenu
set wildignore=*.o,*.obj,*~,*.pyc
set hidden                                              " allow to have buffers with unsaved changes
set nowrap                                              " dont wrap lines by default
set showmatch
set matchtime=3
set showcmd                                             " this shows what you are typing as a command
set noshowmode                                          " hide insert status
set autowrite                                           " automatically save before commands like :next and :make
set autoread                                            " set to auto read when file is changed from outside
set autochdir
set incsearch                                           " search as characters are entered
set hlsearch                                            " highlight matches
set gdefault                                            " for search and replace
set nostartofline                                       " keep cursor column pos
set confirm                                             " ask to save buffer
set nojoinspaces																				" use only one space after '.' when joining
set virtualedit=block																		" let cursor move past the last char in <c-v> mode
set lazyredraw                                          " don't update while executing macros
set ttyfast                                             " smoother changer
set scrolloff=1                                         " keep at least 1 lines above/below
set sidescrolloff=5                                     " keep at least 5 lines left/right
set splitbelow
set splitright
set history=1000
set backup
set undofile
set backupext=.bak                                      " save backup with bak extension
set backupdir=~/.vim/tmp/backup//												" add double slash to the end of the path so that you can modify
set directory=~/.vim/tmp/swap//													" two files with the same name at the time
set undodir^=~/.vim/tmp/undo//
set tags=tags;~/                                        " look for the file in the current directory, then south until you reach home.
set viminfo+=n~/.vim/viminfo														" set viminfo file name
set viminfo='20,\"100,s10,h                             " don't store more than 100 lines, h: disable hlsearch, s10: maximum KB
set dictionary=/usr/share/dict/words
set listchars=tab:▸\ ,trail:·,extends:❯,precedes:❮,nbsp:×
" ----------------------------------------------------------------------------------------
" COLORS
" ----------------------------------------------------------------------------------------
colorscheme badwolf
let g:badwolf_tabline = 0
highlight clear signcolumn                              " signcolumn should match background
highlight colorcolumn ctermbg=lightgrey
highlight cursorlinenr ctermfg=lightblue
highlight cursorline cterm=NONE ctermbg=234 ctermfg=NONE
highlight cursorcolumn cterm=NONE ctermbg=234 ctermfg=NONE
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red
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
let g:airline_section_b = ""
let g:airline_section_y = ""
let g:airline_section_c = '%<%F%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#'
" ----------------------------------------------------------------------------------------
" PLUGINS
" ----------------------------------------------------------------------------------------
" vim move : use c-k and c-j to move current line/selection to up and down
let g:move_key_modifier = 'C'
" delimitmate
let delimitMate_expand_space = 1
" netrw
let g:netrw_liststyle = 2
let g:netrw_banner = 0
" ag disbale message
let g:ag_mapping_message = 0
nnoremap <Leader>A :Ag!<space>
" tagbar
let g:tagbar_sort = 0                                   " order tags based on file order; don't sort alphabetically
nnoremap <silent> <F8> :TagbarToggle<CR>
" clever tab only one line search
let g:clever_f_across_no_line = 1
let g:clever_f_fix_key_direction = 1
nmap <silent> <Leader>f <Plug>(clever-f-reset)
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
" fzf
nnoremap <silent> <Leader>g :FZF<CR>
nnoremap <silent> <Leader>G :FZF!<CR>
nnoremap <silent> <Leader>h :FZF ~<CR>
nnoremap <silent> <Leader>H :FZF! ~<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
" ----------------------------------------------------------------------------------------
" MAPS
" ----------------------------------------------------------------------------------------
noremap q <Nop>
noremap Q <Nop>
" make Y yank to end of line (like D, or C)
noremap Y y$
" go to position of last edit. mean: 'go to edit'
nnoremap ge `.
" highlight last inserted text
nnoremap gV `[v`]
" please use leader K to see man page
nnoremap K <Nop>
" too much accident, please use leader J instead
nnoremap J <Nop>
nnoremap <Leader>J J
" move the beginning/end of line
noremap B ^
noremap E g_
" easier horizontal scrolling
nnoremap zl zL
nnoremap zh zH
" re-select visual block after indenting
vnoremap < <gv
vnoremap > >gv
" add one space
nnoremap [s i<space><esc>
nnoremap ]s a<space><esc>
" move tab
nnoremap <silent> + :tabm+<CR>
nnoremap <silent> - :tabm-<CR>
" paste multiple lines multiple times with simple ppppp
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]
" center screen on next/previous selection.
nnoremap n nzz
nnoremap N Nzz
nnoremap } }zz
nnoremap { {zz
" moving around in command mode, ctrl+b & ctrl+e move beginning and end
cnoremap <C-l> <right>
cnoremap <C-h> <left>
cnoremap <C-k> <S-Right>
cnoremap <C-j> <S-Left>
" use C-Space to Esc out of any mode but terminal sees <C-@> as <C-space> WTF, but ok
inoremap <C-@> <Esc>`^
vnoremap <C-@> <Esc>gV
onoremap <C-@> <Esc>
cnoremap <C-@> <C-c>
nnoremap <C-@> <Esc>:noh<CR>
" use j/k to start, then scroll through autocomplete options
inoremap <expr> <C-j> ((pumvisible())?("\<C-n>"):("\<C-x><c-n>"))
inoremap <expr> <C-k> ((pumvisible())?("\<C-p>"):("\<C-x><c-k>"))
inoremap <c-k> <c-p>
" stop autocomment on nextline
nnoremap <expr> O getline('.') =~ '^\s*//' ? 'O<esc>S' : 'O'
nnoremap <expr> o getline('.') =~ '^\s*//' ? 'o<esc>S' : 'o'
" clipboard
nnoremap gy "+y
nnoremap gY "+y$
vnoremap gy "+y
vnoremap gY "+y
nnoremap gd "+d
nnoremap gD "+D
vnoremap gd "+d
vnoremap gD "+d
nnoremap gp "+p
nnoremap gP "+P
vnoremap gp "+p
vnoremap gP "+p
" leader stuff
nnoremap <silent> <Leader>w :w!<CR>
nnoremap <silent> <Leader>W :wa!<CR>
nnoremap <silent> <Leader>x :x!<CR>
nnoremap <silent> <Leader>q :q<CR>
nnoremap <silent> <Leader>Q :q!<CR>
nnoremap <silent> <Leader>r :bd<CR>
nnoremap <silent> <Leader>R :bd!<CR>
nnoremap <silent> <Leader>t :e .<CR>
nnoremap <silent> <Leader>T :e ~/<CR>
nnoremap <leader>e :e<space>
nnoremap <leader>E :e <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <Leader>1 :au! BufWritePost *.c :!<space>
nnoremap <Leader>! :au! BufWritePost *.cpp :!<space>
nnoremap <Leader>2 :au! BufWritePost *.py :! python<space>
nnoremap <Leader>3 :au! BufWritePost *.rb :! ruby<space>
nnoremap <Leader>4 :au! BufWritePost *.js :! nodejs<space>
" save mysql last query
noremap <Leader>z :w! /tmp/query.sql\| w!<CR>
noremap <Leader>Z :w! /tmp/query.sql\| wq!<CR>
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
" move between tag
runtime! macros/matchit.vim
" save when losing focus
au FocusLost * :silent! wall
" resize splits when the window is resized
au VimResized * :wincmd =
" remove any trailing whitespace that is in the file
autocmd BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif
" auto remove multiple empty lines at the end of line
autocmd BufWrite * :%s/\(\s*\n\)\+\%$//ge
" replace groups or function of empty or whitespaces-only lines with one empty line
autocmd BufWrite * :%s/\(\s*\n\)\{3,}/\r\r/ge
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
