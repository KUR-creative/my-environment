" system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
"runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" use this script when vim is way too small.
if has('gui_running')
  set guifont=Consolas:h10
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off
 
" set the runtime path to include Vundle and initialize
set rtp+=$HOME/.vim/bundle/Vundle.vim/
call vundle#begin('$HOME/.vim/bundle/')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" The following are examples of different formats supported.

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"set rtp+=~/.vim/bundle/Vundle.vim
 
"call vundle#rc()
"Bundle 'gmarik/vundle'
"Bundle 'git://git.wincent.com/command-t.git'
 
"filetype plugin indent on
"now you can add plugins here!


""""""""""""""""""""""""""Plugins summary"""""""""""""""""""""""""
" The-NERD-tree
" AutoComplPop

nmap <F2> :NERDTreeToggle<CR>

Plugin 'The-NERD-tree' 
nmap <F2> :NERDTreeToggle<CR>

function! AcpMeetsForC(context)
    return 0
endfunction

Plugin 'AutoComplPop'
"let g:acp_behavior = { 
"\ 'c': [ {'command' : "\<C-x>\<C-o>",
"\       'meets' : 'AcpMeetsForC',
"\       'completefunc': 'ccomplete#Complete',
"\       'repeat' : 0}
"\      ]  
"\}

"(unused)
let g:AutoComplPop_CompleteoptPreview = 1
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col||getline('.')[col-1]!~'\k'
        return "\<TAB>"
    else
        if pumvisible()
            return "\<c-n>"
        else
            return "\<c-n>\<c-p>"
        end
    endif
endfunction

function! TabWrap()
    if pumvisible()
        return "\<CR>"
    else
        return "\<TAB>"
    endif
endfunction

"tab to complete.
inoremap <TAB> <c-r>=TabWrap()<CR>

"set case sensitive options in insert mode auto complete.
set ignorecase
set infercase

"inoremap <tab> <c-r>=InsertTabWrapper()<cr>
"omni complete shortcut in insert mode.
"imap <c-o> <c-x><c-o>

" <c-t> to search tags only.
imap <c-]> <c-x><c-]>
imap <c-t> <c-]>

"Plugin 'TagHighlight'
":UpdateTypesFileOnly   
"this command don't generate tags file and just use existing tags file.
"
":UpdateTypesFile

"highlight colors change
"highlight Comment ctermfg=DarkCyan
highlight DefinedName ctermfg=Brown
highlight Member ctermfg=Gray
highlight EnumerationValue ctermfg=Magenta
highlight GlobalVariable ctermfg=DarkGray
colorscheme slate

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"now MY OWN Vimrc
set autoindent "auto indent
set cindent    "for c

set nu         "view line numbers

set tabstop=4     "the width of a TAB is set to 4
                  "Still it is a \t. It is just that vim will interpret it 
                  "to be having a width of 4.
set shiftwidth=4  "Indents will have a width of 4
set softtabstop=4 "set the number of columns for a TAB

set expandtab     " TAB을 space로 인식
"set noexpandtab  " TAB을 TAB으로 인식                         

"------------------------------------------------------------
"want more key mappings? 
"
" USE :verbose map <keymappings> to know already mapped key.


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

"TODO: <F5>로 ide처럼 빌드하고 실행하고 싶은데, 
"함수를 설정해서, 그 함수에 지금 세션에서 사용할 
"make 명령어를 한 번 넣으면 그 이후에는 <F5>만 누르면
"자동으로 다 하게 할 수는 없는걸까
"아니면 변수를 어떻게 써야 되나?
"let g:mkstr = 'make'
"press <F5> to save and make in command mode
"map <F5> :w<CR> :!sh -c 'make'<CR>
"press <F5> to save and make in insert mode
"map! <F5> <ESC>:w<CR> :!sh -c 'make'<CR>


" *LINUX ONLY* script
"  save ALL buffers
"  change local working directory to this window file's path
"  make
"press <F5> to save ALL buffers and make in command mode
"map <F5> :wa<CR>:lcd %:p:h<CR>:!clear<CR>:!sh -c 'make t' <CR>
"imap <F5> <ESC>:wa<CR>:lcd %:p:h<CR>:!clear<CR> :!sh -c 'make t' <CR>
"map <F5> :wa<CR>:lcd %:p:h<CR>:!clear<CR>:!sh -c 'make t' <CR>:make! t<CR>
"imap <F5> <ESC>:wa<CR>:lcd %:p:h<CR>:!clear<CR>:!sh -c 'make t' <CR>:make! t<CR>

" save ALL buffers.
" get ctags(use sh script..)
"
"map <F8> :make ctags<CR>:UpdateTypesFileOnly<CR>
"imap <F8> <ESC>:make ctags<CR>:UpdateTypesFileOnly<CR>i
"
"map <F8> :wa<CR>:UpdateTypesFile<CR>
"imap <F8> <ESC>:wa<CR>:UpdateTypesFile<CR>i
"
"map <F8> :wa<CR>:UpdateTypesFileOnly<CR>
"imap <F8> <ESC>:wa<CR>:UpdateTypesFileOnly<CR>i


"imap jj <ESC>

"Ctrl + c for copying to + register
map <C-c> "+Y
"Ctrl + v for pasteing to + register
map <C-v> "+p

"Ctrl + q for save & quit the window
"nmap <C-q> :wq<CR>   "why it didn't work??
"Ctrl + Q for save & close the buffer

"gm to go to middle of line
"TODO: it have to work on visual mode too!

map gm :call cursor(0, virtcol('$')/2)<CR>

" *LINUX ONLY* script
"set Hanja_key to ESC. if some trouble happen...
"Just press <F12>. And you can use Hanja_key for ESC 
"한자키가 한글을 한자로 바꾸려는 동작 때문에
"기능이 한영 전환키에 묶여있다. 이걸 해킹 하는 법은 아직 모르겠다.
"map <F12> :!xmodmap -e "keycode 131 = Escape"<CR>
"map! <F12> <ESC>:!xmodmap -e "keycode 131 = Escape"<CR>



"TODO: map <C-f> in visual mode: 
"1)block some words in visual mode 
"2)press <C-f>
"3)input some string
"and replace session (option: gc)

" <c-i> 함수를 호출해서, 문맥에 맞게 커서를 이동시켜 insert하는 단축키.

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
map ww :wa<CR>

"set working directory along to current buffer.
"set autochdir

""""""""""""""""""""""""function keys summary""""""""""""""""""""""""
"F2     NERD-TREE

"F5     save all, build(make t), run.
"F8     get c tagfile(make ctags), UpdateTypesFileOnly. (need get-tags.sh)

"F9     toggle relativeLineNumber
"F12    hanja_key to ESC_key


"""""""""""""""""""""custom key mappings summary"""""""""""""""""""""
"
"   NORMAL mode
" <ENTER>   
" <C-O>
" <TAB>
" <SPACE>
"
" <C-P>     paste yanked data 
"
" <C-c>
" <C-v>
"
" <C-h>
" <C-j>
" <C-k>
" <C-l>
"
" ]         go next tag
" [         go prev tag
"
" gm
" 
" <Esc><Esc>


"   INSERT mode
" <c-o>     omni-complete
" <c-t>     tag-complete
"
" jj
" <TAB>     complete!
" 

"   COMMAND mode
" VB
" InitScreen
" QuitScreen
