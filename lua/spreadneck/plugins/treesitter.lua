return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "markdown",
        "markdown_inline",
        "html",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "javascript",
        "typescript",
        "python",
        "bash",
        "json",
        "yaml",
        "latex",
      },
      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = { enable = true },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
      vim.treesitter.language.register("markdown", "vimwiki")
    end,
    dependencies = {
      { "tree-sitter-grammars/tree-sitter-markdown" },
      { "latex-lsp/tree-sitter-latex" },
    },
  },
}
