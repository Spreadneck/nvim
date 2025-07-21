local augroup = vim.api.nvim_create_augroup("SpreadneckAutocmds", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = { "markdown", "vimwiki" },
  callback = function(args)
    vim.treesitter.start(args.buf)
    vim.api.nvim_buf_set_option(args.buf, "spell", true)
    vim.api.nvim_buf_set_option(args.buf, "spelllang", "en_us")
  end,
})
