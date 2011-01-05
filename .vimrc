set nocompatible

"Remove toolbar
if has("gui_running")
   set guioptions=-t
   set lines=65 columns=270
   set ruler
endif

"Search ignore case + highlight
set ic
set hls

"Keep all temporary and backup files in one place
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

"Detect the type of file
filetype on
filetype plugin on
filetype indent on
"Syntax highlighting
syntax on

"Color scheme
colorscheme torte
set background=dark

"Line numbering
set number

"Tab and indent rule
set autoindent
"set smartindent
set tabstop=3
set shiftwidth=3
set expandtab

"Vim tabs
map tn <ESC>:tabnext<CR>
map tp <ESC>:tabprevious<CR>

"Code
"Automatic code indent
"set cindent
" 80 chars line
"set textwidth=80
"Compiling
set makeprg=./compile.debug.all
"Map next/prev error
map cn <ESC>:cn<CR>
map cp <ESC>:cp<CR>
map <F2> <ESC>:wa<CR><ESC>:make<CR>
map! <F2> <ESC>:wa<CR><ESC>:make<CR>
map <F10> <ESC>:%s///g<CR>
