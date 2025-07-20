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
      local mason_lspconfig = require "mason-lspconfig"
      mason_lspconfig.setup(opts)

      local lspconfig = require "lspconfig"

      if mason_lspconfig.setup_handlers then
        -- Newer versions expose setup_handlers
        mason_lspconfig.setup_handlers {
          function(server)
            lspconfig[server].setup {}
          end,
          ["lua_ls"] = function()
            lspconfig.lua_ls.setup {
              settings = {
                Lua = { diagnostics = { globals = { "vim" } } },
              },
            }
          end,
        }
      else
        -- Fallback for older versions
        for _, server in ipairs(mason_lspconfig.get_installed_servers()) do
          if server == "lua_ls" then
            lspconfig.lua_ls.setup {
              settings = {
                Lua = { diagnostics = { globals = { "vim" } } },
              },
            }
          else
            lspconfig[server].setup {}
          end
        end
      end
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
