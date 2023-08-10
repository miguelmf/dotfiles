-- Enable Mouse
vim.o.mouse = 'a'

-- Set Editor Font
-- if vim.fn.exists(':GuiFont') then
--     -- Use GuiFont! to ignore font errors
--     vim.cmd("GuiFont! JetBrains Mono:h16")
--     --vim.cmd("GuiFont! JetBrains Mono Light:h15")
--     --vim.cmd("GuiFont! Iosevka:h14.5")
-- end

if vim.g.neovide then
    -- set guifont=Jetbrains\\ Mono:h14
    -- set guifont=Cascadia\\ Code\\ SemiLight:h16
    -- vim.cmd("set guifont=Cascadia\\ Code\\ Light:h16")
    vim.o.guifont = "Cascadia Code Light:h16"
    -- vim.g.neovide_cursor_vfx_mode = ""
    -- vim.g.neovide_cursor_animation_length = 0
    -- vim.g.neovide_scroll_animation_length = 0
end

vim.g.neovide_cursor_vfx_mode = ""
vim.g.neovide_cursor_animation_length = 0
vim.g.neovide_scroll_animation_length = 0

-- vim.cmd("GuiPopupmenu 0")
-- vim.cmd("GuiRenderLigatures 1")
-- vim.cmd("GuiTreeviewToggle 1")
-- vim.cmd("GuiTreeviewShow")