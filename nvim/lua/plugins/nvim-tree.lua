return {
    'nvim-tree/nvim-tree.lua',
    -- cmd = 'NvimTreeToggle',
    -- keys = {
    --     { '<Space>e', '<cmd>NvimTreeToggle<cr>', desc = 'File Browser' },
    -- },
    dependencies = 'nvim-tree/nvim-web-devicons',
    version = 'nightly',
    config = function()
        -- disable netrw at the very start of your init.lua (strongly advised)
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        -- set termguicolors to enable highlight groups
        vim.opt.termguicolors = true

        -- empty setup using defaults
        -- require('nvim-tree').setup()

        -- OR setup with some options
        require('nvim-tree').setup({
            sort_by = 'case_sensitive',
            view = {
                width = 20,
            },
            renderer = {
                group_empty = true,
            },
            filters = {
                dotfiles = true,
            },
        })

        -- Close nvim-tree if last buffer in tab is closed
        local function tab_win_closed(winnr)
            local api = require('nvim-tree.api')
            local tabnr = vim.api.nvim_win_get_tabpage(winnr)
            local bufnr = vim.api.nvim_win_get_buf(winnr)
            local buf_info = vim.fn.getbufinfo(bufnr)[1]
            local tab_wins = vim.tbl_filter(function(w)
                return w ~= winnr
            end, vim.api.nvim_tabpage_list_wins(tabnr))
            local tab_bufs = vim.tbl_map(vim.api.nvim_win_get_buf, tab_wins)
            if buf_info.name:match('.*NvimTree_%d*$') then -- close buffer was nvim tree
                -- Close all nvim tree on :q
                if not vim.tbl_isempty(tab_bufs) then -- and was not the last window (not closed automatically by code below)
                    api.tree.close()
                end
            else -- else closed buffer was normal buffer
                if #tab_bufs == 1 then -- if there is only 1 buffer left in the tab
                    local last_buf_info = vim.fn.getbufinfo(tab_bufs[1])[1]
                    if last_buf_info.name:match('.*NvimTree_%d*$') then -- and that buffer is nvim tree
                        vim.schedule(function()
                            if #vim.api.nvim_list_wins() == 1 then -- if its the last buffer in vim
                                vim.cmd('quit') -- then close all of vim
                            else -- else there are more tabs open
                                vim.api.nvim_win_close(tab_wins[1], true) -- then close only the tab
                            end
                        end)
                    end
                end
            end
        end

        vim.api.nvim_create_autocmd('WinClosed', {
            callback = function()
                local winnr = tonumber(vim.fn.expand('<amatch>'))
                vim.schedule_wrap(tab_win_closed(winnr))
            end,
            nested = true,
        })

        -- open in all tabs
        local nt_api = require('nvim-tree.api')
        local tree_open = false
        local function tab_enter()
            if tree_open then
                nt_api.tree.open()
                vim.api.nvim_command('wincmd p')
            else
                nt_api.tree.close()
            end
        end
        nt_api.events.subscribe(nt_api.events.Event.TreeOpen, function()
            tree_open = true
        end)
        nt_api.events.subscribe(nt_api.events.Event.TreeClose, function()
            tree_open = false
        end)
        vim.api.nvim_create_autocmd('TabEnter,TabNewEnter', { callback = tab_enter })
        ---
    end,
}
