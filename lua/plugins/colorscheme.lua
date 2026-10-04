return {
    -- add alternative colorschemes
    { "sainnhe/gruvbox-material" },
    { "sainnhe/everforest" },
    { "AlexvZyl/nordic.nvim" },

    -- disable the colorschemes which ship with LazyVim by default
    { "folke/tokyonight.nvim", enabled = false },
    { "catppuccin/nvim", enabled = false },

    -- load the colorscheme
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "gruvbox-material",
        },
    },
}
