return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    config = function()
      require("render-markdown").setup {
        file_types = { "markdown", "vimwiki" },
        heading = {
          width = "block",
          min_width = vim.api.nvim_get_option_value("textwidth", {}),
        },
      }
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "markdown", "vimwiki" },
        callback = function(args)
          vim.treesitter.start(args.buf)
        end,
      })
    end,
  },
}
