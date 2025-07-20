return {{
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate"
}, {
    -- Register Treesitter language for Vimwiki after plugins are loaded
    "nvim-treesitter/nvim-treesitter",
    config = function()
        vim.treesitter.language.register('markdown', 'vimwiki')
    end
}, {
    "tree-sitter-grammars/tree-sitter-markdown",
    run = ":TSInstall markdown"
}, {
    "latex-lsp/tree-sitter-latex",
    run = ":TSInstall latex"
}}
