set nocompatible
set sw=2

" Required Vundle setup
filetype off
set runtimepath+=~/.vim/bundle/vundle
call vundle#rc()

" loading vundle bundle first
Bundle 'gmarik/vundle'
"
Bundle 'jelera/vim-javascript-syntax'
Bundle 'pangloss/vim-javascript'
Bundle 'nathanaelkane/vim-indent-guides'
"
Bundle 'digitaltoad/vim-jade'
"
Bundle 'airblade/vim-gitgutter'
"
Bundle 'walm/jshint.vim.git'
"
Bundle 'scrooloose/nerdtree'
"
Bundle 'rodjek/vim-puppet'
"
Bundle 'majutsushi/tagbar'
"
Bundle 'kchmck/vim-coffee-script.git'
"
Bundle 'tpope/vim-fugitive'
"
Bundle 'maksimr/vim-jsbeautify'
"
Bundle 'groenewege/vim-less'
" <C-A> to add a new window tile
" <C-ENTER> to focus current tile to main
Bundle 'jonmaim/dwm.vim'
" status line
Bundle 'Lokaltog/powerline'
" <C-_> <C-_> to comment the current line/region
Bundle 'vim-scripts/tComment'
" :TName 'tab_page_name' - set tab name
" :TNoName - remove tab page name
Bundle 'nhooey/tabname'
"
Bundle 'Valloric/YouCompleteMe'
"
Bundle 'marijnh/tern_for_vim'
" automatically add the closing quote, bracket, etc.
Bundle 'Raimondi/delimitMate'
" syntax checking
Bundle 'scrooloose/syntastic'

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
    let g:syntastic_javascript_jshint_conf = l:jshintrc
endfunction

au BufEnter * call UpdateJsHintConf()
let g:syntastic_always_populate_loc_list=1
let g:syntastic_debug = 0
" This does what it says on the tin. It will check your file on open too, not just on save.
" You might not want this, so just leave it out if you don't.
let g:syntastic_check_on_open=1

" These are the tweaks I apply to YCM's config, you don't need them but they might help.
" YCM gives you popups and splits by default that some people might not like, so these should tidy it up a bit for you.
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview

" powerline setup
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
set laststatus=2
set encoding=utf-8
set t_Co=256
let g:Powerline_symbols = 'fancy'

set nofoldenable
"set smartindent
"set autoindent
"set cindent

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

" <c-n> to toggle nerdtree
map <silent> <C-n> :execute 'NERDTreeToggle '<CR>
" nerdtree position and size
let NERDTreeWinPos = "left"
let NERDTreeWinSize = 30
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
filetype plugin indent on
" syntax highlighting
syntax on

"Color scheme
colorscheme candy
set background=dark
" git gutter color should be black
highlight clear SignColumn
" Highlight terms in yellow (need to be set after color scheme)
highlight search ctermbg=yellow ctermfg=black
" line number color
highlight LineNr ctermfg=grey
" display non printing character as errors.
highlight Error guibg=red ctermbg=darkred
match Error /[\x7f-\xff]/

"Line numbering
set number

" tab and indent rule
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

" tabs
map tn <ESC>:tabnext<CR>
map tp <ESC>:tabprevious<CR>

" Code
" Automatic code indent
"set cindent
" 80 chars line
"set textwidth=80
" compiling
set makeprg=./compile.debug.all
" map next/prev error
map cn <ESC>:cn<CR>
map cp <ESC>:cp<CR>
map <F2> <ESC>:wa<CR><ESC>:make<CR>
map! <F2> <ESC>:wa<CR><ESC>:make<CR>
map <F10> <ESC>:%s///g<CR>

" <c-f> to beautify
map <c-f> :call JsBeautify()<cr>
autocmd FileType javascript noremap <buffer> <c-f> :call JsBeautify()<cr>
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

" delete .vim/.netrwhist
au VimLeave * if filereadable("~/.vim/.netrwhist")|call delete("~/.vim/.netrwhist")|endif

" automatically remove trailing whitespace when saving
autocmd BufWritePre *.js :%s/\s\+$//e
autocmd BufWritePre *.html :%s/\s\+$//e
autocmd BufWritePre *.vimrc :%s/\s\+$//e

" compiles coffee script files silently and with the --bare and --print options
" to shows any errors without generating .js files.
au BufWritePost *.coffee silent CoffeeMake! -bp | cwindow | redraw!
au BufWritePost Cakefile silent CoffeeMake! -bp | cwindow | redraw!

" force markdown on all *.md files
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
