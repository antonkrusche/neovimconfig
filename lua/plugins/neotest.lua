return {
    "nvim-neotest/neotest",
    dependencies = {"nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter", "antoinemadec/FixCursorHold.nvim",
                    "alfaix/neotest-gtest"},
    config = function()
        require("neotest").setup({
            adapters = {require("neotest-gtest").setup({})}
        })
    end
}