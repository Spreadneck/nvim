return {
  {
    "vimwiki/vimwiki",
    init = function()
      vim.g.vimwiki_list = {
        {
          path = "$HOME/vimwiki/content/",
          syntax = "markdown",
          ext = ".md",
          links_space_char = "-",
          index = "_index",
          diary_index = "_index",
          diary_rel_path = "journal",
          diary_header = "Journal",
          diary_template = "journal",
        },
      }
      vim.g.vimwiki_markdown_link_ext = 1
      vim.g.vimwiki_conceallevel = 2
    end,
    },
  }
