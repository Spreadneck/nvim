return {
  {
    "williamboman/mason.nvim",
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    opts = {
      -- Explicit list of servers. Add more as needed.
      ensure_installed = {
        "bashls",
        "cssls",
        "dockerls",
        "gopls",
        "html",
        "jsonls",
        "pyright",
        "vimls",
        "yamlls",
        "ansiblels",
        "marksman",
        "lua_ls",
        "texlab",
      },
    },
    config = function(_, opts)
      require("mason-lspconfig").setup(opts)
      -- Prefer using the handler to register all LSPs
      require("mason-lspconfig").setup_handlers {
        function(server)
          require("lspconfig")[server].setup {}
        end,
        -- Optional: per-server config overrides
        ["lua_ls"] = function()
          require("lspconfig").lua_ls.setup {
            settings = {
              Lua = { diagnostics = { globals = { "vim" } } },
            },
          }
        end,
        -- Add more specific server setups as needed
      }
    end,
  },
  -- ... previous mason/mason-lspconfig sections as above ...

  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvimtools/none-ls.nvim" },
    opts = {
      ensure_installed = {
        "prettier",
        "stylua",
        "eslint",
        "shellcheck",
        "shfmt",
        "black",
        "ruff",
        "isort",
        "markdownlint",
        "yamllint",
        "ansiblelint",
      },
    },
    config = function(_, opts)
      require("mason-null-ls").setup(opts)
      local null_ls = require "null-ls"

      null_ls.setup {
        sources = {
          -- CODE ACTIONS
          null_ls.builtins.code_actions.gitsigns,

          -- DIAGNOSTICS/LINTING
          null_ls.builtins.diagnostics.markdownlint,
          null_ls.builtins.diagnostics.yamllint,
          null_ls.builtins.diagnostics.ansiblelint,
          null_ls.builtins.diagnostics.eslint,
          null_ls.builtins.diagnostics.ruff,
          null_ls.builtins.diagnostics.codespell.with {
            filetypes = { "markdown", "vimwiki" },
          },

          -- FORMATTING
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.shfmt,
          null_ls.builtins.formatting.black,
          null_ls.builtins.formatting.isort,

          -- SPELL COMPLETION
          null_ls.builtins.completion.spell.with {
            filetypes = { "markdown", "vimwiki" },
          },
        },

        on_attach = function(client, bufnr)
          if client.supports_method "textDocument/formatting" then
            vim.api.nvim_clear_autocmds { group = "LspFormatting", buffer = bufnr }
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = vim.api.nvim_create_augroup("LspFormatting", { clear = true }),
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format { bufnr = bufnr, timeout_ms = 2000 }
              end,
            })
          end
        end,
      }
    end,
  },
}
