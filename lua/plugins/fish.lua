return {
    {
        "mason-org/mason.nvim",
        opts = { ensure_installed = { "fish-lsp" } },
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = { ensure_installed = { "fish" } },
    },
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                fish_lsp = {},
            },
        },
    },
}
