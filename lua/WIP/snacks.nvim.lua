return {{
    "folke/snacks.nvim",
    priority = 1000,
    event = "VeryLazy",
    ---@type snacks.Config
    keys = {{
        "<leader>bd",
        function()
            Snacks.bufdelete()
        end,
        desc = "Buffer delete",
        mode = "n"
    }, {
        "<leader>ba",
        function()
            Snacks.bufdelete.all()
        end,
        desc = "Buffer delete all",
        mode = "n"
    }, {
        "<leader>bo",
        function()
            Snacks.bufdelete.other()
        end,
        desc = "Buffer delete other",
        mode = "n"
    }, {
        "<leader>gg",
        function()
            Snacks.lazygit()
        end,
        desc = "Toggle LazyGit",
        mode = "n"
    }},
    opts = {
        bigfile = {
            enabled = true
        },
        dashboard = {
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
        }
    },
    config = function()
        vim.keymap.set("n", "<leader>gg", function()
            Snacks.lazygit()
        end, {
            desc = "Toggle LazyGit"
        })
    end
}}
