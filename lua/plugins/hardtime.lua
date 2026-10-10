return {
    "m4xshen/hardtime.nvim",
    lazy = false,
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {
        -- Hint only: never block a key, just nudge towards better motions.
        restriction_mode = "hint",

        -- On this Colemak-DH setup the arrow keys live on the physical hjkl
        -- keys of the (layer-while-held) nav layer, so they are used as
        -- deliberate navigation. Enable them again (hardtime disables them
        -- by default) ...
        -- disabled_keys = {
        --     ["<Up>"] = false,
        --     ["<Down>"] = false,
        --     ["<Left>"] = false,
        --     ["<Right>"] = false,
        -- },

        -- -- ... and restrict them exactly like hjkl instead.
        -- restricted_keys = {
        --     ["<Up>"] = { "n", "x" },
        --     ["<Down>"] = { "n", "x" },
        --     ["<Left>"] = { "n", "x" },
        --     ["<Right>"] = { "n", "x" },
        -- },
    },
}
