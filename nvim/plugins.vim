"Installs vim-plug if uninstalled.
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

"Movement and edit plugins
Plug 'tpope/vim-surround' "Plugin to surround text with brackets et al. Try 'ysiw)'
Plug 'numToStr/Comment.nvim'
Plug 'cohama/lexima.vim' "Matching brackets and all that
Plug 'lewis6991/gitsigns.nvim' "Alternative to gitgutter

" User Interface (UI) plugins
Plug 'romgrk/barbar.nvim' "Buffers in the tab bar
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'neovim/nvim-lspconfig' "LSP configurations for builtin LSP client
Plug 'kyazdani42/nvim-web-devicons' "For icons
Plug 'rktjmp/lush.nvim'
Plug 'npxbr/gruvbox.nvim'
Plug 'phaazon/hop.nvim'

" IDE (completion, snippets) plugins
Plug 'rafamadriz/friendly-snippets'
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } } "Plugin for docstrings
Plug 'RishabhRD/popfix'
Plug 'RishabhRD/nvim-lsputils'
Plug 'ray-x/lsp_signature.nvim' "Signature while typing
Plug 'folke/trouble.nvim'
Plug 'folke/todo-comments.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " We recommend updating the parsers on update
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'ahmedkhalf/project.nvim'
Plug 'https://gitlab.com/yorickpeterse/nvim-dd.git'

" ------nvim-cmp
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'

"latest
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
" Plug 'kyazdani42/nvim-tree.lua'
" Plug 'catppuccin/nvim'
Plug 'ful1e5/onedark.nvim'
Plug 'luukvbaal/stabilize.nvim'
" Plug 'psf/black', { 'branch': 'stable' }
" Plug 'tell-k/vim-autopep8'
Plug 'rebelot/kanagawa.nvim' "colorscheme
Plug 'nvim-telescope/telescope-file-browser.nvim'
" Plug 'elihunter173/dirbuf.nvim'
Plug 'sbdchd/neoformat'
" Plug 'folke/which-key.nvim'
Plug 'github/copilot.vim'
Plug 'nvim-tree/nvim-tree.lua'

call plug#end()
