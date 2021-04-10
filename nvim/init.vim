call plug#begin('~/.vim/plugged')
" filesystem structure
Plug 'scrooloose/nerdtree'
" filefinder
Plug 'junegunn/fzf.vim'
Plug 'rking/ag.vim'
" git
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'
Plug 'tommcdo/vim-fubitive'
" golang
Plug 'fatih/vim-go',  { 'do': ':GoUpdateBinaries' }
Plug 'jodosha/vim-godebug'
Plug 'sebdah/vim-delve'
Plug 'mdempsky/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
Plug 'godoctor/godoctor.vim'
" Autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Colorschemes
Plug 'NLKNguyen/papercolor-theme'
" Buffer Handler
Plug 'jlanzarotta/bufexplorer'
" Jenkinsfile Syntax
Plug 'martinda/Jenkinsfile-vim-syntax'
" vue plugin
Plug 'posva/vim-vue'
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

"----------------------------------------------
" Autocompletion coc
"----------------------------------------------

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

"----------------------------------------------
" Statusline
"----------------------------------------------
let NERDTreeMinimalUI = 1
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=%#StatusLineNC#
set statusline+=\ %f
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c

"----------------------------------------------
" NERDTree
"----------------------------------------------
let NERDTreeShowHidden = 1
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
let g:go_referrers_mode = "gopls"
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_def_mapping_enabled = 0
nnoremap <leader>b :GoBuild<cr>
nnoremap <leader>tc :GoTestCompile<cr>
nnoremap <leader>t :GoTest<cr>
nnoremap <leader>d :GoDef<cr>
nnoremap <leader>dp :GoDefPop<cr>
nnoremap <leader>a :GoAlternate<cr>
nnoremap <leader>f :GoDecls<cr>
