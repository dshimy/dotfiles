set nocompatible

"" enable loading of VIM bundles
call pathogen#infect() 
call pathogen#helptags()

"" line numbers
set number
au InsertEnter * set cul        " enable line highlighting in insert mode
au InsertLeave * set nocul      " disable line highlighting in insert mode

syntax enable                   " enable syntax coloring
set encoding=utf-8              " set file encoding
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation
set hidden                      " make background buffers work
set pastetoggle=<F1>
set nostartofline               " Preserve the cursor location when buffer switching
let mapleader=','

"" Appearance (font and colors)
set gfn=Monaco:h12
colorscheme brogrammer
set shortmess+=I

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces
set expandtab                   " use spaces, not tabs
set backspace=indent,eol,start  " backspace through everything in insert mode
set linebreak                   " break some something meaningful

"" Start the status line
set laststatus=2
set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)              

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
set gdefault                    " make all substitutions global
set modelines=0                 " Disable EOL vim commands

set whichwrap+=<,>,[,]          " make cursor go to the previous line at the beginning

"au FocusLost * :wa              " save when focus is lost
set nobackup                    " we don't need backup files
set noswapfile                  " we don't need swap files either

set wildignore+=*.o,*.obj,.git,.svn,log/**,tmp/**

"" Tagbar
map <leader>r :TagbarOpenAutoClose<CR>

"" NERDTree
let NERDTreeQuitOnOpen=1
nnoremap <Leader>f :let NERDTreeQuitOnOpen = 1<bar>NERDTreeToggle<CR>
nnoremap <Leader>F :let NERDTreeQuitOnOpen = 0<bar>NERDTreeToggle<CR>
map <F9> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
nmap <leader>e :NERDTreeFind<CR>

"" Map Command-S to save file
"" This requires mapping the CMD-s key in iTerm to the Hex 0x1b 0x4f 0x51
imap <F2> <C-o>:w<CR>
map  <F2> :w<CR>

map <F3> :set nowrap! <CR>

" Remember last location in file, but not for commit messages.
" see :help last-position-jump
au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
  \| exe "normal! g`\"" | endif

let g:ctrlp_map = '<leader>t'
let g:ctrlp_max_height = 25
noremap <leader>b :CtrlPBuffer<cr> 

"" switch to the last buffer
nnoremap <leader><leader> <c-^>

"" Clear the last serach
nnoremap <leader><space> :noh<cr>

"" Close the current buffer
map <leader>c :close<cr> 

"" Navigate the buffer list
map <C-n> :bn<cr>
map <C-p> :bp<cr>
map <leader>d :bd<cr>

"" Emacs-like bindings in insert mode
imap <C-e> <C-o>$

"" i always, ALWAYS hit ":W" instead of ":w"
command! Q q
command! W w

"" Splits ,v and ,h to open new splits (vertical and horizontal)
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>s <C-w>s<C-w>j

"" Easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

"" Move within a line
nnoremap j gj
nnoremap k gk

"" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv
  
"" Tabularize - align stuff
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a=> :Tabularize /=><CR>
vmap <Leader>a=> :Tabularize /=><CR>
nmap <Leader>a: :Tabularize /:<CR>
vmap <Leader>a: :Tabularize /:<CR>
nmap <Leader>a:: :Tabularize /:\zs<CR>
vmap <Leader>a:: :Tabularize /:\zs<CR>
nmap <Leader>a, :Tabularize /,\zs<CR>
vmap <Leader>a, :Tabularize /,\zs<CR>
nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
vmap <Leader>a<Bar> :Tabularize /<Bar><CR>

"" Code folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

"" ZoomWin
map <leader>z <c-w>o

"" Add markdown support to tagbar
let g:tagbar_type_markdown = {
  \ 'ctagstype' : 'markdown',
  \ 'kinds' : [
    \ 'h:Heading 1',
    \ 'i:Heading 2',
    \ 'k:Heading 3'
  \ ]
  \ }

"" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Local configuration
if filereadable(expand("~/.vimlocal"))
  source $HOME/.vimlocal
endif
