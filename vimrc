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


filetype on            " enables filetype detection
filetype plugin on     " enables filetype specific plugins

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
