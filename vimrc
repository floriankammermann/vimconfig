set nocompatible
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
filetype indent on "indent depends on filetype

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

"changes the color of the prompt if it is a ssh session
if [ -n "$SSH_CLIENT" ]; then text=" ssh-session"
fi
export PS1='\[\e[0;31m\]\u@\h:\w${text}$\[\e[m\] '

"Enable indent folding
"set foldenable
"set fdm=indent

"Set space to toggle a fold
"nnoremap <space> za

"Hide buffer when not in window (to prevent relogin with FTP edit)
"set bufhidden=hide

"Have 3 lines of offset (or buffer) when scrolling
"set scrolloff=3

"Turn off creation of backup files
set nobackup
set nowritebackup
