"---------------------------------------------------------------------------------------------------
" Dan's vimrc
"
"---------------------------------------------------------------------------------------------------

runtime bundle/vim-pathogen/autoload/pathogen.vim "load the pathogen plugin
silent! execute pathogen#infect()                 "run pathogen
silent! execute pathogen#helptags()               "generate help files
set nocompatible                                  "make Vim behave more like Vim than Vi
filetype plugin indent on                         "enable file detection, plugins and indenting
set number                                        "turn on line numbers
set showcmd                                       "show partial command in the lower right of the screen
set showmatch                                     "show matching brackets
set splitbelow                                    "split windows at the bottom of the screen
set laststatus=2                                  "show the statusline as the 2nd-last line in the editor window
set ttyfast                                       "assume a fast terminal connection
set lazyredraw                                    "don't redraw the screen when executing macros, to force use :redraw
set hidden                                        "hide buffers when abandoned rather than unload them
set hlsearch                                      "highlight all search matches
set incsearch                                     "incrementally highlight all matches as the pattern is typed
set ignorecase                                    "case insensitive search
set smartcase                                     "case insensitive search unless >=1 search chars is uppercase
set tabstop=2                                     "the width of a <Tab> character (in spaces)
set expandtab                                     "when the <Tab> key is hit insert spaces instead
set smartindent                                   "indents are automatically inserted
set softtabstop=2                                 "number of spaces to insert when using <Tab>
set shiftwidth=2                                  "number of spaces to insert/delete for each indent (i.e. >>, << )
set spelllang=en_au                               "use en_au for spell checking when enabled
set nrformats=                                    "treat all numerals as decimal regardless of zero padding (ctrl-a/x)
set dict+=$HOME/words.txt                         "file name for dictionary completion
set complete+=k                                   "add dictionary file to auto complete (CTRL-N)
set thesaurus+=$HOME/mthesaur.txt                 "file name for thesaurus completion
set cpoptions+=$                                  "when changing a line show '$' at the end rather than clearing it
set history=1000                                  "keep the last n commands in history
set autoread                                      "automatically read files if changed outside of vim
set autoindent                                    "copy indent from current line when starting a new line
set backspace=indent,eol,start                    "make backspace work over line breaks etc.
set wildmode=longest,list,full                    "if more than 1 match list all & complete to longest string
set wildmenu                                      "enable enhanced command-line completion
set wildignore+=.hg,.git,.svn                     "version control
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg    "binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.zip       "compiled object files
set wildignore+=*.manifest,_ReSharper.*/**

"-------------------------------------------------------------------------------
" Key mappings
"-------------------------------------------------------------------------------
"use ',' instead of '\' for leader
let mapleader = ","
"less chance of global plugins clashing if localleader is different from leader
let maplocalleader = "\\"
"use jj instead of <Esc> to switch from insert to command mode
imap jj <Esc>
"use :w!! to write a file using sudo
cmap w!! %!sudo tee > /dev/null %
",l toggles eol - tab character visibility
nmap <leader>l :set list!<CR>
"quick edit of vimrc
nnoremap <leader>ev :e c:/Vim/vimfiles/vimrc<cr>
" Hit return to turn search highlighting off
nnoremap <CR> :nohlsearch<CR><CR>
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif
"use very magic regex, see :h magic
nnoremap / /\v
vnoremap / /\v
cnoremap %s/ %s/\v
"move by screen line when wrapping
nnoremap j gj
nnoremap k gk

"-------------------------------------------------------------------------------
" Buffer shortcuts
"-------------------------------------------------------------------------------
" cycle through buffers with CTRL+left/right arrow key
map <C-left> <ESC>:bp<CR>
map <C-right> <ESC>:bn<CR>

"-------------------------------------------------------------------------------
" vim-airline plugin: http://github.com/bling/vim-airline
"-------------------------------------------------------------------------------
let g:airline_theme='powerlineish'
let g:airline_powerline_fonts=1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_branch_prefix = ' '
let g:airline_readonly_symbol = ''
let g:airline_linecolumn_prefix = ' '
let g:airline_section_b = '%{getcwd()}'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#fnamemod = ':p'
let g:airline#extensions#tabline#fnamecollapse = 0
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

"-------------------------------------------------------------------------------
" Unimpaired plugin: http://github.com/tpope/vim-unimpaired
"-------------------------------------------------------------------------------
" bubble single lines of text up and down with ctrl up/down arrow
nmap <C-Up> [e
nmap <C-Down> ]e
" bubble multiple lines of text in visual mode with ctrl up/down arrow
vmap <C-Up> [egv
vmap <C-Down> ]egv

"-------------------------------------------------------------------------------
" SCRATCH plugin: https://github.com/vim-scripts/scratch.vim
"-------------------------------------------------------------------------------
" ,s toggles the scratch plugin
map <leader>s :call ToggleScratch()<CR>
function! ToggleScratch()
  if expand('%') == g:ScratchBufferName
    quit
  else
    Sscratch
  endif
endfunction

"-------------------------------------------------------------------------------
" NERDTree plugin: https://github.com/scrooloose/nerdtree
"-------------------------------------------------------------------------------
" ,d toggles the nerd tree plugin
map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>
" ,dc opens NerdTree with c:\ as root
map <leader>dc :NERDTree c:\\<CR>
" ,dh opens NerdTree with h:\ as root
map <leader>dh :NERDTree h:\\<CR>

"-------------------------------------------------------------------------------
" CtrlP plugin: https://github.com/kien/ctrlp.vim.git
"-------------------------------------------------------------------------------
let g:ctrlp_use_caching = 1
map <leader>t :CtrlP getcwd()<CR>
map <leader>tb :CtrlPBuffer<CR>
map <leader>tf :CtrlPClearCache<CR>

"-------------------------------------------------------------------------------
" YankRing plugin: https://github.com/vim-scripts/YankRing.vim
"-------------------------------------------------------------------------------
" F11 displays the contents of the yankring
nnoremap <silent> <F11> :YRShow<CR>

"-------------------------------------------------------------------------------
" Solarized colorscheme: http://github.com/altercation/vim-colors-solarized
"-------------------------------------------------------------------------------
" F6 to change to solarized and toggle dark or light
call togglebg#map("<F6>")

function! OpenURL(url)
  if has("win32") || has("win64")
    exe "!start cmd /cstart /b ".a:url.""
  elseif $DISPLAY !~ '^\w'
    exe "silent !sensible-browser \"".a:url."\""
  else
    exe "silent !sensible-browser -T \"".a:url."\""
  endif
  redraw!
endfunction
command! -nargs=1 OpenURL :call OpenURL(<q-args>)
" open URL under cursor in browser
nnoremap gb :OpenURL <cfile><CR>
nnoremap gG :OpenURL http://www.google.com/search?q=<cword><CR>
nnoremap gW :OpenURL http://en.wikipedia.org/wiki/Special:Search?search=<cword><CR>

"-------------------------------------------------------------------------------
" Autocommands
"-------------------------------------------------------------------------------
if has("autocmd")
  autocmd GUIEnter * simalt ~x " Start GVIM maximized
  " Force filetypes for unknown extensions
  autocmd BufRead,BufNewFile *.rpa set filetype=pascal
  autocmd BufRead,BufNewFile *.json set filetype=javascript
  autocmd BufRead,BufNewFile *.vssettings set filetype=xml
  autocmd BufRead,BufNewFile *.cshtml set filetype=html
  " Remove trailing whitespaces
  fun! <SID>StripTrailingWhitespaces()
      let l = line(".")
      let c = col(".")
      %s/\s\+$//e
      call cursor(l, c)
  endfun
  autocmd BufWritePre *.c,*.rb,*.java,*.js,*.cs,*.cshtml,*.txt,*.sql :call <SID>StripTrailingWhitespaces()
  "highlight the entire line containing the cursor when in insert mode
  if v:version >= 700
    autocmd InsertEnter * set cursorline
    autocmd InsertLeave * set nocursorline
  endif
endif

if has("gui_running")
  if has("win32") || has("win64")
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h10
  elseif has("unix")
    set guifont=DejaVu_Sans_Mono\ 12
  endif
  syntax on           "syntax highlighting enabled
  set guioptions-=m   "no menu
  set guioptions-=T   "no toolbar
  set background=dark
  colorscheme solarized
endif

" Don't need to keep backups on the OpenVMS cluster
if has("vms")
  set nobackup
else
  set undofile
  set undoreload=10000
  set backupext=.bak
  set backup
endif

" Set windows / unix specific options
if has("win32") || has("win64")
  let g:ruby_path = ':C:\ruby\bin'
  set undodir=c:/Temp/vim/undo/
  set backupdir=c:/Temp/vim/backup/
  set directory=c:/Temp/vim/swap/
elseif has("unix")
  set undodir=$HOME/.vim/tmp/undo/
  set backupdir=$HOME/.vim/tmp/backup/
  set directory=$HOME/.vim/tmp/swap/
endif

if has("multi_byte")
  set encoding=utf-8            "use multibyte char encoding for Unicode
  set listchars=tab:▸\ ,eol:¬   "tab:i_CTRL-v u25b8, eol:i_CTRL-v u00ac
endif

" Set some Vim 7.3 introduced options
if version < 730
  set colorcolumn=120 " Show a coloured column close to the maximum text width
  ",r toggles relative line numbering
  nnoremap <leader>r :call ToggleRNU()<CR>
  function! ToggleRNU()
    if(&relativenumber == 1)
      set norelativenumber
      set number
    else
      set nonumber
      set relativenumber
    endif
  endfunction
endif
