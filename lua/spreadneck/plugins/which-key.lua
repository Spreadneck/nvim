return {{
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
        local wk = require("which-key")
        wk.setup{}
        local buffer_mappings = {
            name = "+buffers",
            n = {"<CMD>bnext<CR>", "Next buffer"},
            p = {"<CMD>bprevious<CR>", "Prev buffer"},
            d = {function() require("mini.bufremove").delete(0, false) end, "Delete buffer"},
        }
        for i = 1, 9 do
            buffer_mappings[tostring(i)] = {"<CMD>buffer " .. i .. "<CR>", "Go to buffer " .. i}
        end
        wk.register({ b = buffer_mappings }, {prefix = "<leader>"})
    end
}}
