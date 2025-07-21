local augroup = vim.api.nvim_create_augroup("SpreadneckAutocmds", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = { "markdown", "vimwiki" },
  callback = function(args)
    -- Enable treesitter highlighting and spell checking for writing files
    local lang = "en_us"
    vim.treesitter.start(args.buf)
    vim.api.nvim_buf_set_option(args.buf, "spell", true)
    local ok = pcall(vim.api.nvim_buf_set_option, args.buf, "spelllang", lang)
    if not ok then
      vim.notify(
        string.format("Spell dictionary for %s is missing. Run ':set spelllang=%s' to download.", lang, lang),
        vim.log.levels.WARN
      )
    end
  end,
})