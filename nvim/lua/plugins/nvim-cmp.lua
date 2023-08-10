local M = {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "saadparwaiz1/cmp_luasnip",
        "L3MON4D3/LuaSnip",
    },
}

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

M.config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    vim.opt.completeopt = { "menu", "menuone", "noselect" }

    cmp.setup({
        snippet = {
            expand = function(args)
                require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
            end,
        },
        window = {
            -- completion = cmp.config.window.bordered(),
            -- documentation = cmp.config.window.bordered(),
        },
      mapping = {
        -- ... Your other mappings ...
        ["<Tab>"] = cmp.mapping(function(fallback)
          if luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          -- elseif vim.fn.pumvisible() == 1 then
          --   feedkey("<C-n>")
          elseif cmp.visible() then
            cmp.select_next_item()
          elseif has_words_before() then
            -- cmp.complete()
            cmp.mapping.complete()
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<CR>"] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
        },

        -- ["<S-Tab>"] = cmp.mapping(function(fallback)
        ["<Up>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),

        -- testing this here
        ["<Down>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.jumpable(1) then
            luasnip.jump(1)
          else
            fallback()
          end
        end, { "i", "s" }),

        -- ... Your other mappings ...
      },
        -- mapping = cmp.mapping.preset.insert({
        --     ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        --     ["<C-f>"] = cmp.mapping.scroll_docs(4),
        --     ["<C-Space>"] = cmp.mapping.complete(),
        --     ["<C-e>"] = cmp.mapping.abort(),
        --     ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        -- }),
        -- sources = cmp.config.sources({
        --     { name = "nvim_lsp" },
        --     { name = "nvim_lua" },
        --     { name = "luasnip" }, -- For luasnip users.
        --     -- { name = "orgmode" },
        -- }, {
        --     { name = "buffer" },
        --     { name = "path" },
        -- }),
      sources = {
        { name = "copilot" },
        { name = "luasnip" },
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
      },
    })

    cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
            { name = "path" },
        }, {
            { name = "cmdline" },
        }),
    })
end

return M
