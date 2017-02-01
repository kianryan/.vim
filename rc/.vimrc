set nocompatible      " We're running Vim, not Vi!
filetype off           " Disable filetype detection for Vundle.

" set the runtime path to include Vundle and initialize

if has('win32')
    set rtp+=$HOME/vimfiles/bundle/Vundle.vim/
    call vundle#begin('$USERPROFILE/vimfiles/bundle/')
else
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
endif


" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Dependancies
Plugin 'MarcWeber/vim-addon-mw-utils.git'
Plugin 'tomtom/tlib_vim.git'
Plugin 'tpope/vim-dispatch.git'
Plugin 'mattn/webapi-vim.git'
Plugin 'Shougo/vimproc.vim.git'

" UI
Plugin 'scrooloose/nerdtree.git'
Plugin 'scrooloose/nerdcommenter.git'
Plugin 'majutsushi/tagbar.git'
Plugin 'altercation/vim-colors-solarized.git'
Plugin 'bling/vim-airline.git'
Plugin 'airblade/vim-gitgutter.git'

" Editing 
Plugin 'tpope/vim-surround.git'
Plugin 'Raimondi/delimitMate.git'
Plugin 'docunext/closetag.vim.git'
Plugin 'vim-scripts/matchit.zip'
Plugin 'Valloric/YouCompleteMe'

" Tools
Plugin 'vim-scripts/dbext.vim.git'
Plugin 'vim-scripts/SQLComplete.vim.git'
Plugin 'scrooloose/syntastic.git'
Plugin 'tpope/vim-fugitive.git'
Plugin 'mattn/gist-vim.git'

" Snippets
Plugin 'kianryan/snipmate-snippets.git'

" Ruby
Plugin 'vim-ruby/vim-ruby.git'
Plugin 'tpope/vim-cucumber.git'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-endwise.git'
Plugin 'vim-scripts/ruby-matchit'

" .NET
Plugin 'OrangeT/vim-csharp.git'
Plugin 'nosami/Omnisharp'

" Arduino
Plugin 'tclem/vim-arduino.git'

" HTML/CSS/Markdown
Plugin 'othree/html5.vim.git'
Plugin 'hail2u/vim-css3-syntax.git'
Plugin 'groenewege/vim-less.git'
Plugin 'tpope/vim-markdown.git'
Plugin 'mustache/vim-mustache-handlebars'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins
set hidden
set number
set history=1000
set backspace=2
let NERDTreeDirArrows=0

set term=xterm
set t_Co=256
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"
colorscheme vividchalk-256

set ignorecase
set smartcase " Lower case searches ignore case, single uppercase searches case.
set incsearch
set showmatch
set hlsearch
set wildignore+=*\\Deployment\\*,*\\js-min\\*

nnoremap <leader><space> :noh<cr>
map <leader>nt :NERDTreeToggle<cr>

" Use ack
set grepprg=ack

" Toggle folding
noremap <leader>mo :set foldmethod=indent<cr>
noremap <leader>ml :set nofoldenable<cr>

autocmd FileType ruby,eruby,yaml set sw=2 sts=2 et
"
" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
"autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
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
let g:OmniSharp_BufWritePreSyntaxCheck = 0

" Let's do something with omnisharp
nnoremap <F12> :OmniSharpGotoDefinition<cr>
nnoremap gd :OmniSharpGotoDefinition<cr>
nnoremap <leader>fi :OmniSharpFindImplementations<cr>
nnoremap <leader>ft :OmniSharpFindType<cr>
nnoremap <leader>fs :OmniSharpFindSymbol<cr>
nnoremap <leader>fu :OmniSharpFindUsages<cr>
nnoremap <leader>fm :OmniSharpFindMembersInBuffer<cr>
nnoremap <leader>tt :OmniSharpTypeLookup<cr>
nnoremap <leader>dc :OmniSharpDocumentation<cr>
"show type information automatically when the cursor stops moving
"I find contextual code actions so useful that I have it mapped to the spacebar
nnoremap <space> :OmniSharpGetCodeActions<cr>

" rename with dialog
nnoremap <leader>nm :OmniSharpRename<cr>
nnoremap <F2> :OmniSharpRename<cr>      
" rename without dialog - with cursor on the symbol to rename... ':Rename newname'
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

" Force OmniSharp to reload the solution. Useful when switching branches etc.
nnoremap <leader>rl :OmniSharpReloadSolution<cr>
nnoremap <leader>cf :OmniSharpCodeFormat<cr>
" Load the current .cs file to the nearest project
nnoremap <leader>tp :OmniSharpAddToProject<cr>

" Real time diff checking broken on Win
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

" Airline
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tagbar#enabled = 0
let g:airline_left_sep = ''
let g:airline_right_sep = ''

"File Tidy
command! Hedge % s /\(^\s*\n$\)\+//g | % s /\s*$//g | noh
map <leader>h :Hedge

function! SyntaxItem()
  return synIDattr(synID(line("."),col("."),1),"name")
endfunction

" Mappings for Fugitive
map <leader>gs :Gstatus<cr>
map <leader>gc :Gcommit<cr>
map <leader>gd :Gdiff<cr>
map <leader>gb :Gblame<cr>
map <leader>gl :Glog<cr>
map <leader>gp :Git pull<cr>

"Arduino
au BufRead,BufNewFile *.pde set filetype=arduino | set syntax=cpp
au BufRead,BufNewFile *.ino set filetype=arduino | set syntax=cpp

"Ruby/Rails
augroup ruby
  set omnifunc=rubycomplete#Complete
  let g:rubycomplete_buffer_loading = 1
  let g:rubycomplete_rails = 1
  let g:rubycomplete_classes_in_global = 1
  let g:rubycomplete_include_object = 1
  let g:rubycomplete_include_objectspace = 1
augroup END

"CSharp
augroup cs
    set omnifunc=OmniSharp#Complete
augroup END

" CtrlP
let g:ctrlp_switch_buffer = ''

" Zeal Integration
:nnoremap gz :!zeal --query "<cword>"&<CR><CR>

" Todo.txt
let g:todo_loc = 'd:\dropbox\apps\todotxttdi\todo.txt'
function! Todo()
    execute 'edit' g:todo_loc
endfunction
com! Todo :call Todo()

" Vim-Notes
let g:notes_directories = ['d:\dropbox\apps\notes\']

" QFixArgs
command! -nargs=0 -bar Qargs execute 'args ' . QuickfixFilenames()
function! QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(values(buffer_numbers))
endfunction
