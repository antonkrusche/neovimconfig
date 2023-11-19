return {
    "roobert/action-hints.nvim",
    config = function()
        require("action-hints").setup({
            template = {
                definition = { text = "󰈚", color = "#5D6B66" },
                references = { text = " 󰌹 %s", color = "#5D6B66" },
            },
            use_virtual_text = false,
        })
    end,
}
