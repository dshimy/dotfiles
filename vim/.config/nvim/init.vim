call plug#begin('~/.local/share/nvim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'gabrielelana/vim-markdown'
Plug 'junegunn/vim-easy-align'
Plug 'arcticicestudio/nord-vim'
Plug 'itspriddle/vim-marked'

call plug#end()

syntax on
set shortmess+=I

let g:lightline = { 'colorscheme': 'nord' }
let g:nord_underline = 1
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_uniform_status_lines = 1
colorscheme nord

set number               " Show line numbers
set cursorline           " Highlight the current line
set mouse=a              " Use the mouse
set cb=unnamed           " Use the system clipboard
set hidden               " Allow switching unsaved buffers
set tabstop=2            " Set how many spaces use a tab
set shiftwidth=2         " Set how many columns are used when indenting

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
let g:netrw_list_hide= '.*\.swp$i,Icon,.DS_Store'

map ; :Files<cr>
nnoremap <esc> :noh<return><esc>

imap <C-L> <C-R>=strftime("%b %d, %Y")<CR>
nnoremap <Leader>d :Lex<CR>
nnoremap <Leader>c :close<CR>
nnoremap <Leader>o :only<CR>
nnoremap <Leader>1 1gt<CR>
nnoremap <Leader>2 2gt<CR>
nnoremap <Leader>3 3gt<CR>
nnoremap <Leader>4 4gt<CR>
nnoremap <Leader>5 5gt<CR>
nnoremap <C-w><Left> <C-w>h
nnoremap <C-w><Right> <C-w>l

" Save files on autofocus change
au FocusLost * :wa

" Remove whitespace a the end of the line
autocmd BufWritePre * %s/\s\+$//e

" Set the cursor to the last edited position
autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Ignore Acronyms during spell check
syn match AcronymNoSpell '\<\(\u\|\d\)\{3,}s\?\>' contains=@NoSpell

" Align tables
au FileType markdown vmap <Leader>t :EasyAlign*<Bar><Enter>

