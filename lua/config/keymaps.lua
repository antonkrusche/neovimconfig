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

local function copy_code_reference(include_code)
    local bufnr = vim.api.nvim_get_current_buf()
    local file = vim.api.nvim_buf_get_name(bufnr)
    if file == "" then
        vim.notify("Code ref: buffer has no file name", vim.log.levels.WARN)
        return
    end

    -- Anchor (<) and cursor (.) of the visual selection, in line order.
    local a, b = vim.fn.getpos("v")[2], vim.fn.getpos(".")[2]
    local s, e = math.min(a, b), math.max(a, b)

    -- Path relative to the current working directory, when possible.
    local rel = vim.fn.fnamemodify(file, ":.")

    local block
    if include_code then
        local lines = vim.api.nvim_buf_get_lines(bufnr, s - 1, e, false)
        block = string.format(
            "Reference: %s (lines %d-%d)\n```%s\n%s\n```\n",
            rel,
            s,
            e,
            vim.bo[bufnr].filetype,
            table.concat(lines, "\n")
        )
    else
        block = string.format("Reference: %s:%d-%d\n", rel, s, e)
    end

    vim.fn.setreg("+", block)
    vim.fn.setreg('"', block)
    vim.notify(string.format("Copied ref: %s:%d-%d", rel, s, e))
end

vim.keymap.set("x", "<leader>cr", function()
    copy_code_reference(false)
end, { desc = "pi: copy selection reference" })

vim.keymap.set("x", "<leader>cR", function()
    copy_code_reference(true)
end, { desc = "pi: copy selection reference + code" })
