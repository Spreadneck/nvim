return {
  {
    "kylechui/nvim-surround",
    version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
    event = "InsertEnter",
    keys = {
      { "cs", mode = "n" },
      { "ds", mode = "n" },
      { "ys", mode = "n" },
      { "S", mode = "v" },
      { "gS", mode = "v" },
    },
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
}
