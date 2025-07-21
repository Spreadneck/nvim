# Neovim Configuration

This repository contains a personal Neovim setup focused on writing Markdown and Vimwiki files.

## Features
- **Lazy.nvim** plugin manager
- Treesitter support for Markdown and Vimwiki
- Git integration with gitsigns and vim-fugitive
- LSP management via mason and mason-lspconfig
- Formatting and linting through null-ls
- Render Markdown preview in the terminal
- Automatic spell checking for Markdown and Vimwiki files (`en_us` by default)

## Installation
Clone the repo into your Neovim config directory:

```sh
git clone <repo-url> ~/.config/nvim
```

Install the plugins on first start with:

```vim
:Lazy sync
```

### Formatting
This repo uses [stylua](https://github.com/JohnnyMorganz/StyLua) for Lua formatting. Run `stylua .` before committing changes:

```sh
stylua init.lua lua
```

