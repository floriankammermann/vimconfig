call plug#begin('~/.vim/plugged')
" filesystem structure
Plug 'scrooloose/nerdtree'
" filefinder
Plug 'junegunn/fzf.vim'
" git
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'
" golang
Plug 'fatih/vim-go'
Plug 'jodosha/vim-godebug'
Plug 'sebdah/vim-delve'
Plug 'jodosha/vim-godebug' " Debugger integration via delve
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-go', {'do': 'make'}
Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
" Colorschemes
Plug 'NLKNguyen/papercolor-theme'
call plug#end()

filetype plugin on

"----------------------------------------------
" Globals
"----------------------------------------------
let mapleader = ","
set number

"----------------------------------------------
" Session handling
"----------------------------------------------
" Save session on quitting Vim
autocmd VimLeave * NERDTreeClose
autocmd VimLeave * mksession! [filename]

" Start NERDTree
autocmd VimEnter * NERDTree

"----------------------------------------------
" Colors
"----------------------------------------------
set background=dark
colorscheme PaperColor

" Override the search highlight color with a combination that is easier to
" read. The default PaperColor is dark green backgroun with black foreground.
"
" Reference:
" - http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim
highlight Search guibg=DeepPink4 guifg=White ctermbg=53 ctermfg=White

"----------------------------------------------
" fuzzy finder
"----------------------------------------------
nnoremap <C-f> :Files<CR>
nnoremap <S-f> :Ag<CR>

"----------------------------------------------
" Autocompletion
"----------------------------------------------

" neocomplete like
set completeopt+=noinsert
" deoplete.nvim recommend
set completeopt+=noselect

" Path to python interpreter for neovim
let g:python3_host_prog  = '/usr/bin/python3'
" Skip the check of neovim module
let g:python3_host_skip_check = 1

" Run deoplete.nvim automatically
let g:deoplete#enable_at_startup = 1
" deoplete-go settings
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

"----------------------------------------------
" NERDTree
"----------------------------------------------
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" synchronize NERDTree with buffer
nnoremap <leader>j :NERDTreeFind<cr>
nnoremap <leader>n :NERDTreeFocus<cr>

"----------------------------------------------
" Windows
"----------------------------------------------
" use Ctrl - Cursor to move between windows
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l

" use tab to move through windows
nnoremap <tab> <c-w>
nnoremap <tab><tab> <c-w><c-w>

" resize horzontal split window
nnoremap <C-Up> <C-W>-<C-W>-
nnoremap <C-Down> <C-W>+<C-W>+
" resize vertical split window
nnoremap <C-Right> <C-W>><C-W>>
nnoremap <C-Left> <C-W><<C-W><

"----------------------------------------------
" Golang
"----------------------------------------------
let g:go_gocode_autobuild = 1
let g:go_fmt_command = "goimports"
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_auto_sameids = 1
let g:go_list_type = "locationlist"

" execute GoBuild on write
autocmd BufWritePre *.go :GoBuild
