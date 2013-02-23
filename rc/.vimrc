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
"
" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

let g:syntastic_enable_signs=0
let g:syntastic_enable_highlight=1
let g:syntastic_auto_loc_list=1

" Automatically open, but do not go to (if there are errors) the quickfix /
" location list window, or close it when is has become empty.
"
" Note: Must allow nesting of autocmds to enable any customizations for quickfix
" buffers.
" Note: Normally, :cwindow jumps to the quickfix window if the command opens it
" (but not if it's already open). However, as part of the autocmd, this doesn't
" seem to happen.
autocmd QuickFixCmdPost [^l]* nested cwindow
