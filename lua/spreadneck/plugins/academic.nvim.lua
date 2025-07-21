return {
  {
    "ficcdaf/academic.nvim",
    build = ":AcademicBuild",
    opts = {
      wordlist_dir = vim.fn.expand("~/.config/nvim/academic-wordlists"), -- custom location
      languages = { "en" },
    }
  },
}