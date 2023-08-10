return {
    'L3MON4D3/LuaSnip',
    version = '1.2.1',
    event = 'VeryLazy',
    dependencies = {
        'rafamadriz/friendly-snippets',
    },
    build = 'make install_jsregexp',
    config = function()
        local ls = require('luasnip')
        local types = require('luasnip.util.types')
        ls.config.set_config({
            history = false, --keep around last snippet local to jump back
            updateevents = 'TextChanged,TextChangedI', --update changes as you type
            enable_autosnippets = true,
            ext_opts = {
                [types.choiceNode] = {
                    active = {
                        virt_text = { { '●', 'DiagnosticHint' } },
                    },
                },
            },
        })
        require("luasnip.loaders.from_vscode").lazy_load()
    end,
}
-- https://github.com/ilias777/nvim/blob/main/lua/plugins/luasnip.lua