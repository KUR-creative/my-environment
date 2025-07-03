""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" use this script when vim is way too small.
if has('gui_running')
  set guifont=Consolas:h10
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off

"set case sensitive options in insert mode auto complete.
set ignorecase
set infercase

"now MY OWN Vimrc
set autoindent "auto indent
set cindent    "for c

set nu         "view line numbers

set expandtab     " TAB??space濡??몄떇
set tabstop=4     "the width of a TAB is set to 4
                  "Still it is a \t. It is just that vim will interpret it
                  "to be having a width of 4.
set shiftwidth=4  "Indents will have a width of 4
set softtabstop=4 "set the number of columns for a TAB

"insert new line in COMMAND mode
"in gvim, <S-Enter> O<Esc>
nmap <C-O> O<Esc>
nmap <CR> o<Esc>

"insert <Tab> in normal mode - for copying and pasting
nnoremap <TAB> a<TAB><ESC>

"insert <Space> in normal mode
nnoremap <Space> a<Space><Esc>

"paste yanked data only. NO deleted data
nmap <C-P> "0P

"switch splited window
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

"Ctrl + c for copying to + register
map <C-c> "+Y
"Ctrl + v for pasteing to + register
map <C-v> "+p

"vim also like other editors!
set nowrap      " if one line exceeded window width..

"search improved
set incsearch   "auto move to search target
set hlsearch    "highlight search
set noic        "don't ignorecase

"off search highlight to press <Esc> <Esc>
"nnoremap <silent> <Esc><Esc>:let @/=""<CR>
nnoremap <Esc><Esc> :let @/=""<CR>

"for ctags commands
" UpdateTypesFileOnly after each jump.
"nmap ] :tn<CR><F8>
"nmap [ :tp<CR><F8>
"nnoremap <C-]> <C-]>:UpdateTypesFileOnly<CR>
"nnoremap <C-t> <C-t>:UpdateTypesFileOnly<CR>

" <C-y> to yank current word without space..
nnoremap <C-y> yiw
" <C-e> to down, <C-n> to up
nnoremap <C-n> <C-y>

" resize window
nnoremap <C-Up> <C-w>+
nnoremap <C-Down> <C-w>-
nnoremap <C-Left> <C-w><
nnoremap <C-Right> <C-w>>

"my own commands
" into visual block without using <c-v> ("+p)
command! VB normal! <C-v>
map zc :wa<CR>

" WSL cursor shape: https://www.reddit.com/r/vim/comments/uvizcu/comment/i9majz5/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
if &term =~? 'rxvt' || &term =~? 'xterm' || &term =~? 'st-'
    " 1 or 0 -> blinking block
    " 2 -> solid block
    " 3 -> blinking underscore
    " 4 -> solid underscore
    " Recent versions of xterm (282 or above) also support
    " 5 -> blinking vertical bar
    " 6 -> solid vertical bar
    " Insert Mode
    let &t_SI .= "\<Esc>[6 q"
    " Normal Mode
    let &t_EI .= "\<Esc>[2 q"
endif
