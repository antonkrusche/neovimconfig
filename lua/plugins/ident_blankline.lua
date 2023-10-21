return {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
        require("ibl").setup({
            indent = {},
            whitespace = {
                highlight = {"Whitespace", "NonText"}
            }
        })
    end
}
