set nocompatible
set sw=2

" Required Vundle setup
filetype off
set runtimepath+=~/.vim/bundle/vundle
call vundle#rc()

" loading vundle bundle first
Bundle 'gmarik/vundle'

" JS Parenthesis, curly and regular brackets
" The semicolon or comma at the end of line
" Browser, DOM and Ajax keywords like objects, methods, properties and others
" Operation, comparison and logical symbols (=,==,===,!=,etc.)
Bundle 'jonmaim/vim-javascript-syntax'
Bundle 'pangloss/vim-javascript'
" enable with <leader>ig
Bundle 'nathanaelkane/vim-indent-guides'

" Shows a git diff in the 'gutter' (sign column). It shows whether each line has been added,
" modified, and where lines have been removed. You can also stage and revert individual hunks.
Bundle 'airblade/vim-gitgutter'

" <C-A> to add a new window tile
" <C-ENTER> to focus current tile to main
Bundle 'jonmaim/dwm.vim'

" file navigation
Bundle 'scrooloose/nerdtree'

" automatically add the closing quote, bracket, etc.
Bundle 'Raimondi/delimitMate'

" status line
Bundle 'Lokaltog/powerline'
" add the current branch in the powerline
Bundle 'tpope/vim-fugitive'

" <C-_> <C-_> to comment the current line/region
Bundle 'vim-scripts/tComment'

" :TName 'tab_page_name' - set tab name
" :TNoName - remove tab page name
"Bundle 'nhooey/tabname'

" syntax checking
" disable with :SyntasticToggleMode
Bundle 'scrooloose/syntastic'

"
"Bundle 'marijnh/tern_for_vim'
"
Bundle 'Valloric/YouCompleteMe'

" snippet solution
Bundle 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Bundle 'honza/vim-snippets'

" puppet files
Bundle 'rodjek/vim-puppet'
" jade templates
Bundle 'digitaltoad/vim-jade'
" nginx.conf
Bundle 'evanmiller/nginx-vim-syntax'
" coffee script files
Bundle 'kchmck/vim-coffee-script.git'
" less files
Bundle 'groenewege/vim-less'
" markdown files
Bundle 'plasticboy/vim-markdown'

" indent guides setup
let g:indent_guides_guide_size = 1

"let g:tern_map_keys=1

" shortcut to add a new line without leaving insert mode
imap <C-c> <CR><Esc>O<Tab>

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-b>"
let g:UltiSnipsJumpBackwardTrigger="<C-z>"
" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"

" Customize mappings snipMate uses to change the key that triggers
" snippets and moves to the next tabstop.
" Now <tab> can be used to autocomplete.
"imap <C-J> <Plug>snipMateNextOrTrigger
"smap <C-J> <Plug>snipMateNextOrTrigger

" Custom syntastic settings:
function s:find_jshintrc(dir)
  let l:found = globpath(a:dir, '.jshintrc')
  if filereadable(l:found)
    return l:found
  endif

  let l:parent = fnamemodify(a:dir, ':h')
  if l:parent != a:dir
    return s:find_jshintrc(l:parent)
  endif

  return "~/.jshintrc"
endfunction
function UpdateJsHintConf()
  let l:dir = expand('%:p:h')
  let l:jshintrc = s:find_jshintrc(l:dir)
  let g:syntastic_javascript_jshint_args = '--config ' . l:jshintrc
endfunction
au BufEnter * call UpdateJsHintConf()

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_debug = 0
" Check your file syntax on open too, not just on save.
let g:syntastic_check_on_open=1

" YCM gives you popups and splits by default that some people might
" not like, so these should tidy it up a bit for you.
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview

" powerline setup
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
set laststatus=2
set encoding=utf-8
set t_Co=256
let g:Powerline_symbols = 'fancy'

" mouse in vim terminal? oh yeah
set ttymouse=xterm2
set mouse=n

"Remove toolbar
if has("gui_running")
  set guioptions=-t
  set lines=65 columns=270
  set ruler
endif

" make sure that unsaved buffers that are to be put in the background
" are allowed to go in there
" (ie. the "must save first" error doesn't come up)
set hidden
" show the current command in the lower right corner
"set showcmd
" show the current mode
"set showmode
" hide the mouse pointer while typing
"set mousehide

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
set history=200
" yank to system clipboard
set clipboard=unnamed

" <c-n> to toggle nerdtree
map <silent> <C-n> :execute 'NERDTreeToggle '<CR>
" nerdtree position and size
let NERDTreeWinPos = "left"
let NERDTreeWinSize = 35
let NERDTreeQuitOnOpen = 1
" launch NERDTree at start and position the cursor in the main window.
"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p

" invisible chars
" shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" search ignore case + highlight
set ic
set hlsearch
" show the first match for the pattern, while you are still typing it.
set incsearch

" keep all temporary and backup files in one place
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

" detect the type of file
filetype on
"filetype plugin indent on

" syntax highlighting
"syntax on

" Color scheme
colorscheme candy

" git gutter color should be black
highlight clear SignColumn
" Highlight terms in yellow (need to be set after color scheme)
highlight search ctermbg=yellow ctermfg=black
" line number color
highlight LineNr ctermfg=darkgrey
" comments color
highlight Comment ctermfg=grey
" vertical split style
highlight VertSplit ctermbg=darkgrey ctermfg=16

" display non printing character as errors.
highlight Error guibg=red ctermbg=darkred
match Error /[\x7f-\xff]/

"Line numbering
set number

" tab and indent rule
set autoindent
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

" tabs
map tn <ESC>:tabnext<CR>
map tp <ESC>:tabprevious<CR>

" 80 chars line
"set textwidth=80
" compiling
" set makeprg=./compile.debug.all
" map next/prev error
" map cn <ESC>:cn<CR>
" map cp <ESC>:cp<CR>
" map <F2> <ESC>:wa<CR><ESC>:make<CR>
" map! <F2> <ESC>:wa<CR><ESC>:make<CR>
" map <F10> <ESC>:%s/\//g<CR>

" <c-f> to beautify
" map <c-f> :call JsBeautify()<cr>
" autocmd FileType javascript noremap <buffer> <c-f> :call JsBeautify()<cr>
" autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

" delete .vim/.netrwhist
au VimLeave * if filereadable("~/.vim/.netrwhist")|call delete("~/.vim/.netrwhist")|endif

" automatically remove trailing whitespace when saving
autocmd BufWritePre *.js :%s/\s\+$//e
autocmd BufWritePre *.scss :%s/\s\+$//e
autocmd BufWritePre *.css :%s/\s\+$//e
autocmd BufWritePre *.html :%s/\s\+$//e
autocmd BufWritePre *.vimrc :%s/\s\+$//e
autocmd BufWritePre *.pp :%s/\s\+$//e

" compiles coffee script files silently and with the --bare and --print options
" to shows any errors without generating .js files.
au BufWritePost *.coffee silent CoffeeMake! -bp | cwindow | redraw!
au BufWritePost Cakefile silent CoffeeMake! -bp | cwindow | redraw!

" *.md as markdown instead of modula2 files
au BufRead,BufNewFile *.md set filetype=markdown

" force markdown on all *.md files
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" turn off vim recording for good
map q <Nop>
