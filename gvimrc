" Start without the toolbar
set guioptions=aAc
"set background=light
color solarized

if has("gui_macvim")
  " Fullscreen takes up entire screen
  set fuoptions=maxhorz,maxvert
 
  " Command-Return for fullscreen
  macmenu Window.Toggle\ Full\ Screen\ Mode key=<D-CR>

  map <D-M-Right> :tabn<CR>
  imap <D-M-Right> :tabn<CR>
  map <D-M-Left> :tabp<cr>
  imap <D-M-Left> :tabp<cr>

  " Adjust viewports to the same size
  map <Leader>= <C-w>=
  imap <Leader>= <Esc> <C-w>=
  set guifont=Inconsolata:h16
elseif has("unix")
  set guifont="monospace\ 10"
end
