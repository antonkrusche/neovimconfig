-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.list = true
vim.opt.listchars = {
    tab = "⇥ ",
    leadmultispace = "┊···",
    extends = "⟩",
    precedes = "⟨",
    space = "·",
    lead = "·",
    trail = "␣",
    nbsp = "⍽",
    eol = "↵",
}

vim.o.showtabline = 2

vim.g.gruvbox_material_background = "soft"
vim.g.gruvbox_material_better_performance = 1

vim.g.lazyvim_picker = "snacks"

vim.opt.shell = "bash"
