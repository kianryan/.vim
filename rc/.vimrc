set nocompatible      " We're running Vim, not Vi!
call pathogen#infect()
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins
set hidden
set number
set t_Co=256
set history=1000
set backspace=2
let NERDTreeDirArrows=0
colorscheme vividchalk-256

set ignorecase
set smartcase " Lower case searches ignore case, single uppercase searches case.
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
map <leader>nt :NERDTreeToggle<cr>

" Toggle folding
noremap <leader>mo :set foldmethod=indent<cr>
noremap <leader>ml :set nofoldenable<cr>

autocmd FileType ruby,eruby,yaml set sw=2 sts=2 et
"
" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

let g:syntastic_enable_signs=1
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

nmap <C-B> :make <CR>

set encoding=utf-8
set laststatus=2

" Disable Buf Check in Omni - let syntastic do it's job.
let g:Omnisharp_start_server = 0
let g:OmniSharp_BufWritePreSyntaxCheck = 0

" Real time diff checking broken on Win
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

" Airline
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tagbar#enabled = 0
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'

"File Tidy
command! Hedge % s /\(^\s*\n$\)\+//g | % s /\s*$//g | noh
map <leader>h :Hedge

function! SyntaxItem()
  return synIDattr(synID(line("."),col("."),1),"name")
endfunction

"Arduino
au BufRead,BufNewFile *.pde set filetype=arduino | set syntax=cpp
au BufRead,BufNewFile *.ino set filetype=arduino | set syntax=cpp

"Ruby/Rails
augroup ruby,eruby
  set omnifunc=rubycomplete#Complete
  let g:rubycomplete_buffer_loading = 1
  let g:rubycomplete_rails = 1
  let g:rubycomplete_classes_in_global = 1
  let g:rubycomplete_include_object = 1
  let g:rubycomplete_include_objectspace = 1
augroup END
