set nocompatible      " We're running Vim, not Vi!
call pathogen#infect()
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins
set hidden
set number
set t_Co=256
let NERDTreeDirArrows=0
colorscheme vividchalk-256

set ignorecase 
set smartcase " Lower case searches ignore case, single uppercase searches case.
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
map <leader>nt :NERDTreeToggle<cr>

autocmd FileType ruby,eruby,yaml set sw=2 sts=2 et
