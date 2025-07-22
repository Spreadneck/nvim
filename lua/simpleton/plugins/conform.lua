return {
    {
  'stevearc/conform.nvim',
  opts = {},
  config = function()
    require('conform').setup({
      format_on_save = {
        lsp_fallback = true,
        timeout_ms = 1000,
      },
      formatters_by_ft = {
        lua = { 'stylua' },
        python = { 'black' },
        javascript = { 'prettier' },
        typescript = { 'prettier' },
        html = { 'prettier' },
        css = { 'prettier' },
        markdown = { 'prettier' },
        json = { 'prettier' },
        yaml = { 'prettier' },
        vimwiki = { 'prettier' },
      },
    })
  end,
}
}