return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    event = "VeryLazy",
    ---@type snacks.Config
    opts = {
      bigfile = { enabled = true },
      dashboard = { enabled = true },
      explorer = { enabled = false },
      indent = { enabled = true },
      input = { enabled = true },
      picker = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
      lazygit = { enabled = true },
    },
    config = function()
      vim.keymap.set("n", "<leader>gg", function()
        Snacks.lazygit()
      end, { desc = "Toggle LazyGit" })
    end,
  },
}
