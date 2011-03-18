"Init commands
"autocmd VimEnter * NERDTree

set nofoldenable 
set nocompatible

call pathogen#runtime_append_all_bundles()

runtime repos/tplugin_vim/macros/tplugin.vim
"let g:tcommentGuessFileType_htmldjango = 1

"Remove toolbar
if has("gui_running")
   set guioptions=-t
   set lines=65 columns=270
   set ruler
endif

" Invisible chars
" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR> 
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

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
" set tabstop=3
" set shiftwidth=3
" set expandtab
if has("autocmd")
   autocmd FileType javascript setlocal ts=3 sts=3 sw=3 expandtab
   autocmd FileType jade       setlocal ts=2 sts=2 sw=2 expandtab
endif

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
