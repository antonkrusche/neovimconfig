return {
    "nvimdev/dashboard-nvim",
    opts = {
        theme = "hyper",
        change_to_vcs_root = true,
        hide = {
            -- this is taken care of by lualine
            -- enabling this messes up the actual laststatus setting after loading a file
            statusline = false,
        },
        config = {
            week_header = { enable = true },
            shortcut = {
                { desc = "󰊳 Update", group = "Blue", action = "Lazy update", key = "u" },
                {
                    icon = " ",
                    icon_hl = "@variable",
                    desc = "git files",
                    group = "Orange",
                    action = "lua Snacks.picker.git_files()",
                    key = "f",
                },
                {
                    desc = " Live grep",
                    group = "Purple",
                    action = "lua Snacks.picker.grep()",
                    key = "g",
                },
                {
                    desc = " recent files",
                    group = "Yellow",
                    action = "lua Snacks.picker.recent()",
                    key = "o",
                },
                {
                    desc = "󱖫 git status",
                    group = "Green",
                    action = "lua Snacks.picker.git_status()",
                    key = "s",
                },
            },
            project = {
                enable = true,
                limit = 8,
                icon = "Recent projects:",
                label = "",
                -- Selecting a project `lcd`s into it first; open Snacks files there.
                -- (dashboard-nvim's default action is `Telescope find_files`, which
                -- isn't installed in this config.)
                action = function(path)
                    Snacks.picker.files({ cwd = path })
                end,
            },
            mru = { limit = 20, icon = "Recent files:", label = "", cwd_only = false },
        },
    },
}
