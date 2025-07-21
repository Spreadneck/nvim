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
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        sh = { "shfmt" },
        ["_"] = { "trim_whitespace" },
      },
      format_on_save = {
        timeout_ms = 2000,
        lsp_format = "fallback",
      },
    },
    config = function(_, opts)
      require("conform").setup(opts)
    end,
  },
  {
    "zapling/mason-conform.nvim",
    dependencies = { "stevearc/conform.nvim" },
    config = true,
  },
}
