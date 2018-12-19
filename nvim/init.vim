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
Plug 'godoctor/godoctor.vim'
" Colorschemes
Plug 'NLKNguyen/papercolor-theme'
" Buffer Handler
Plug 'jlanzarotta/bufexplorer'
call plug#end()

filetype plugin on

"----------------------------------------------
" Globals
"----------------------------------------------
let mapleader = ","
set number

" save buffer
nnoremap <leader>w :write<cr>

" leave insert mode with öö
imap öö <Esc>

" search for visual selected text
vnoremap // y/<C-R>"<CR>

" remap tab to 4 spaces
set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.
set shiftwidth=4    " Indents will have a width of 4
set softtabstop=4   " Sets the number of columns for a TAB
set expandtab       " Expand TABs to spaces

"----------------------------------------------
" Session handling
"----------------------------------------------
" Save session on quitting Vim
autocmd VimLeave * NERDTreeClose
autocmd VimLeave * mksession! 

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
" close scratch window after list selection
set completeopt-=preview

" move in the autocompletion box with jk
" inoremap <expr> j ((pumvisible())?("\<C-n>"):("j"))
" inoremap <expr> k ((pumvisible())?("\<C-p>"):("k"))
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
nnoremap <S-Left> <c-w>h
nnoremap <S-Right> <c-w>l
nnoremap <S-Up> <c-w>k
nnoremap <S-Down> <c-w>j
" nnoremap <S-h> <c-w>h
" nnoremap <S-l> <c-w>l
" nnoremap <S-k> <c-w>k
" nnoremap <S-j> <c-w>j
" nnoremap <tab><tab> <c-w><c-w>

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
let g:go_highlight_function_calls = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_auto_sameids = 1
let g:go_auto_type_info = 1
set updatetime=100
let g:go_list_type = "locationlist"
nnoremap <leader>b :GoBuild<cr>
nnoremap <leader>tc :GoTestCompile<cr>
nnoremap <leader>t :GoTest<cr>
nnoremap <leader>d :GoDef<cr>
nnoremap <leader>dp :GoDefPop<cr>
nnoremap <leader>a :GoAlternate<cr>
nnoremap <leader>f :GoDecls<cr>
