return {
  "phaazon/hop.nvim",
  -- lazy = true,
  config = function()
    require'hop'.setup()
    local set_keymap = vim.api.nvim_set_keymap
    local opts = { noremap = true, silent = false, expr = false }

    set_keymap("n", "s", "<Nop>", { noremap = false })

    -- set_keymap("n", "sc", "<cmd>lua require'hop'.hint_words()<cr>", opts)
    -- set_keymap("x", "sc", "<cmd>lua require'hop'.hint_words()<cr>", opts)
    -- set_keymap("o", "sc", "<cmd>lua require'hop'.hint_words()<cr>", opts)

    set_keymap("n", "s", "<cmd>lua require'hop'.hint_words()<cr>", opts)
    set_keymap("x", "s", "<cmd>lua require'hop'.hint_words()<cr>", opts)
    set_keymap("o", "s", "<cmd>lua require'hop'.hint_words()<cr>", opts)

    -- set_keymap("n", "sl", "<cmd>lua require'hop'.hint_words()<cr>", opts)
    -- set_keymap("x", "sl", "<cmd>lua require'hop'.hint_words()<cr>", opts)
    -- set_keymap("o", "sl", "<cmd>lua require'hop'.hint_words()<cr>", opts)

    -- set_keymap("n", "s/", "<cmd>lua require'hop'.hint_words()<cr>", opts)
    -- set_keymap("o", "s/", "<cmd>lua require'hop'.hint_words()<cr>", opts)
  end,
}