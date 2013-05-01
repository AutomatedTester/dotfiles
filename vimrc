" configure expanding of tabs for various file types
au BufRead,BufNewFile *.py set expandtab
au BufRead,BufNewFile *.c set noexpandtab
au BufRead,BufNewFile *.h set noexpandtab
au BufRead,BufNewFile Makefile* set noexpandtab

autocmd BufRead *.py set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
autocmd BufRead *.py nmap <F5> :!python %<CR>

" autocmd BufWritePost * if getline(1) =~ "^#!" | silent !chmod +x <afile> | endif
" --------------------------------------------------------------------------------
" configure editor with tabs and nice stuff...
" --------------------------------------------------------------------------------
set expandtab           " enter spaces when tab is pressed
set textwidth=120       " break lines when line length increases
set tabstop=4           " use 4 spaces to represent tab
set softtabstop=4
set shiftwidth=4        " number of spaces to use for auto indent
set autoindent          " copy indent from current line when starting a new line
set title

set cul 
set cuc

" make backspaces more powerfull
set backspace=indent,eol,start

set ruler               " show line and column number
syntax on               " syntax highlighting
set showcmd             " show (partial) command in status line
set number

"Incremental search
set incsearch

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

filetype off           " enables filetype detection
filetype plugin indent on     " enables filetype specific plugins

" HTML (tab width 2 chr, no wrapping)
autocmd FileType html set sw=2
autocmd FileType html set ts=2
autocmd FileType html set sts=2
autocmd FileType html set textwidth=0

" js (tab width 2 chr, no wrapping)
autocmd FileType javascript set sw=2
autocmd FileType javascript set ts=2
autocmd FileType javascript set sts=2

" json (tab width 2 chr, no wrapping)
autocmd FileType json set sw=2
autocmd FileType json set ts=2
autocmd FileType json set sts=2

" CSS (tab width 2 chr, wrap at 79th char)
autocmd FileType css set sw=2
autocmd FileType css set ts=2
autocmd FileType css set sts=2

" Jade (tab width 2 chr, wrap at 79th char)
autocmd FileType jade set sw=2
autocmd FileType jade set ts=2
autocmd FileType jade set sts=2

" Mappings
map! ,td //TODO(David) 
map! ,dc describe('',function(){<CR>  describe('', function(){<CR>  it('', function(done){<CR>  done()<CR>});<CR>});<CR>});
map! ,it it('', function(done){<CR>  done()<CR>});<Up><Up>
map! ,da describe('', function(){<CR>  it('', function(done){<CR>  done()<CR>}); <CR>});
nmap <F8> :TagbarToggle<CR> 

let g:pydiction_location = '~/.vim/bundle/Pydiction/complete-dict'

set list listchars=tab:→\ ,trail:·

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" ---------------
" Plugin Bundles
" ---------------

" Navigation
Bundle 'ZoomWin'
Bundle 'wincent/Command-T'
" This fork is required due to remapping ; to :
Bundle 'christoomey/vim-space'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'kien/ctrlp.vim'
" UI Additions
Bundle 'mutewinter/vim-indent-guides'
Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/nerdtree'
Bundle 'Rykka/colorv.vim'
Bundle 'nanotech/jellybeans.vim'
Bundle 'tomtom/quickfixsigns_vim'
" Commands
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'godlygeek/tabular'
Bundle 'mileszs/ack.vim'
Bundle 'gmarik/sudo-gui.vim'
Bundle 'milkypostman/vim-togglelist'
Bundle 'AndrewRadev/sideways.vim'
Bundle 'keepcase.vim'
Bundle 'scratch.vim'
Bundle 'mattn/zencoding-vim'
Bundle 'mutewinter/GIFL'
Bundle 'swaroopch/vim-markdown-preview'
Bundle 'AndrewRadev/switch.vim'
" Automatic Helpers
Bundle 'IndexedSearch'
Bundle 'xolox/vim-session'
Bundle 'Raimondi/delimitMate'
Bundle 'scrooloose/syntastic'
Bundle 'ervandew/supertab'
Bundle 'gregsexton/MatchTag'
Bundle 'Shougo/neocomplcache'
" Language Additions
" Ruby
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
" JavaScript
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'leshill/vim-json'
Bundle 'itspriddle/vim-jquery'
Bundle 'nono/vim-handlebars'
Bundle 'jshint.vim'
" TomDoc
Bundle 'mutewinter/tomdoc.vim'
Bundle 'jc00ke/vim-tomdoc'
" Other Languages
Bundle 'msanders/cocoa.vim'
Bundle 'mutewinter/taskpaper.vim'
Bundle 'mutewinter/nginx.vim'
Bundle 'timcharper/textile.vim'
Bundle 'mutewinter/vim-css3-syntax'
Bundle 'acustodioo/vim-tmux'
Bundle 'hallison/vim-markdown'
Bundle 'xhtml.vim--Grny'
Bundle 'groenewege/vim-less'
" MatchIt
Bundle 'matchit.zip'
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'
" Libraries
Bundle 'L9'
Bundle 'tpope/vim-repeat'
Bundle 'mathml.vim'

" Python Syntax Checker
Bundle 'kevinw/pyflakes-vim'
Bundle 'vim-scripts/pep8'
Bundle 'vim-scripts/Pydiction'
Bundle "vim-scripts/indentpython.vim"

