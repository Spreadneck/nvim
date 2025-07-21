return {
  {
    "williamboman/mason.nvim",
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    opts = {
      ensure_installed = {
        "bashls", "cssls", "dockerls", "gopls", "html", "jsonls", "pyright",
        "vimls", "yamlls", "ansiblels", "marksman", "lua_ls", "texlab",
      },
    },
    config = function(_, opts)
      local setup_lsp_servers = function(opts)
        local mason_lspconfig = require "mason-lspconfig"
        local lspconfig = require "lspconfig"
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        mason_lspconfig.setup(opts)
        if mason_lspconfig.setup_handlers then
          mason_lspconfig.setup_handlers {
            function(server)
              local server_opts = { capabilities = capabilities }
              if server == "lua_ls" then
                server_opts.settings = { Lua = { diagnostics = { globals = { "vim" } } } }
              end
              lspconfig[server].setup(server_opts)
            end,
          }
        else
          for _, server in ipairs(mason_lspconfig.get_installed_servers()) do
            local server_opts = { capabilities = capabilities }
            if server == "lua_ls" then
              server_opts.settings = { Lua = { diagnostics = { globals = { "vim" } } } }
            end
            lspconfig[server].setup(server_opts)
          end
        end
      end

      setup_lsp_servers(opts)
    end,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvimtools/none-ls.nvim" },
    opts = {
      ensure_installed = {
        "prettier", "stylua", "eslint", "shellcheck", "shfmt", "black",
        "ruff", "isort", "markdownlint", "yamllint", "ansiblelint",
      },
    },
    config = function(_, opts)
      require("mason-null-ls").setup(opts)
      local null_ls = require "null-ls"

      null_ls.setup {
        sources = {
          null_ls.builtins.code_actions.gitsigns,
          null_ls.builtins.diagnostics.markdownlint,
          null_ls.builtins.diagnostics.yamllint,
          null_ls.builtins.diagnostics.ansiblelint,
          null_ls.builtins.diagnostics.eslint,
          null_ls.builtins.diagnostics.codespell.with {
            filetypes = { "markdown", "vimwiki" },
          },
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.shfmt,
          null_ls.builtins.formatting.black,
          null_ls.builtins.formatting.isort,
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