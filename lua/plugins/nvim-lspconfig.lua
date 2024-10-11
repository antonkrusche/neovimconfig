return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            -- add any global capabilities here
            capabilities = {},
            -- LSP Server Settings
            ---@type lspconfig.options
            servers = {
                lua_ls = {
                    mason = false, -- set to false if you don't want this server to be installed with mason
                },
                clangd = {
                    mason = false,
                },
                pylsp = {
                    mason = false,
                },
            },
        },
    },
}
