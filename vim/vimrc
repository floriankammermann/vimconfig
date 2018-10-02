set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'scrooloose/nerdtree.git'
Plugin 'tpope/vim-fugitive.git'

filetype plugin indent on "indent depends on filetype

set bs=2 "set backspace to be able to delete previous charactersEnable line numbering, taking up 6 spaces
set number

set history=1000                " remember more lines of cmdline history

"Turn off word wrapping
set wrap!

"Turn on smart indent
set smartindent
set tabstop=4 "set tab character to 4 characters
set expandtab "turn tabs into whitespace
set shiftwidth=4 "indent width for autoindent

"Shortcut to auto indent entire file
nmap <F11> 1G=G
imap <F11> <ESC>1G=Ga

"Turn on incremental search with ignore case (except explicit caps)
set incsearch
set ignorecase
set smartcase

"Informative status line
set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\ [%l/%L\ (%p%%)]

"replace selected text with last yanked text
vmap r "_dP

"Set color scheme
"set t_Co=256
colorscheme desert
syntax enable

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

"DOESN'T WORK IN CYGWIN
"changes the color of the prompt if it is a ssh session
"if [ -n "$SSH_CLIENT" ]; then text=" ssh-session"
"fi
"export PS1='\[\e[0;31m\]\u@\h:\w${text}$\[\e[m\] '

"Enable indent folding
"set foldenable
"set fdm=indent

"Set space to toggle a fold
"nnoremap <space> za

"Hide buffer when not in window (to prevent relogin with FTP edit)
"set bufhidden=hide

"Have 3 lines of offset (or buffer) when scrolling
"set scrolloff=3
"
"set encoding=utf-8
