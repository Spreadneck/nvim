return {{
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        dashboard = {
            preset = {
                pick = nil,
                ---@type snacks.dashboard.Item[]
                keys = {{
                    icon = " ",
                    key = "f",
                    desc = "Find File",
                    action = ":lua Snacks.dashboard.pick('files')"
                }, {
                    icon = " ",
                    key = "n",
                    desc = "New File",
                    action = ":ene | startinsert"
                }, {
                    icon = " ",
                    key = "g",
                    desc = "Find Text",
                    action = ":lua Snacks.dashboard.pick('live_grep')"
                }, {
                    icon = " ",
                    key = "r",
                    desc = "Recent Files",
                    action = ":lua Snacks.dashboard.pick('oldfiles')"
                }, {
                    icon = " ",
                    key = "c",
                    desc = "Config",
                    action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})"
                }, {
                    icon = " ",
                    key = "s",
                    desc = "Restore Session",
                    section = "session"
                }, {
                    icon = "󰒲 ",
                    key = "l",
                    desc = "Lazy",
                    action = ":Lazy",
                    enabled = package.loaded.lazy ~= nil
                }, {
                    icon = " ",
                    key = "q",
                    desc = "Quit",
                    action = ":qa"
                }}
                --             header = [[
                --                                                                          
                --            ████ ██████           █████      ██                     
                --           ███████████             █████                             
                --           █████████ ███████████████████ ███   ███████████   
                --          █████████  ███    █████████████ █████ ██████████████   
                --         █████████ ██████████ █████████ █████ █████ ████ █████   
                --       ███████████ ███    ███ █████████ █████ █████ ████ █████  
                --      ██████  █████████████████████ ████ █████ █████ ████ ██████ 
                --   ]]
            },
            sections = {{
                section = 'header'
            }, {
                section = "keys",
                indent = 1,
                padding = 1
            }, {
                section = 'recent_files',
                icon = ' ',
                title = 'Recent Files',
                indent = 3,
                padding = 2
            }, {
                section = "startup"
            }}
        },
        bigfile = {
            enabled = true
        },
        notifier = {
            enabled = true
        },
        scroll = {
            enabled = true
        },
        statuscolumn = {
            enabled = true
        },
        words = {
            enabled = true
        },
        lazygit = {
            enabled = true
        },
        toggle = {
            enabled = true
        },
        quickfile = {
            enabled = true
        },
        input = {
            enabled = true
        },
        scope = {
            enabled = true
        }
    }
}, {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
    },
    keys = {{
        "<leader>?",
        function()
            require("which-key").show({
                global = false
            })
        end,
        desc = "Buffer Local Keymaps (which-key)"
    }}
}}
