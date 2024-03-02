return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "cpp",
                "python",
                "c_sharp",
                "c",
                "lua",
                "query",
                "vim",
                "vimdoc",
                "yaml",
                "json",
            },
            highlight = {
                enable = true,
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<CR>",
                    scope_incremental = "<CR>",
                    node_incremental = "<TAB>",
                    node_decremental = "<S-TAB>",
                },
            },
        },
    },
}
