"Launch NERDTree at start and position the cursor in the main window.
"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p

set nofoldenable 
set nocompatible
"set smartindent
"set autoindent
"set cindent

set sw=2

call pathogen#runtime_append_all_bundles()
call pathogen#infect()

runtime repos/tplugin_vim/macros/tplugin.vim
"let g:tcommentGuessFileType_htmldjango = 1

"Compiles coffee script files silently and with the --bare and --print options
" to shows any errors without generating .js files.
au BufWritePost *.coffee silent CoffeeMake! -bp | cwindow | redraw!
au BufWritePost Cakefile silent CoffeeMake! -bp | cwindow | redraw!

"Remove toolbar
if has("gui_running")
   set guioptions=-t
   set lines=65 columns=270
   set ruler
endif

" make sure that unsaved buffers that are to be put in the background are
" allowed to go in there (ie. the "must save first" error doesn't come up)
set hidden
" show the current command in the lower right corner
set showcmd
" show the current mode
set showmode
" hide the mouse pointer while typing
set mousehide
" set up the gui cursor to look nice
set guicursor=n-v-c:block-Cursor-blinkon0
set guicursor+=ve:ver35-Cursor
set guicursor+=o:hor50-Cursor
set guicursor+=i-ci:ver25-Cursor
set guicursor+=r-cr:hor20-Cursor
set guicursor+=sm:block-Cursor-blinkwait175-blinkoff150-blinkon175
" allow pasting into other apps and use simple dialogs
set guioptions=ac
" keep some stuff in the history
set history=100
" yank to system clipboard
set clipboard=unnamed
" toggle nerdtree
map <silent> <C-n> :execute 'NERDTreeToggle '<CR>
" nerdtree position and size
let NERDTreeWinPos = "left"
let NERDTreeWinSize = 30
let NERDTreeQuitOnOpen = 1

" Invisible chars
" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR> 
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

"Search ignore case + highlight
set ic
set hlsearch
" Show the first match for the pattern, while you are still typing it.
set incsearch

"Display non printing character as errors.
match Error /[\x7f-\xff]/

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
colorscheme candy
set background=dark
" Highlitghe terms in yellow (need to be set after color scheme)
highlight search ctermbg=yellow ctermfg=white

"Line numbering
set number

"Tab and indent rule
"set autoindent
"set smartindent
 set tabstop=2
 set softtabstop=2
 set shiftwidth=2
 set expandtab
if has("autocmd")
   autocmd FileType html        setlocal ts=2 sts=2 sw=2 expandtab
   autocmd FileType javascript  setlocal ts=2 sts=2 sw=2 expandtab
   autocmd FileType coffee      setlocal ts=2 sts=2 sw=2 expandtab
   autocmd FileType jade        setlocal ts=2 sts=2 sw=2 expandtab
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

" jsbeautify
map <c-f> :call JsBeautify()<cr>
" or
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

" delete .vim/.netrwhist
au VimLeave * if filereadable("~/.vim/.netrwhist")|call delete("~/.vim/.netrwhist")|endif 

" automatically remove trailing whitespace when saving
autocmd BufWritePre *.js :%s/\s\+$//e
