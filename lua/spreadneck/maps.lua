vim.g.mapleader = " "

local function map(mode, lhs, rhs, opts)
	opts = opts or {}
	opts.silent = true
	vim.keymap.set(mode, lhs, rhs, opts)
end

-- Save
map("n", "<leader>w", "<CMD>update<CR>")

-- Quit
map("n", "<leader>q", "<CMD>q<CR>")

-- Exit insert mode
map("i", "jk", "<ESC>")

-- NeoTree
map("n", "<leader>e", "<CMD>Neotree toggle<CR>")
map("n", "<leader>r", "<CMD>Neotree focus<CR>")

-- Buffers
map("n", "<leader>bn", "<CMD>bnext<CR>")
map("n", "<leader>bp", "<CMD>bprevious<CR>")
local bufremove = function()
    require("mini.bufremove").delete(0, false)
end
map("n", "<leader>bd", bufremove)

for i = 1, 9 do
    map("n", "<leader>b" .. i, "<CMD>buffer " .. i .. "<CR>")
end
