-- Function to read JSON config from the project's root
local function read_project_config()
    local path = vim.fn.getcwd() .. "/dap_config.json" -- Look in current working directory
    local file = io.open(path, "r")
    if file then
        local content = file:read("*a")
        file:close()
        local ok, data = pcall(vim.json.decode, content)
        if ok and data.executable then
            return vim.fn.getcwd() .. "/" .. data.executable -- Resolve relative path
        end
    end
    return nil
end
return {
    {
        "mfussenegger/nvim-dap",
        opts = function()
            local dap = require("dap")
            if not dap.adapters["codelldb"] then
                require("dap").adapters["codelldb"] = {
                    type = "server",
                    host = "localhost",
                    port = "${port}",
                    executable = {
                        command = "codelldb",
                        args = {
                            "--port",
                            "${port}",
                        },
                    },
                }
            end
            for _, lang in ipairs({ "c", "cpp" }) do
                dap.configurations[lang] = {
                    {
                        name = "Launch Project Executable",
                        type = "codelldb",
                        request = "launch",
                        program = function()
                            local exe = read_project_config()
                            if exe and vim.fn.filereadable(exe) == 1 then
                                return exe
                            else
                                return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                            end
                        end,
                        cwd = "${workspaceFolder}",
                        stopOnEntry = false,
                        args = {},
                        runInTerminal = false,
                    },
                    {
                        type = "codelldb",
                        request = "launch",
                        name = "Launch file",
                        program = function()
                            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                        end,
                        cwd = "${workspaceFolder}",
                    },
                    {
                        type = "codelldb",
                        request = "attach",
                        name = "Attach to process",
                        pid = require("dap.utils").pick_process,
                        cwd = "${workspaceFolder}",
                    },
                }
            end
        end,
    },
}
