
set guifont=Source\ Code\ Pro\ 9

if has("gui_macvim")
    set guifont=Source\ Code\ Pro:h11
    let g:airline_powerline_fonts=1
endif

if has("gui_win32")
    set guifont=Source\ Code\ Pro:h9
    set bs=2
    map <leader>ff :call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<cr>
    set wildignore+=*\\Deployment\\*,*\\js.min\\*,*\\bin\\*,*\\obj\\*
endif

if has("gui_unix")
    set guifont=Source\ Code\ Pro\ 9
    let g:airline_powerline_fonts=1
endif

set sw=4 sts=4 et
set go-=T
set ruler
set guioptions=
colorscheme vividchalkian
