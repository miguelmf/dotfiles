vim.g.coq_settings = {
   -- Other settings
  keymap = {
    recommended=false,
  },
  auto_start = 'shut-up',

  clients = {
    buffers = {
      enabled = true,
      -- weight_adjust = -1.9,
      weight_adjust = 1,
    },
    tree_sitter = {
      enabled = true,
      -- weight_adjust = -1.5
      weight_adjust = 1
    },
    lsp = {
      enabled = true,
      -- weight_adjust = 1.5
      weight_adjust = 1
    },
    snippets = {
      enabled = true,
      -- weight_adjust = 1.9
      weight_adjust = 2
    },
    paths = {
      enabled = true,
      -- weight_adjust = 1.9
      weight_adjust = 1
    },
  }
}

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-n>"
    -- elseif _G.COQmarks_available() == true then
    elseif _G.COQ.Marks_available() == true then
        return t "<C-h>"
    else
        return t "<Tab>"
    end
end

vim.api.nvim_set_keymap("n", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
