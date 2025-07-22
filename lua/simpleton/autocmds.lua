local augroup = vim.api.nvim_create_augroup("SimpletonAutocmds", { clear = true })

vim.api.nvim_create_autocmd("BufNewFile", {
  pattern = "*.md",
  group = augroup,
  callback = function()
    local file = vim.fn.expand("<afile>:p")
    local base = vim.fn.expand("~/vimwiki/content")
    local script = vim.fn.expand("~/vimwiki/bin/vimwiki-tpl.py")

    vim.fn.jobstart({ "python3", script, file, base }, {
      stdout_buffered = true,
      stderr_buffered = true,
      on_stdout = function(_, data)
        if data then
          -- Clean trailing empty strings
          local lines = vim.tbl_filter(function(line)
            return line and line ~= ""
          end, data)

          -- Insert at beginning of buffer
          vim.api.nvim_buf_set_lines(0, 0, 0, false, lines)
        end
      end,
      on_stderr = function(_, data)
        if data and data[1] ~= "" then
          vim.notify("Template error:\n" .. table.concat(data, "\n"), vim.log.levels.ERROR)
        end
      end,
      on_exit = function(_, code)
        if code ~= 0 then
          vim.notify("Template script exited with code " .. code, vim.log.levels.WARN)
        end
      end,
    })
  end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.md",
  callback = function(args)
    -- Expand to full absolute path
    local file = vim.fn.expand("<afile>:p")  -- absolute file path
    local python = "/usr/bin/python3"
    local script = vim.fn.expand("~/vimwiki/bin/fix-frontmatter.py")  -- expand ~ manually

    vim.fn.jobstart({ python, script, file }, {
      stdout_buffered = true,
      stderr_buffered = true,
      on_stdout = function(_, data)
        if data then print(table.concat(data, "\n")) end
      end,
      on_stderr = function(_, data)
        if data then print("stderr: " .. table.concat(data, "\n")) end
      end,
      on_exit = function(_, code, _)
        print("fix-frontmatter exited with code: " .. code)
        if code == 0 then vim.cmd("edit!") end
      end,
    })
  end,
})
