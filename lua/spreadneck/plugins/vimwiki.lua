return {{
    "vimwiki/vimwiki",
    init = function()
        vim.g.vimwiki_list = {{
            path = "~/vimwiki-hugo/content",
            syntax = "markdown",
            ext = ".md",
            auto_export = 0,
            links_space_char = "_",
            template_path = "~/vimwiki-hugo/templates",
            template_default = "default",
            template_ext = ".md",
            index = "_index",
            diary_index = "_index",
            diary_rel_path = "posts",
            diary_header = "Journal"
        }}
    end
}, {
    'plasticboy/vim-markdown',
    branch = 'master',
    require = {'godlygeek/tabular'}
}}
