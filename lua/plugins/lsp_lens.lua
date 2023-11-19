return {
    "VidocqH/lsp-lens.nvim",
    config = function()
        require("lsp-lens").setup({
            sections = {
                definition = function(count)
                    return "󰈚 defs: " .. count
                end,
                references = function(count)
                    return "󰌹 refs: " .. count
                end,
                implements = function(count)
                    return "󰺫 impls: " .. count
                end,
                git_authors = function(latest_author, count)
                    return " " .. latest_author .. (count - 1 == 0 and "" or (" + " .. count - 1))
                end,
            },
        })
    end,
}
