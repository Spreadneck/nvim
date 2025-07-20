return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    lazy = false,
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
      },
      highlight = { enable = true },
      indent = { enable = true },
    },
  },
  {
    -- Register Treesitter language for Vimwiki after plugins are loaded
    "nvim-treesitter/nvim-treesitter",
    config = function()
      vim.treesitter.language.register("markdown", "vimwiki")
    end,
  },
  {
    "tree-sitter-grammars/tree-sitter-markdown",
    run = ":TSInstall markdown",
  },
  {
    "latex-lsp/tree-sitter-latex",
    run = ":TSInstall latex",
  },
}
