-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require "spreadneck.settings"
require "spreadneck.maps"
require "spreadneck.autocmds"
require "spreadneck.lazy"
