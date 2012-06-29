
"If Linux, 9pt Monaco
set guifont=Monaco\ 9

if has("gui_macvim")
    set guifont=Monaco:h11
endif

if has("gui_win32")
    set guifont=Consolas:h10
    set bs=2
    map <leader>ff :call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<cr>
endif

set sw=4 sts=4 et
set go-=T
set ruler
set guioptions=
colorscheme vividchalkian
