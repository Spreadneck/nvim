# Neovim Configuration

Personal Neovim setup optimized for Markdown, Vimwiki, and developer productivity—modular, fast, and extensible.

---

## Features

- **[lazy.nvim](https://github.com/folke/lazy.nvim)** plugin manager
- **Treesitter**: modern syntax for Markdown, Vimwiki, HTML, LaTeX, and code
- **LSP**: managed by Mason (supports auto-install for LSP servers)
- **Autocompletion**: powered by nvim-cmp
- **Ansible syntax** with ansible-vim plus LSP and linting
- **Formatting**: via conform.nvim and mason-conform.nvim
- **Git Integration**: Gitsigns, vim-fugitive, Telescope git pickers
- **Markdown preview in terminal**
- **Automatic spell checking** for Markdown/Vimwiki (`en_us` by default)
- **Yank history** and motion via yanky.nvim (with Telescope picker interface)
- **Text surrounds** handled by nvim-surround
- **Enhanced notifications and command-line UI** via noice.nvim
- **Telescope fuzzy finder** with these extensions enabled:
  - FZF Native (fast sort/picker engine)
  - Project management (`telescope-project`)
  - Code actions/comments (`telescope-cc`)
  - File browser (`telescope-file-browser`)
  - Yank history (`yanky`)
  - Symbol picker, spell suggester (`spell_suggest`), and more

---

## Installation

Clone this repo into your Neovim config directory:

```sh
git clone <repo-url> ~/.config/nvim
```

On first launch, lazy.nvim will bootstrap and sync plugins:

```vim
:Lazy sync
```

---

## Usage Highlights

- **Yank history picker:** `<leader>p` (uses Telescope)
- **Spell suggestions picker:** `<leader>sp` (uses Telescope, in spell-checked files)
- **Project picker:** `:Telescope project`
- **File browser:** `:Telescope file_browser`
- **Git status:** `:Telescope git_status`
- **Jump to symbols:** `:Telescope treesitter` (buffer-local outline)
- **Markdown/Vimwiki notes:** auto spell-check, grammar wordlist support via academic.nvim

---

## Formatting

This repo uses [stylua](https://github.com/JohnnyMorganz/StyLua) for Lua formatting.  
Before committing changes, run:

```sh
stylua init.lua lua
```
Or use it as a pre-commit hook.

---

## Plugin Management

- Lazy.nvim loads plugins defined in `lua/spreadneck/plugins/`.
- Update plugins anytime with `:Lazy sync`.

---

## Advanced

- **Spell wordlist management:** Powered by [academic.nvim](https://github.com/ficcdaf/academic.nvim)
- **Custom Vimwiki/Markdown templates:** See `vimwiki` folder and docs.

---

## Updating

Pull updates and re-sync plugins:

```sh
git pull
nvim +"Lazy sync" +qall
```

---

*For detailed config, see the `lua/spreadneck/` folder and plugin comments.*