return {
    'L3MON4D3/LuaSnip',
    event = 'VeryLazy',
    dependencies = {
        'rafamadriz/friendly-snippets',
    },
    build = 'make install_jsregexp',
    config = function()
        local ls = require('luasnip')
        ls.config.set_config({
            region_check_events = 'InsertEnter',
            delete_check_events = 'TextChanged,InsertLeave',
        })

        require('luasnip.loaders.from_vscode').lazy_load()
    end,
}
-- https://github.com/ilias777/nvim/blob/main/lua/plugins/luasnip.lua
