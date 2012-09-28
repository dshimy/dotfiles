set nocompatible

"" enable loading of VIM bundles
call pathogen#infect() 
call pathogen#helptags()

"" line numbers
:au FocusLost * :set number
:au FocusGained * :set relativenumber
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber
set relativenumber 

syntax enable                   " enable syntax coloring
set encoding=utf-8              " set file encoding
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation
set hidden                      " make background buffers work
set nofoldenable                " disable code folding

"" Appearance (font and colors)
set gfn=Monaco:h12
" set background=light
" colorscheme solarized
colorscheme Tomorrow-Night-Bright
set shortmess+=I

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces
set expandtab                   " use spaces, not tabs
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Start the status line
set laststatus=2
set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)              

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
set gdefault                    " make all substitutions global

set whichwrap+=<,>,[,]          " make cursor go to the previous line at the beginning

au FocusLost * :wa              " save when focus is lost
set nobackup                    " we don't need backup files
set noswapfile                  " we don't need swap files either

set wildignore+=*.o,*.obj,.git,.svn,log/**,tmp/**

"" Map Command-S to save file
"" This requires mapping the CMD-s key in iTerm to the Hex 0x1b 0x4f 0x51
imap <F2> <C-o>:w<CR>
map  <F2> :w<CR>

" Remember last location in file, but not for commit messages.
" see :help last-position-jump
au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
  \| exe "normal! g`\"" | endif

"" switch to the last buffer
nnoremap <leader><leader> <c-^>

"" clear the last serach
nnoremap <leader><space> :noh<cr>

"" close the current buffer
map  <leader>c :close<cr> 

"" navigate the buffer list
map b :bn<cr>
map B :bp<cr>

"" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

"" ZoomWin
map <leader>z <c-w>o

"" Command-T Configuration
let g:CommandTMaxFiles=25000
let g:CommandTMaxHeight=20
if &term =~ "xterm" || &term =~ "screen"
  let g:CommandTCancelMap     = ['<ESC>', '<C-c>']
  let g:CommandTSelectNextMap = ['<C-n>', '<C-j>', '<ESC>OB']
  let g:CommandTSelectPrevMap = ['<C-p>', '<C-k>', '<ESC>OA']
endif

" local configuration
if filereadable(expand("~/.vimlocal"))
  source $HOME/.vimlocal
endif
