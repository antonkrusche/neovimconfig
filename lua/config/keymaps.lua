-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Delete unwanted LazyVim keymaps
vim.keymap.del("n", "<leader><tab>]")
vim.keymap.del("n", "<leader><tab>[")

-- Compensate for german keyboard
vim.api.nvim_set_keymap("n", "ö", "[", { noremap = false, silent = true })
vim.api.nvim_set_keymap("n", "ä", "]", { noremap = false, silent = true })
vim.api.nvim_set_keymap("n", "Ö", "{", { noremap = false, silent = true })
vim.api.nvim_set_keymap("n", "Ä", "}", { noremap = false, silent = true })

-- tab related keymaps
vim.api.nvim_set_keymap("n", "<leader><tab>o", ":tabonly<CR>", {
    desc = "Close all other tabs",
    noremap = true,
})
vim.api.nvim_set_keymap("n", "<leader><tab>l", ":tabn<CR>", {
    desc = "Next tab",
    noremap = true,
})
vim.api.nvim_set_keymap("n", "<leader><tab>h", ":tabp<CR>", {
    desc = "Previous tab",
    noremap = true,
})
vim.api.nvim_set_keymap("n", "<leader><tab>j", ":-tabmove<CR>", {
    desc = "Move tab to previous pos",
    noremap = true,
})
vim.api.nvim_set_keymap("n", "<leader><tab>k", ":+tabmove<CR>", {
    desc = "Move tab to next pos",
    noremap = true,
})
vim.api.nvim_set_keymap("n", "<S-l>", ":tabn<CR>", {
    desc = "Next tab",
    noremap = true,
    silent = true,
})
vim.api.nvim_set_keymap("n", "<S-h>", ":tabp<CR>", {
    desc = "Previous tab",
    noremap = true,
    silent = true,
})

-- Accelerated navigation keymaps
vim.keymap.set({ "n", "x", "o" }, "<C-h>", "^")
vim.keymap.set({ "n", "x", "o" }, "<C-l>", "$")
vim.keymap.set({ "n", "x", "o" }, "<C-j>", "6jzz")
vim.keymap.set({ "n", "x", "o" }, "<C-k>", "6kzz")
vim.keymap.set({ "n", "x", "o" }, "<C-u>", "<C-u>zz")
vim.keymap.set({ "n", "x", "o" }, "<C-d>", "<C-d>zz")

-- plugin related keymaps
vim.api.nvim_set_keymap("n", "<leader>fp", ":CdProject<CR>", {
    desc = "Find project",
    noremap = true,
})
