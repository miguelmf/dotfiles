return {
    "SmiteshP/nvim-navbuddy",
    dependencies = {
        "neovim/nvim-lspconfig",
        "SmiteshP/nvim-navic",
        "MunifTanjim/nui.nvim",
    },
    config = function()
            local navbuddy = require("nvim-navbuddy")

            require("lspconfig").clangd.setup {
                on_attach = function(client, bufnr)
                    navbuddy.attach(client, bufnr)
                end
            }

            local actions = require("nvim-navbuddy.actions")

            navbuddy.setup {
                window = {
                    border = "single",  -- "rounded", "double", "solid", "none"
                                        -- or an array with eight chars building up the border in a clockwise fashion
                                        -- starting with the top-left corner. eg: { "╔", "═" ,"╗", "║", "╝", "═", "╚", "║" }.
                    size = "60%",       -- Or table format example: { height = "40%", width = "100%"}
                    position = "50%",   -- Or table format example: { row = "100%", col = "0%"}
                    scrolloff = nil,    -- scrolloff value within navbuddy window
                    sections = {
                        left = {
                            size = "20%",
                            border = nil, -- You can set border style for each section individually as well.
                        },
                        mid = {
                            size = "40%",
                            border = nil,
                        },
                        right = {
                            -- No size option for right most section. It fills to
                            -- remaining area.
                            border = nil,
                            preview = "leaf",  -- Right section can show previews too.
                                               -- Options: "leaf", "always" or "never"
                        }
                    },
                },
                node_markers = {
                    enabled = true,
                    icons = {
                        leaf = "  ",
                        leaf_selected = " → ",
                        branch = " ",
                    },
                },
                icons = {
                    File          = "󰈙 ",
                    Module        = " ",
                    Namespace     = "󰌗 ",
                    Package       = " ",
                    Class         = "󰌗 ",
                    Method        = "󰆧 ",
                    Property      = " ",
                    Field         = " ",
                    Constructor   = " ",
                    Enum          = "󰕘",
                    Interface     = "󰕘",
                    Function      = "󰊕 ",
                    Variable      = "󰆧 ",
                    Constant      = "󰏿 ",
                    String        = " ",
                    Number        = "󰎠 ",
                    Boolean       = "◩ ",
                    Array         = "󰅪 ",
                    Object        = "󰅩 ",
                    Key           = "󰌋 ",
                    Null          = "󰟢 ",
                    EnumMember    = " ",
                    Struct        = "󰌗 ",
                    Event         = " ",
                    Operator      = "󰆕 ",
                    TypeParameter = "󰊄 ",
                },
                use_default_mappings = false,            -- If set to false, only mappings set
                                                        -- by user are set. Else default
                                                        -- mappings are used for keys
                                                        -- that are not set by user
                mappings = {
                    ["<esc>"] = actions.close(),        -- Close and cursor to original location
                    ["q"] = actions.close(),
                    ["<Left>"] = actions.parent(),           -- Move to left panel
                    ["<Right>"] = actions.children(),         -- Move to right panel
                    ["0"] = actions.root(),             -- Move to first panel

                },
                lsp = {
                    auto_attach = true,   -- If set to true, you don't need to manually use attach function
                    preference = nil,      -- list of lsp server names in order of preference
                },
                source_buffer = {
                    follow_node = true,    -- Keep the current node in focus on the source buffer
                    highlight = true,      -- Highlight the currently focused node
                    reorient = "smart",    -- "smart", "top", "mid" or "none"
                    scrolloff = nil        -- scrolloff value when navbuddy is open
                }
            }
    end,
}