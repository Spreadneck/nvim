return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = vim.fn.executable("make") == 1,
      },
      {
        "olacin/telescope-cc.nvim",
      },
      {
        "nvim-telescope/telescope-project.nvim",
      },
      {
        "nvim-telescope/telescope-file-browser.nvim".
      },
    },
    cmd = "Telescope",
    config = function()
      require("telescope").setup({
        -- your config here, no changes needed for spell_suggest!
      })
      -- Load Telescope extensions
      pcall(require("telescope").load_extension, "fzf")
      pcall(require("telescope").load_extension, "cc")
      pcall(require("telescope").load_extension, "project")
    end,
  }
}
