return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup {
        view = {
          width = 30,
          side = "left",
        },
      }
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup {
        options = {
          icons_enabled = true,
          section_separators = {
            left = "",
            right = "",
          },
          component_separators = {
            left = "",
            right = "",
          },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch" },
          lualine_c = { "filename" },
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
        extensions = {
          "lazy",
          "fzf",
          "mason",
          "nvim-tree",
          "fugitive",
        },
      }
    end,
  },
  {
    "nvim-lua/plenary.nvim",
  },
}
