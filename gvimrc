" Start without the toolbar
set guioptions=aAc
"set background=light
color moria

if has("gui_macvim")
  " Fullscreen takes up entire screen
  set fuoptions=maxhorz,maxvert

  " Command-Return for fullscreen
  macmenu Window.Toggle\ Full\ Screen\ Mode key=<D-CR>

  set guifont=Inconsolata:h14
elseif has("unix")
  set guifont=Bitstream\ Vera\ Sans\ Mono\ 9
end
