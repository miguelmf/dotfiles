return {
    'aurum77/live-server.nvim',
    -- run = function()
    --     require('live_server.util').install()
    -- end,
    -- cmd = { 'LiveServer', 'LiveServerStart', 'LiveServerStop' },

    config = function()
        local status_ok, live_server = pcall(require, 'live_server')
        if not status_ok then
            return
        end

        live_server.setup({
            port = 7567,
            browser_command = 'firefox-developer-edition', -- Command or executable path
            quiet = false,
            no_css_inject = true,
            install_path = os.getenv('HOME') .. '/live/',
        })
    end,
}
