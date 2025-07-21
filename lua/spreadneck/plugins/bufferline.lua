return {{
    "echasnovski/mini.nvim",
    version = false,
    config = function()
        require("mini.tabline").setup{}
        require("mini.bufremove").setup{}
    end,
}}
