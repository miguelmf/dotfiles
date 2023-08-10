return {
    'nvim-telescope/telescope.nvim',
    keys = {
        -- { '<leader>fb', '<cmd>Telescope buffers<cr>', desc = 'Find Buffers' },
        -- { '<leader>fd', '<cmd>Telescope diagnostics<cr>', desc = 'Find Diagnostics' },
        -- { '<C-p>', '<cmd>Telescope file_browser<cr>', desc = 'File Browser' },
        { '<C-p>', '<cmd>Telescope find_files<cr>', desc = 'Find Files' },
        { '<C-f>', '<cmd>Telescope live_grep<cr>', desc = 'Find Word' },
        -- { '<leader>fh', '<cmd>Telescope help_tags<cr>', desc = 'Find Help' },
        -- { '<leader>fk', '<cmd>Telescope keymaps<cr>', desc = 'Find Keymaps' },
        -- { '<leader>fl', '<cmd>Telescope highlights<cr>', desc = 'Find Highlights' },
        -- { '<leader>fu', '<cmd>Telescope undo<cr>', desc = 'Find Undo' },
        -- { '<leader>ft', '<cmd>Telescope git_files<cr>', desc = 'Find Git Files' },
        -- { '<leader>fp', '<cmd>Telescope spell_suggest<cr>', desc = 'Find Spell Suggest' },
        -- { '<leader>fz', '<cmd>Telescope zoxide list<cr>', desc = 'Find Directory' },
    },
    branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-file-browser.nvim',
        'nvim-telescope/telescope-symbols.nvim',
        'xiyaowong/telescope-emoji.nvim',
        'debugloop/telescope-undo.nvim',
        'jvgrootveld/telescope-zoxide',
    },
    config = function()
        -- local trouble = require('trouble.providers.telescope')
        -- local fb_actions = require('telescope').extensions.file_browser.actions

        require('telescope').setup({
            defaults = {
                prompt_prefix = '   ',
                winblend = 0,
                -- mappings = {
                --     i = { ['<c-t>'] = trouble.open_with_trouble },
                --     n = {
                --         ['<c-t>'] = trouble.open_with_trouble,
                --         ['q'] = require('telescope.actions').close,
                --     },
                -- },
                --
                file_ignore_patterns = { 'node_modules/.*', '.*%.jpg', '.*%.png', '.*%.gif', '.*%.jpeg' },
            },
            pickers = {
                buffers = {
                    theme = 'dropdown',
                    mappings = {
                        n = { ['<C-e>'] = 'delete_buffer' },
                    },
                    initial_mode = 'normal',
                },
                find_files = {
                    -- theme = 'ivy', -- 'ivy', 'dropdown', 'cursor'
                    -- layout_strategy = 'vertical',
                    -- layout_config = { height = 0.9 },
                },
                help_tags = {
                    theme = 'ivy',
                },
                symbols = {
                    theme = 'dropdown',
                },
                registers = {
                    theme = 'ivy',
                },
            },
            extensions = {
                -- file_browser = {
                --     theme = 'ivy',
                --     initial_mode = 'normal',
                --     mappings = {
                --         ['n'] = {
                --             -- ['o'] = fb_actions.select_default,
                --         },
                --     },
                -- },
                undo = {
                    initial_mode = 'normal',
                    use_delta = true,
                    side_by_side = true,
                    layout_strategy = 'vertical',
                    layout_config = {
                        preview_height = 0.8,
                    },
                },
                -- heading = {
                --    treesitter = true,
                -- },
                -- advanced_git_search = {
                --     diff_plugin = 'diffview',
                --     git_flags = {},
                -- },
                fzf = {
                    fuzzy = true, -- false will only do exact matching
                    override_generic_sorter = true, -- override the generic sorter
                    override_file_sorter = true, -- override the file sorter
                    case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
                    -- the default case_mode is "smart_case"
                },
            },
        })

        -- Extensions
        -- require('telescope').load_extension('emoji')
        require('telescope').load_extension('file_browser')
        -- require('telescope').load_extension('undo')
        -- require('telescope').load_extension('advanced_git_search')
        -- require('telescope').load_extension('yank_history')
        -- require('telescope').load_extension('zoxide')
        -- require('telescope').load_extension('heading')
        -- require('telescope').load_extension('neoclip')
        -- require('telescope').load_extension('noice')
        require('telescope').load_extension('fzf')
    end,
}
