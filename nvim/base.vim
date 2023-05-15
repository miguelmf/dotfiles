syntax on
" autocmd! bufreadpost *.csv set syntax=off

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set startofline
set number
set cursorline
set ignorecase
set smartcase
set wrap
set noswapfile
set nobackup
set relativenumber
set undodir=~/.vim/undodir
set undofile
set incsearch
set exrc        " enables reading of '.nvimrc' or '.exrc' in cd
set noshowmode
set updatetime=750
set shortmess+=c
set clipboard+=unnamedplus
set list
set listchars=tab:>·,trail:~,extends:>,precedes:<,space:·
set completeopt=menuone,noselect
set hidden "" dont have to write files to disk to switch from them in buffer
let g:tex_conceal = 0 " dont glyphify characters
set encoding=utf8
set laststatus=0
set noshowcmd

" :Spell => enable spelling command 
command Spell :setlocal spell spelllang=en_us

"Keep Window & Cursor Position When Switching Buffers
if v:version >= 700
  au BufLeave * let b:winview = winsaveview()
  au BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
endif

" Remember cursor pos
autocmd BufReadPost *
  \  if line("'\"") > 1 && line("'\"") <= line("$") |
  \    exe "normal! g`\"" |
  \  endif

