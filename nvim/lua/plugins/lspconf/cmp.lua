require('luasnip/loaders/from_lua').load({ paths = '~/.config/nvim/snippets/' })
require('luasnip/loaders/from_vscode').lazy_load()

vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

-- Kind icons
local kind_icons = {
    Class = ' ',
    Color = ' ',
    Constant = ' ',
    Constructor = ' ',
    Enum = '了 ',
    EnumMember = ' ',
    Event = '',
    Field = ' ',
    File = ' ',
    Folder = ' ',
    Function = 'ƒ ',
    Interface = 'ﰮ ',
    Keyword = ' ',
    Method = ' ',
    Module = ' ',
    Operator = ' ',
    Property = ' ',
    Reference = ' ',
    Snippet = '﬌ ',
    Struct = ' ',
    Text = ' ',
    Unit = ' ',
    Value = ' ',
    Variable = '𝝰 ',
    -- old
    -- Function = ' ',
    -- Method = 'ƒ ',
    -- Variable = ' ',
}

-- For luasnips integration
local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

local luasnip = require('luasnip')

-- Setup nvim-cmp
local cmp = require('cmp')

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        completion = {
            border = { '┌', '─', '┐', '│', '┘', '─', '└', '│' },
            -- side_padding = 1,
            winhighlight = 'Normal:CmpPmenu,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None',
        },
        -- completion = {
        --     winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,Search:None',
        --     col_offset = -3,
        --     side_padding = 0,
        -- },
        -- documentation = cmp.config.window.bordered(),
        documentation = {
            border = { '┌', '─', '┐', '│', '┘', '─', '└', '│' },
            winhighlight = 'Normal:CmpPmenu,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None',
        },
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
        ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer', max_view_entries = 10 },
        { name = 'nvim_lua', max_view_entries = 10 },
        { name = 'path' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'treesitter', max_view_entries = 10 },
        -- { name = 'spell', option = {
        --     keep_all_entries = false,
        --     enable_in_context = function()
        --         return true
        --     end,
        --     max_item_count = 10,
        -- } },
    }),
    formatting = {
        fields = { 'abbr', 'kind', 'menu' },
        format = function(entry, vim_item)
            -- Kind icons
            -- This concatonates the icons with the name of the item kind
            vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
            -- vim_item.icons = string.format('%s', kind_icons[vim_item.kind])
            -- vim.item.kind = string.format('%s', kind_icons.kind)
            -- Source
            vim_item.menu = ({
                luasnip = '( LuaSnip )',
                buffer = '( Buffer )',
                nvim_lsp = '( LSP )',
                path = '( Path )',
                nvim_lsp_signature_help = '( Sign.Help )',
                nvim_lua = '( Lua )',
                treesitter = '( Treesitter )',
                -- spell = '( Spell )',
            })[entry.source.name]
            return vim_item
        end,
    },
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' },
    },
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' },
    }, {
        { name = 'cmdline' },
    }),
})

-- Autopairs
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local ts_utils = require('nvim-treesitter.ts_utils')

local ts_node_func_parens_disabled = {
    -- ecma
    named_imports = true,
    -- rust
    use_declaration = true,
}

local default_handler = cmp_autopairs.filetypes['*']['('].handler
cmp_autopairs.filetypes['*']['('].handler = function(char, item, bufnr, rules, commit_character)
    local node_type = ts_utils.get_node_at_cursor():type()
    if ts_node_func_parens_disabled[node_type] then
        if item.data then
            item.data.funcParensDisabled = true
        else
            char = ''
        end
    end
    default_handler(char, item, bufnr, rules, commit_character)
end

cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done({
        sh = false,
    })
)