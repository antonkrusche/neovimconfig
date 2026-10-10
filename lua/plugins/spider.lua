-- nvim-spider: make the w / e / b / ge motions subword-aware.
--
-- Default vim motions treat `myVariableName` and `FOO_BAR_BAZ` as one word.
-- Spider stops at the subword boundaries instead (camelCase, SNAKE_CASE,
-- kebab-case):
--
--   local myVariableName = FOO_BAR_BAZ
--   --    ^ ^       ^    ^ ^   ^   ^   (spider)
--
-- It also skips "insignificant" punctuation (e.g. the `:` and `(` in
-- `foo:find(`) so `w` crosses a line with fewer stops. Toggle that off via
-- `skipInsignificantPunctuation = false` below if it feels wrong.
--
-- Not treesitter-based: it works on Lua patterns and ignores `iskeyword`, so
-- there is nothing to add to the language extras and it won't touch
-- nvim-treesitter. Complements hardtime (hint mode) by favouring fewer, bigger
-- motions.
return {
    "chrisgrieser/nvim-spider",
    -- Lazily load on first keystroke. The Ex-command form (rather than a Lua
    -- function callback) is required for dot-repeat to work.
    keys = {
        { "w", "<cmd>lua require('spider').motion('w')<CR>", mode = { "n", "o", "x" } },
        { "e", "<cmd>lua require('spider').motion('e')<CR>", mode = { "n", "o", "x" } },
        { "b", "<cmd>lua require('spider').motion('b')<CR>", mode = { "n", "o", "x" } },
        { "ge", "<cmd>lua require('spider').motion('ge')<CR>", mode = { "n", "o", "x" } },
    },
    opts = {
        -- skipInsignificantPunctuation = true, -- false = vim-like punctuation stops
        -- subwordMovement = true,
        -- NOTE: spider deliberately does not reproduce vim's `cw` -> `ce`
        -- special case. If that breaks muscle memory, add:
        -- vim.keymap.set("n", "cw", "ce", { remap = true })
    },
}
