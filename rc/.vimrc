set nocompatible      " We're running Vim, not Vi!
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins
set hidden
set number
colorscheme vividchalkian
call pathogen#infect()

set ignorecase 
set smartcase " Lower case searches ignore case, single uppercase searches case.
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>

autocmd FileType ruby,eruby,yaml set sw=2 sts=2 et
