local function check_modified()
    for _, curr_buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_get_option_value("modified", { buf = curr_buf }) then
            return "Unsaved buffers" -- any message or icon
        end
    end
    return ""
end

return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
        table.insert(opts.sections.lualine_c, require("action-hints").statusline)
        table.insert(opts.sections.lualine_y, check_modified)
    end,
}
