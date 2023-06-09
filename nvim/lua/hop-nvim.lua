local set_keymap = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = false, expr = false}

set_keymap("n", "s"    , "<Nop>", {noremap = false})

-- set_keymap("n", "sc"    , "<cmd>lua require'hop'.hint_char1()<cr>", opts)
-- set_keymap("x", "sc"    , "<cmd>lua require'hop'.hint_char1()<cr>", opts)
-- set_keymap("o", "sc"    , "<cmd>lua require'hop'.hint_char1()<cr>", opts)

-- set_keymap("n", "sf"    , "<cmd>lua require'hop'.hint_char2()<cr>", opts)
-- set_keymap("x", "sf"    , "<cmd>lua require'hop'.hint_char2()<cr>", opts)
-- set_keymap("o", "sf"    , "<cmd>lua require'hop'.hint_char2()<cr>", opts)

set_keymap("n", "s"    , "<cmd>lua require'hop'.hint_words()<cr>", opts)
set_keymap("x", "s"    , "<cmd>lua require'hop'.hint_words()<cr>", opts)
set_keymap("o", "s"    , "<cmd>lua require'hop'.hint_words()<cr>", opts)
--
-- set_keymap("n", "sl"    , "<cmd>lua require'hop'.hint_lines()<cr>", opts)
-- set_keymap("x", "sl"    , "<cmd>lua require'hop'.hint_lines()<cr>", opts)
-- set_keymap("o", "sl"    , "<cmd>lua require'hop'.hint_lines()<cr>", opts)
--
-- set_keymap("n", "s/"    , "<cmd>lua require'hop'.hint_patterns()<cr>", opts)
-- set_keymap("o", "s/"    , "<cmd>lua require'hop'.hint_patterns()<cr>", opts)

require'hop'.setup()
