return {
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",

    config = function()
      require("gitsigns").setup {
        signs = {
          add = {
            hl = "GitSignsAdd",
            text = "", -- Nerd Font: nf-fa-plus (plus)
            numhl = "GitSignsAddNr",
            linehl = "GitSignsAddLn",
          },
          change = {
            hl = "GitSignsChange",
            text = "", -- nf-oct-diff_modified
            numhl = "GitSignsChangeNr",
            linehl = "GitSignsChangeLn",
          },
          delete = {
            hl = "GitSignsDelete",
            text = "", -- nf-oct-diff_removed (trash can)
            numhl = "GitSignsDeleteNr",
            linehl = "GitSignsDeleteLn",
          },
          topdelete = {
            hl = "GitSignsDelete",
            text = "", -- nf-fa-minus (minus)
            numhl = "GitSignsDeleteNr",
            linehl = "GitSignsDeleteLn",
          },
          changedelete = {
            hl = "GitSignsChange",
            text = "󰍹", -- nf-md-pencil (pencil)
            numhl = "GitSignsChangeNr",
            linehl = "GitSignsChangeLn",
          },
          untracked = {
            hl = "GitSignsAdd",
            text = "", -- nf-fa-question (question mark for untracked)
            numhl = "GitSignsAddNr",
            linehl = "GitSignsAddLn",
          },
        },

        signcolumn = true, -- Toggle with ':Gitsigns toggle_signs'
        numhl = false, -- Toggle with ':Gitsigns toggle_numhl'
        linehl = false, -- Toggle with ':Gitsigns toggle_linehl'
        word_diff = false, -- Toggle with ':Gitsigns toggle_word_diff'
        watch_gitdir = { interval = 1000, follow_files = true },
        attach_to_untracked = true,

        current_line_blame = true, -- Toggle with ':Gitsigns toggle_current_line_blame'
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
          delay = 300,
          ignore_whitespace = false,
        },
        current_line_blame_formatter = "<author>  <author_time:%Y-%m-%d> · <summary>",

        preview_config = {
          border = "rounded",
          style = "minimal",
          relative = "cursor",
          row = 0,
          col = 1,
        },
      }
    end,
  },
}

