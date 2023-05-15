set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

" Define path nvimrc path and function to load files
let g:custom_path = '~/.config/nvim/'
func LoadConfig(name)
    exec 'source' g:custom_path . a:name . '.vim'
endfunc

set termguicolors
set background=dark

call LoadConfig('plugins')
call LoadConfig('base')
call LoadConfig('keymap')

let g:gruvbox_contrast_dark = "hard"
let g:gruvbox_bold = 0
let g:gruvbox_italic = 1
let g:gruvbox_italicize_comments = 1
colorscheme gruvbox

" colorscheme kanagawa

call LoadConfig('plugin-settings')

set nocompatible

highlight clear CursorLine
highlight clear CursorLineNR
highlight CursorLineNR gui=bold guifg=Yellow
highlight Comment cterm=italic

set inccommand=split

" neovide configs
"let g:neovide_cursor_animation_length=0
"set guifont=JetBrains\ Mono:h14
