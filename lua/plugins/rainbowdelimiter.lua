return {
    "HiPhish/rainbow-delimiters.nvim",

    config = function()
        -- This module contains a number of default definitions
        local rainbow_delimiters = require("rainbow-delimiters")

        vim.g.rainbow_delimiters = {
            strategy = {
                [""] = rainbow_delimiters.strategy["global"],
                vim = rainbow_delimiters.strategy["local"],
            },
            query = {
                [""] = "rainbow-delimiters",
                lua = "rainbow-blocks",
            },
            highlight = {
                "RainbowDelimiterRed",
                "RainbowDelimiterYellow",
                "RainbowDelimiterBlue",
                "RainbowDelimiterOrange",
                "RainbowDelimiterGreen",
                "RainbowDelimiterViolet",
                "RainbowDelimiterCyan",
            },
        }
        vim.api.nvim_set_hl(0, "RainbowDelimiterRed", { link = "@error" })
        vim.api.nvim_set_hl(0, "RainbowDelimiterYellow", { link = "@type" })
        vim.api.nvim_set_hl(0, "RainbowDelimiterBlue", { link = "@field" })
        vim.api.nvim_set_hl(0, "RainbowDelimiterOrange", { link = "@debug" })
        vim.api.nvim_set_hl(0, "RainbowDelimiterGreen", { link = "@string" })
        vim.api.nvim_set_hl(0, "RainbowDelimiterViolet", { link = "@attribute" })
        vim.api.nvim_set_hl(0, "RainbowDelimiterCyan", { link = "@conceal" })
    end,
}
