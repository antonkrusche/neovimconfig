return {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function()
        local logo = [[
         ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z
         ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z    
         ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z       
         ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z         
         ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║           
         ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝           
    ]]

        logo = string.rep("\n", 8) .. logo .. "\n\n"

        local opts = {
            theme = "hyper",
            change_to_vcs_root = true,
            hide = {
                -- this is taken care of by lualine
                -- enabling this messes up the actual laststatus setting after loading a file
                statusline = false,
            },
            config = {
                week_header = {
                    enable = true,
                },
                shortcut = {
                    { desc = "󰊳 Update", group = "Blue", action = "Lazy update", key = "u" },
                    {
                        icon = " ",
                        icon_hl = "@variable",
                        desc = "git files",
                        group = "Orange",
                        action = "FzfLua git_files",
                        key = "f",
                    },
                    {
                        desc = " Live grep",
                        group = "Purple",
                        action = "FzfLua live_grep",
                        key = "g",
                    },
                    {
                        desc = " oldfiles",
                        group = "Yellow",
                        action = "FzfLua oldfiles",
                        key = "o",
                    },
                    {
                        desc = "󱖫 git status",
                        group = "Green",
                        action = "FzfLua git_status",
                        key = "s",
                    },
                },
                project = {
                    enable = false,
                    limit = 8,
                    icon = "Recent projects:",
                    label = "",
                    action = "FzfLua files",
                },
                mru = { limit = 20, icon = "Recent files:", label = "", cwd_only = false },
            },
        }

        -- close Lazy and re-open when the dashboard is ready
        if vim.o.filetype == "lazy" then
            vim.cmd.close()
            vim.api.nvim_create_autocmd("User", {
                pattern = "DashboardLoaded",
                callback = function()
                    require("lazy").show()
                end,
            })
        end

        return opts
    end,
}
