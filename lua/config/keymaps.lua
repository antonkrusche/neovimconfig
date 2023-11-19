-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.del("n", "<leader><tab>]")
vim.keymap.del("n", "<leader><tab>[")

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
-- move current tab to previous position
vim.api.nvim_set_keymap("n", "<leader><tab>j", ":-tabmove<CR>", {
    desc = "Move tab to previous pos",
    noremap = true,
})
-- move current tab to next position
vim.api.nvim_set_keymap("n", "<leader><tab>k", ":+tabmove<CR>", {
    desc = "Move tab to next pos",
    noremap = true,
})
