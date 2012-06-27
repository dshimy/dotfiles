set nocompatible

"" enable loading of VIM bundles
call pathogen#infect() 

set number                      " add line numbers
syntax enable                   " enable syntax coloring
set encoding=utf-8              " set file encoding
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation
set hidden                      " make background buffers work

"" Appearance
set gfn=Monaco:h12              " set the font
set background=dark
colorscheme solarized
let g:CommandTMaxHeight=20      " command-T configuration

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces
set expandtab                   " use spaces, not tabs
set backspace=indent,eol,start  " backspace through everything in insert mode

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

function s:setupWrapping()
  set wrap
  set wrapmargin=2
  set textwidth=72
endfunction

if has("autocmd")
  " Make sure all mardown files have the correct filetype set and setup wrapping
  au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown | call s:setupWrapping()

  " Treat JSON files like JavaScript
  au BufNewFile,BufRead *.json set ft=javascript

  " make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
  au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

  " Remember last location in file, but not for commit messages.
  " see :help last-position-jump
  au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g`\"" | endif
endif

"" switch to the last buffer
nnoremap <leader><leader> <c-^>

"" clear the last serach
nnoremap <leader><space> :noh<cr>

"" close the current buffer
map  <leader>c :close<cr> 

"" ZoomWin
map <leader>z <c-w>o

imap <tab> <c-n>
map <leader>ga :CommandTFlush<cr>\|:CommandT app<cr>

"" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
