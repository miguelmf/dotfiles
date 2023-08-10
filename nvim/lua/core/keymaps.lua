vim.api.nvim_set_keymap('n', '<leader>Y', 'ggyG``', { noremap = true, silent = true })

-- local builtin = require('telescope.builtin')
-- vim.keymap.set('n', '<C-p>', builtin.find_files, {})
-- vim.keymap.set('n', '<C-f>', builtin.live_grep, {})
-- vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- nvim-tree
-- vim.api.nvim_set_keymap('n', '<C-k>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.cmd('nnoremap <C-k> :NvimTreeToggle<CR>')

-- copilot
vim.cmd('let g:copilot_no_tab_map = v:true')
vim.cmd('imap <silent><script><expr> <Right> copilot#Accept("<Right>")')

-- trouble
-- vim.keymap.set("n", "<C-i>", function() require("trouble").open() end)
-- vim.keymap.set("n", "<leader>xw", function() require("trouble").open("workspace_diagnostics") end)
-- vim.keymap.set("n", "<leader>xd", function() require("trouble").open("document_diagnostics") end)
-- vim.keymap.set("n", "<leader>xq", function() require("trouble").open("quickfix") end)
-- vim.keymap.set("n", "<leader>xl", function() require("trouble").open("loclist") end)
-- vim.keymap.set("n", "gR", function() require("trouble").open("lsp_references") end)
vim.cmd('nnoremap <C-i> <cmd>TroubleToggle<cr>')

-- barbar
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map('n', '<C-t>', '<Cmd>tabnew<CR>', opts)
map('n', '<C-Left>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<C-Right>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
-- map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
-- map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
-- map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
-- map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
-- map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
-- map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
-- map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
-- map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
-- map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
-- map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
-- map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
-- map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
-- map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
map('n', '<C-q>', '<Cmd>BufferClose<CR>', opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
-- map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
-- -- Sort automatically by...
-- map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
-- map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
-- map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
-- map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used

-- Clear last search highlighting
vim.api.nvim_set_keymap('n', '<CR>', [[:noh<CR><CR>]], { noremap = true, silent = true })
