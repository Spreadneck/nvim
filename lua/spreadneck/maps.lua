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

-- File explorer via mini.files
map("n", "<leader>e", function()
  require("mini.files").open()
end, { desc = "Open mini.files" })
map("n", "<leader>r", function()
  require("mini.files").open(vim.loop.cwd())
end, { desc = "Open mini.files at CWD" })

-- Spelling
vim.keymap.set("n", "<leader>ss", "z=", { desc = "Spelling suggestions" })

-- Buffer navigation
map("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<leader>bp", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
map("n", "<leader>bd", function()
  require("mini.bufremove").delete(0, false)
end, { desc = "Delete buffer" })

for i = 1, 9 do
  map("n", "<leader>b" .. i, function()
    vim.cmd.buffer(i)
  end, { desc = "Go to buffer " .. i })
end
