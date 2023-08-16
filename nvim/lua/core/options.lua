vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.backspace = { 'indent', 'eol', 'start' }
vim.opt.hidden = true
vim.opt.ruler = true
vim.opt.showcmd = true
vim.opt.mouse = 'nvi'
vim.opt.cursorline = true
vim.opt.cursorcolumn = false
vim.opt.textwidth = 80
vim.opt_local.columns = 80
vim.opt.laststatus = 0
vim.o.cmdheight = 0
vim.opt.number = true
vim.opt.relativenumber = true
-- vim.opt.foldmethod = 'indent'
-- vim.opt.foldenable = true
-- vim.opt.foldmarker = '{{{,}}}'
vim.opt.scrolloff = 2
vim.opt.sidescrolloff = 10
vim.opt.list = true
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.wrap = true
vim.opt.spell = false
vim.opt.spelllang = { 'de' }
-- vim.opt.spelllang = { 'en_us' }
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.syntax = 'enable'
vim.opt.encoding = 'utf-8'
-- eob: ,fold: ,foldopen:,foldsep: ,foldclose:
-- vim.opt.fillchars:append({ eob = ' ', fold = ' ', foldsep = ' ', foldopen = '', foldclose = '' })
-- vim.opt.fillchars:append({ eob = ' ', fold = ' ', foldsep = ' ', foldopen = ' ', foldclose = ' ' })
vim.opt.termguicolors = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.signcolumn = 'yes:1'
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- Multi Cursors
vim.g.VM_maps = {
    ['Select l'] = '<C-Right>',
    ['Select h'] = '<C-Left>',
}
--      vim.g.python3_host_prog = '/Library/Frameworks/Python.framework/Versions/3.11/bin/python3'

-- vim.cmd("colorscheme gruvbox")

vim.o.completeopt = 'menu,menuone,noselect'

-- set listchars=tab:>·,trail:~,extends:>,precedes:<,space:·

vim.opt.listchars = {
    tab = '→\\ ',
    trail = '~',
    nbsp = '␣',
    eol = '¬',
    space = '·',
}

-- Automatically toggle NvimTree and focus on it when Neovim starts
vim.cmd([[
    autocmd VimEnter * NvimTreeToggle
    autocmd VimEnter * wincmd l
]])

-- Automatically format the buffer with Neoformat before writing
-- vim.cmd([[
--     augroup fmt
--         autocmd!
--         autocmd BufWritePre * undojoin | Neoformat
--     augroup END
-- ]])

vim.env.FZF_LUA_NVIM_BIN = 'nvim'
