vim.api.nvim_set_keymap('n', '<leader>Y', "ggyG``", { noremap = true, silent = true })

-- local builtin = require('telescope.builtin')
-- vim.keymap.set('n', '<C-p>', builtin.find_files, {})
-- vim.keymap.set('n', '<C-f>', builtin.live_grep, {})
-- vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- nvim-tree
-- vim.api.nvim_set_keymap('n', '<C-k>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.cmd("nnoremap <C-k> :NvimTreeToggle<CR>")

-- copilot
vim.cmd("let g:copilot_no_tab_map = v:true")
vim.cmd('imap <silent><script><expr> <Right> copilot#Accept("<Right>")')

-- trouble
-- vim.keymap.set("n", "<C-i>", function() require("trouble").open() end)
-- vim.keymap.set("n", "<leader>xw", function() require("trouble").open("workspace_diagnostics") end)
-- vim.keymap.set("n", "<leader>xd", function() require("trouble").open("document_diagnostics") end)
-- vim.keymap.set("n", "<leader>xq", function() require("trouble").open("quickfix") end)
-- vim.keymap.set("n", "<leader>xl", function() require("trouble").open("loclist") end)
-- vim.keymap.set("n", "gR", function() require("trouble").open("lsp_references") end)
vim.cmd("nnoremap <C-i> <cmd>TroubleToggle<cr>")
