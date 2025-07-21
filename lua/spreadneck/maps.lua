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
