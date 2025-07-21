return {
  {
    "vimwiki/vimwiki",
    init = function()
      vim.g.vimwiki_list = {
        {
          path = "~/vimwiki/",
          syntax = "markdown",
          ext = ".md",
          auto_export = 0,
          links_space_char = "_",
          template_path = "~/vimwiki/templates",
          template_default = "default",
          template_ext = ".md",
          index = "index",
          diary_index = "index",
          diary_rel_path = "journal",
          diary_header = "Journal",
          diary_template = "diary",
        },
      }
      vim.g.vimwiki_markdown_link_ext = 1
    end,
  },
  {
    "plasticboy/vim-markdown",
    branch = "master",
    require = { "godlygeek/tabular" },
  },
}
