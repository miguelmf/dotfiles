return {
    --  ╭──────────────────────────────────────────────────────────╮
    --  │                           LSP                            │
    --  ╰──────────────────────────────────────────────────────────╯
    {
        'neovim/nvim-lspconfig',
        event = { 'BufReadPost', 'BufNewFile' },
        config = function()
            require('plugins.lspconf.lsp-config')
        end,
    },
    {
        'williamboman/mason.nvim',
        event = 'BufReadPre',
        build = ':MasonUpdate',
        dependencies = {
            'williamboman/mason-lspconfig.nvim',
        },
    },
    {
        'folke/neodev.nvim',
        event = 'VeryLazy',
        opts = {},
    },
    -- {
    --     'SmiteshP/nvim-navic',
    --     enabled = false,
    --     event = 'BufReadPre',
    --     dependencies = {
    --         'neovim/nvim-lspconfig',
    --     },
    --     opts = {
    --         highlight = true,
    --     },
    -- },
    -- {
    --     'folke/trouble.nvim',
    --     keys = {
    --         { '<leader>xx', '<cmd>TroubleToggle<cr>', desc = 'Trouble Toggle' },
    --         { 'gr', '<cmd>TroubleToggle lsp_references<cr>' },
    --     },
    --     dependencies = 'nvim-tree/nvim-web-devicons',
    --     config = function()
    --         require('trouble').setup()
    --     end,
    -- },
    {
        'dnlhc/glance.nvim',
        keys = {
            { '<space>gr', '<cmd>Glance references<cr>', desc = 'Glance references' },
            { '<space>gd', '<cmd>Glance definitions<cr>', desc = 'Glance definitions' },
            { '<space>gy', '<cmd>Glance type_definitions<cr>', desc = 'Glance type_definitions' },
            { '<space>gm', '<cmd>Glance implementations<cr>', desc = 'Glance implementations' },
        },
        config = function()
            require('glance').setup()
        end,
    },

    --  ╭──────────────────────────────────────────────────────────╮
    --  │                           CMP                            │
    --  ╰──────────────────────────────────────────────────────────╯
    -- {
    --     'hrsh7th/nvim-cmp',
    --     event = 'InsertEnter',
    --     dependencies = {
    --         'hrsh7th/cmp-cmdline',
    --         'hrsh7th/cmp-nvim-lsp',
    --         'hrsh7th/cmp-buffer',
    --         'saadparwaiz1/cmp_luasnip',
    --         'ray-x/cmp-treesitter',
    --         'hrsh7th/cmp-nvim-lsp-signature-help',
    --         'hrsh7th/cmp-nvim-lua',
    --         'f3fora/cmp-spell',
    --         'hrsh7th/cmp-path',
    --     },
    --     config = function()
    --         require('plugins.lspconf.cmp')
    --     end,
    -- },

    --  ╭──────────────────────────────────────────────────────────╮
    --  │                  LINTING AND FORMATING                   │
    --  ╰──────────────────────────────────────────────────────────╯
    {
        'jose-elias-alvarez/null-ls.nvim',
        config = function()
            require('plugins.lspconf.null-ls')
        end,
    },

    --  ╭──────────────────────────────────────────────────────────╮
    --  │                         COMMENTS                         │
    --  ╰──────────────────────────────────────────────────────────╯
    -- {
    --     'numToStr/Comment.nvim',
    --     keys = {
    --         { 'gc', mode = 'v' },
    --         { 'gb', mode = 'v' },
    --         { 'gcc' },
    --         { 'gbc' },
    --         { 'gco' },
    --         { 'gcO' },
    --         { 'gcA' },
    --     },
    --     config = true,
    -- },
    -- {
    --     'LudoPinelli/comment-box.nvim',
    --     cmd = { 'CBcatalog', 'CBcbox' },
    --     keys = {
    --         { '<leader>cb', '<cmd>CBcbox<cr>', desc = 'Comment Box' },
    --         { '<leader>cc', '<cmd>CBcatalog<cr>', desc = 'Comment Box Catalog' },
    --     },
    -- },
    -- {
    --     's1n7ax/nvim-comment-frame',
    --     keys = {
    --         { '<leader>cf', desc = 'Single Comment Frame' },
    --         { '<leader>cm', desc = 'Multi Comment Frame' },
    --     },
    --     dependencies = 'nvim-treesitter',
    --     config = function()
    --         require('nvim-comment-frame').setup()
    --     end,
    -- },

    --  ╭──────────────────────────────────────────────────────────╮
    --  │                          UTILS                           │
    --  ╰──────────────────────────────────────────────────────────╯
    -- {
    --     'sudormrfbin/cheatsheet.nvim',
    --     keys = {
    --         { '<space>cs', '<cmd>Cheatsheet<cr>', desc = 'Cheatsheet' },
    --         { '<space>ce', '<cmd>CheatsheetEdit<cr>', desc = 'Cheatsheet Edit' },
    --     },
    --     dependencies = {
    --         { 'nvim-telescope/telescope.nvim' },
    --         { 'nvim-lua/popup.nvim' },
    --         { 'nvim-lua/plenary.nvim' },
    --     },
    --     opts = {
    --         bundled_plugin_cheatsheets = {
    --             disabled = { 'gitsigns.nvim' },
    --         },
    --     },
    -- },
    -- {
    --     'smjonas/live-command.nvim',
    --     event = 'CmdlineEnter',
    --     config = function()
    --         require('live-command').setup({
    --             commands = {
    --                 Norm = { cmd = 'norm' },
    --             },
    --         })
    --     end,
    -- },
    -- {
    --     'nguyenvukhang/nvim-toggler',
    --     keys = {
    --         { '<leader>w', desc = 'Toggle Word' },
    --     },
    --     config = function()
    --         require('nvim-toggler').setup({
    --             remove_default_keybinds = true,
    --         })
    --         vim.keymap.set({ 'n', 'v' }, '<leader>w', require('nvim-toggler').toggle, { desc = 'Toggle a Word' })
    --     end,
    -- },
    -- {
    --     'mg979/vim-visual-multi',
    --     event = 'BufReadPost',
    -- },
    -- {
    --     'smoka7/multicursors.nvim',
    --     enabled = true,
    --     dependencies = {
    --         'nvim-treesitter/nvim-treesitter',
    --         'smoka7/hydra.nvim',
    --     },
    --     cmd = { 'MCstart', 'MCvisual', 'MCclear', 'MCpattern', 'MCvisualPattern', 'MCunderCursor' },
    --     keys = {
    --         {
    --             mode = { 'v', 'n' },
    --             '<Leader>m',
    --             '<cmd>MCstart<cr>',
    --             desc = 'Create Multicursor',
    --         },
    --     },
    --     opts = function()
    --         local N = require('multicursors.normal_mode')
    --         local I = require('multicursors.insert_mode')
    --         return {
    --             normal_keys = {
    --                 -- to change default lhs of key mapping change the key
    --                 [','] = {
    --                     -- assigning nil to method exits from multi cursor mode
    --                     method = N.clear_others,
    --                     -- description to show in hint window
    --                     desc = 'Clear others',
    --                 },
    --             },
    --             insert_keys = {
    --                 -- to change default lhs of key mapping change the key
    --                 ['<CR>'] = {
    --                     -- assigning nil to method exits from multi cursor mode
    --                     method = I.Cr_method,
    --                     -- description to show in hint window
    --                     desc = 'New line',
    --                 },
    --             },
    --         }
    --     end,
    --     config = function()
    --         require('multicursors').setup({
    --             hint_config = {
    --                 border = 'rounded',
    --                 position = 'top',
    --             },
    --         })
    --     end,
    --     -- init = function()
    --     --     local colors = require('catppuccin.palettes').get_palette('mocha')
    --     --     vim.api.nvim_set_hl(0, 'MultiCursor', { fg = colors.maroon, bg = colors.crust })
    --     --     vim.api.nvim_set_hl(0, 'MultiCursorMain', { fg = colors.crust, bg = colors.maroon, bold = true })
    --     --     vim.api.nvim_set_hl(0, 'MultiCursor', { fg = '#11111b', bg = '#74c7ec' })
    --     --     vim.api.nvim_set_hl(0, 'MultiCursorMain', { fg = '#11111b', bg = '#eba0ac', bold = true })
    --     --     vim.cmd([[ hi MultiCursor guibg=#74c7ec guifg=#11111b ]])
    --     --     vim.cmd([[ hi MultiCursorMain guibg=#eba0ac guifg=#11111b ]])
    --     -- end,
    -- },
    -- {
    --     'famiu/bufdelete.nvim',
    --     enabled = false,
    --     cmd = 'Bdelete',
    --     keys = {
    --         { '<space>bd', '<cmd>Bdelete<cr>', desc = 'Delete Buffer' },
    --     },
    -- },
    -- {
    --     'utilyre/sentiment.nvim',
    --     enabled = false,
    --     event = 'BufReadPre',
    --     version = '*',
    --     opts = {
    --         included_modes = {
    --             i = false,
    --         },
    --     },
    --     init = function()
    --         vim.g.loaded_matchparen = 1
    --     end,
    -- },
    -- {
    --     'chrisgrieser/nvim-spider',
    --     event = 'BufReadPost',
    --     config = function()
    --         -- Keymaps
    --         vim.keymap.set({ 'n', 'o', 'x' }, 'w', function()
    --             require('spider').motion('w')
    --         end, { desc = 'Spider-w' })
    --         vim.keymap.set({ 'n', 'o', 'x' }, 'e', function()
    --             require('spider').motion('e')
    --         end, { desc = 'Spider-e' })
    --         vim.keymap.set({ 'n', 'o', 'x' }, 'b', function()
    --             require('spider').motion('b')
    --         end, { desc = 'Spider-b' })
    --         vim.keymap.set({ 'n', 'o', 'x' }, 'ge', function()
    --             require('spider').motion('ge')
    --         end, { desc = 'Spider-ge' })
    --     end,
    -- },
    -- {
    --     'luukvbaal/statuscol.nvim',
    --     event = 'BufReadPre',
    --     config = function()
    --         local builtin = require('statuscol.builtin')
    --         require('statuscol').setup({
    --             relculright = true,
    --             segments = {
    --                 { sign = { name = { '.*' }, maxwidth = 1, colwidth = 1, auto = false }, click = 'v:lua.ScSa' },
    --                 { sign = { name = { 'Diagnostic' }, maxwidth = 1, auto = false }, click = 'v:lua.ScSa' },
    --                 { text = { builtin.lnumfunc, '  ' }, click = 'v:lua.ScLa' },
    --                 { text = { builtin.foldfunc, ' ' }, click = 'v:lua.ScFa' },
    --             },
    --         })
    --     end,
    -- },
    -- {
    --     'simrat39/symbols-outline.nvim',
    --     cmd = 'SymbolsOutline',
    --     config = function()
    --         require('symbols-outline').setup()
    --     end,
    -- },
    -- {
    --     'norcalli/nvim-colorizer.lua',
    --     event = 'BufReadPre',
    --     config = function()
    --         require('colorizer').setup()
    --     end,
    -- },
    -- {
    --     'gbprod/yanky.nvim',
    --     enabled = true,
    --     keys = {
    --         { '<leader>p', '<cmd>Telescope yank_history<cr>', desc = 'Paste from yanky' },
    --         { 'y', '<Plug>(YankyYank)', mode = { 'n', 'x' } },
    --         { 'p', '<Plug>(YankyPutAfter)', mode = { 'n', 'x' } },
    --         { 'P', '<Plug>(YankyPutBefore)', mode = { 'n', 'x' } },
    --         { 'gp', '<Plug>(YankyGPutAfter)', mode = { 'n', 'x' } },
    --         { 'gP', '<Plug>(YankyGPutBefore)', mode = { 'n', 'x' } },
    --         { '<right>y', '<Plug>(YankyCycleForward)' },
    --         { '<left>y', '<Plug>(YankyCycleBackward)' },
    --         { '<right>p', '<Plug>(YankyPutIndentAfterLinewise)' },
    --         { '<left>p', '<Plug>(YankyPutIndentBeforeLinewise)' },
    --         { '<right>P', '<Plug>(YankyPutIndentAfterLinewise)' },
    --         { '<left>P', '<Plug>(YankyPutIndentBeforeLinewise)' },
    --         { '>p', '<Plug>(YankyPutIndentAfterShiftRight)' },
    --         { '<p', '<Plug>(YankyPutIndentAfterShiftLeft)' },
    --         { '>P', '<Plug>(YankyPutIndentBeforeShiftRight)' },
    --         { '<P', '<Plug>(YankyPutIndentBeforeShiftLeft)' },
    --         { '=p', '<Plug>(YankyPutAfterFilter)' },
    --         { '=P', '<Plug>(YankyPutBeforeFilter)' },
    --     },
    --     opts = {
    --         highlight = {
    --             on_put = true,
    --             on_yank = true,
    --             timer = 100,
    --         },
    --     },
    -- },
    -- {
    --     'chrisgrieser/nvim-alt-substitute',
    --     enabled = false,
    --     opts = true,
    --     -- lazy-loading with `cmd =` does not work well with incremental preview
    --     event = 'CmdlineEnter',
    -- },
    -- {
    --     'jokajak/keyseer.nvim',
    --     enabled = true,
    --     version = false,
    --     cmd = 'KeySeer',
    --     opts = {
    --         ui = {
    --             winblend = 100,
    --             border = 'rounded',
    --         },
    --         keyboard = {
    --             layout = 'qwertz',
    --         },
    --     },
    -- },

    --  ╭──────────────────────────────────────────────────────────╮
    --  │                         WRITING                          │
    --  ╰──────────────────────────────────────────────────────────╯
    {
        'lervag/vimtex',
        ft = 'tex',
        config = function()
            vim.g.vimtex_view_method = 'skim'
            vim.g.vimtex_compiler_engine = 'lualatex'
            vim.g.maplocalleader = ','
        end,
    },

    --  ╭──────────────────────────────────────────────────────────╮
    --  │                          MOTION                          │
    --  ╰──────────────────────────────────────────────────────────╯
    -- {
    --     'phaazon/hop.nvim',
    --     keys = {
    --         { '<leader>a', '<cmd>HopWord<cr>', desc = 'Hop Word' },
    --         { '<leader>hh', '<cmd>HopAnywhere<cr>', desc = 'Hop Anywhere' },
    --     },
    --     branch = 'v2',
    --     config = function()
    --         require('hop').setup()
    --     end,
    -- },
    -- {
    --     'rlane/pounce.nvim',
    --     enabled = false,
    --     keys = {
    --         { 'S', '<cmd>Pounce<CR>', mode = { 'n', 'v' } },
    --     },
    -- },
    -- {
    --     'declancm/cinnamon.nvim',
    --     keys = {
    --         { '<C-f>' },
    --         { '<C-b>' },
    --         { '<C-d>' },
    --         { '<C-u>' },
    --         { 'zz' },
    --         { 'zt' },
    --         { 'zb' },
    --     },
    --     config = function()
    --         -- vim.keymap.set({ 'n', 'x' }, '0', "<Cmd>lua Scroll('0')<CR>")
    --         -- vim.keymap.set({ 'n', 'x' }, '^', "<Cmd>lua Scroll('^')<CR>")
    --         -- vim.keymap.set({ 'n', 'x' }, '$', "<Cmd>lua Scroll('$', 0, 1)<CR>")
    --         vim.keymap.set('n', 'zz', "<Cmd>lua Scroll('zz', 0, 1)<CR>")
    --         vim.keymap.set('n', 'zt', "<Cmd>lua Scroll('zt', 0, 1)<CR>")
    --         vim.keymap.set('n', 'zb', "<Cmd>lua Scroll('zb', 0, 1)<CR>")
    --         require('cinnamon').setup({
    --             always_scroll = true,
    --             scroll_limit = 200,
    --         })
    --     end,
    -- },

    --  ╭──────────────────────────────────────────────────────────╮
    --  │                          DEBUG                           │
    --  ╰──────────────────────────────────────────────────────────╯
    -- {
    --     'rcarriga/nvim-dap-ui',
    --     keys = {
    --         { '<leader>du', '<cmd>lua require("dapui").toggle()<CR>', desc = 'DAP UI Toggle' },
    --     },
    --     dependencies = 'mfussenegger/nvim-dap',
    --     config = function()
    --         require('dapui').setup()
    --     end,
    -- },
    -- {
    --     'theHamsta/nvim-dap-virtual-text',
    --     keys = {
    --         { '<leader>db', '<cmd>DapToggleBreakpoint<cr>', desc = 'Add Breakpoint' },
    --     },
    --     config = function()
    --         require('nvim-dap-virtual-text').setup()
    --     end,
    -- },

    --  ╭──────────────────────────────────────────────────────────╮
    --  │                           JAVA                           │
    --  ╰──────────────────────────────────────────────────────────╯
    -- {
    --     'mfussenegger/nvim-jdtls',
    --     keys = {
    --         { '<leader>db', '<cmd>DapToggleBreakpoint<cr>', desc = 'Add Breakpoint' },
    --     },
    -- },

    --  ╭──────────────────────────────────────────────────────────╮
    --  │                        REST-HTML                         │
    --  ╰──────────────────────────────────────────────────────────╯
    -- {
    --     'diepm/vim-rest-console',
    --     enabled = false,
    --     ft = 'rest',
    -- },
}
