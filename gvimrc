" Make external commands work through a pipe instead of a pseudo-tty
"set noguipty

" Hide tool and menu bar
set guioptions-=T guioptions-=m guioptions=Ace
" You can also specify a different font, overriding the default font
if has('gui_gtk2')
  " set guifont=Bitstream\ Vera\ Sans\ Mono\ 12
  set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 14
else
  set guifont=-misc-fixed-medium-r-normal--14-130-75-75-c-70-iso8859-1
endif
" works in gvim
inoremap <C-Space> <Esc>`^
vnoremap <C-Space> <Esc>gV
onoremap <C-Space> <Esc>
cnoremap <C-Space> <C-c>
nnoremap <C-Space> <Esc>:noh<CR>
" cycle through windows
nnoremap <C-Tab> <C-w>w
" If you want to run gvim with a dark background, try using a different
" colorscheme or running 'gvim -reverse'.
" http://www.cs.cmu.edu/~maverick/VimColorSchemeTest/ has examples and
" downloads for the colorschemes on vim.org

" Source a global configuration file if available
if filereadable("/etc/vim/gvimrc.local")
  source /etc/vim/gvimrc.local
endif
