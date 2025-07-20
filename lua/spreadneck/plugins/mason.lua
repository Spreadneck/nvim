return {{
    "mason-org/mason-lspconfig.nvim",
    opts = {
        ensure_installed = {"bashls", "cssls", "dockerls", "gopls", "html", "jsonls", "pyright", "vimls", "yamlls",
                            "ansiblels", -- Ansible language server
        "marksman", -- Markdown language server
        "lua_ls", -- Lua language server
        "texlab" -- LaTeX language server
        },
        automatic_installation = true,
        automatic_setup = true
    },
    dependencies = {{
        "mason-org/mason.nvim",
        opts = {}
    }, "neovim/nvim-lspconfig"}
}, {
    "jay-babu/mason-null-ls.nvim",
    event = {"BufReadPre", "BufNewFile"},
    opts = {
        ensure_installed = {"prettier", "stylua", "eslint", "shellcheck", "shfmt", "black", "ruff", "isort",
                            "markdownlint", "yamllint", "ansiblelint"},
        automatic_installation = true,
        automatic_setup = true
    },
    dependencies = {{
        "mason-org/mason.nvim",
        opts = {}
    }, "nvimtools/none-ls.nvim"}
}}
