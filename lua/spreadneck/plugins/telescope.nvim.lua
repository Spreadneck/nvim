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
      { "olacin/telescope-cc.nvim" },
      {
        "nvim-telescope/telescope-project.nvim",
        config = function()
          require("telescope").load_extension("project")
          require("telescope._extensions.project").setup({
            hide_workspace = true,
          })
        end,
      },
      { "nvim-telescope/telescope-file-browser.nvim" },
    },
    cmd = "Telescope",
    config = function()
      require("telescope").setup({
        -- your telescope config here
        extensions = {
          conventional_commits = {
            theme = "ivy",
            action = function(entry)
              vim.print(entry)
            end,
            include_body_and_footer = true,
          },
        },
      })
      -- Load Telescope extensions
      local function safe_load_extension(ext)
        local ok, err = pcall(require("telescope").load_extension, ext)
        if not ok then
          vim.notify("Telescope extension '" .. ext .. "' failed to load: " .. tostring(err), vim.log.levels.ERROR)
        end
      end

      safe_load_extension("fzf")
      safe_load_extension("conventional_commits")
      safe_load_extension("project")
      safe_load_extension("file_browser")
    end,
  },
}
