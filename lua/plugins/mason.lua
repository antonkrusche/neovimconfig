return {
    "williamboman/mason.nvim",
    opts = function(_, opts)
        -- Remove "codelldb" from ensure_installed list if it exists
        opts.ensure_installed = vim.tbl_filter(function(pkg)
            return pkg ~= "codelldb"
        end, opts.ensure_installed or {})
    end,
}
