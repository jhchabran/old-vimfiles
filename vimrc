set nocompatible
filetype off " required by Vundle plumbing

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

so ~/.vim/bundle.vim

filetype plugin indent on   
syntax on

set number
set ruler
syntax on
set encoding=utf-8
set hidden
let mapleader = "," 
set cursorline
" Manage all my plugins through pathogen

" Store lots of :cmdline history
set history=1000
" Store marks on up to 100 files
set viminfo='100,f1

" Whitespace stuff
set wrap
set scrolloff=3
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list listchars=tab:\ \ ,trail:·

" These two will leave the cursor to where it cleaned spaces which isn't very
" comfortable
autocmd BufWritePre *.rb :%s/\s\+$//e
autocmd BufWritePre *.py :%s/\s\+$//e

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,test/fixtures/*,vendor/gems/*

" make uses real tabs
au FileType make 	set noexpandtab

" Status bar
set laststatus=2
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
" set statusline=[%n]\ %<%.99f\ %h%w%m%r%y%{exists('g:loaded_rvm')?rvm#statusline():''}%=%-16(\ %l,%c-%v\ %)%P

" Fix issues with the shell and fugitive
set shell=bash

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal g'\"" | endif
endif

function s:setupWrapping()
  set wrap
  set wm=2
  set textwidth=72
endfunction

function s:setupMarkup()
  call s:setupWrapping()
  map <buffer> <Leader>p :Mm <CR>
endfunction

" md, markdown, and mk are markdown and define buffer-local preview
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()

au BufRead,BufNewFile *.txt call s:setupWrapping()

" make python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python  set tabstop=4 textwidth=79

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" CTags
map <Leader>rt :!ctags --extra=+f -R *<CR><CR>

" Unimpaired configuration
" Bubble single lines
nmap <C-K> [e
nmap <C-J> ]e
" Bubble multiple lines
vmap <C-K> [egv
vmap <C-J> ]egv

" ZoomWin 
map <Leader><Leader> :ZoomWin<CR>

" Enable syntastic syntax checking
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1

" gist-vim defaults
if has("mac")
  let g:gist_clip_command = 'pbcopy'
elseif has("unix")
  let g:gist_clip_command = 'xclip -selection clipboard'
endif
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

" MacVIM shift+arrow-keys behavior (required in .vimrc)
let macvim_hig_shift_movement = 1

"spell check when writing commit logs
autocmd filetype svn,*commit* set spell

let g:ctrlp_working_path_mode = 2
" refresh current directory when switching buffers
au BufEnter * cal ctrlp#SetWorkingPath(2) 
let g:ctrlp_mru_files = 1 
let g:ctrlp_jump_to_buffer = 1

map <Leader>f :CtrlPRoot<CR>
map <Leader>c :CtrlPCurFile<CR>
map <Leader>b :CtrlPBuffer<CR>
map <Leader>m :CtrlPMRUFiles<CR>

" Presing jj get back to normal mode
inoremap jj <esc>

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" Directories for snippets
let g:UltiSnipsSnippetDirectories = ["snippets"]

" Default color scheme

set background=dark

" Detect if we're running a 256 colors terminals
" PuTTY - putty-256color
" rxvt - rxvt-256color
" Eterm - Eterm-256color
" Konsole - konsole-256color
" XFCE's Terminal - gnome-256color
" more details here : http://vim.wikia.com/wiki/256_colors_in_vim
if matchstr(&t_Co, '256')
  color xoria256
else
  color desert
endif

" If we're under Ubuntu, adjust ack's command
if !filereadable("/usr/bin/ack")
  let g:ackprg="ack-grep -H --nocolor --nogroup --column"
endif

command Notes e ~/.notes
command Todo Ack TODO

" force myself to use hjkl
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Rails / Ruby related
map <leader>rl :.Rake<cr>
map <leader>r :Rake<cr>
