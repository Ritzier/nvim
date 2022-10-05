local M = {}

M.adapters = {
    type = "executable",
    command = "flutter",
    args = { "debug_adapter" },
}

M.configurations = {
    type = "dart",
    request = "launch",
    name = "Launch Flutter Program",
    program = "${file}",
    cwd = "${workspaceFolder}",
    toolArgs = { "-d", "linux" },
}

function M.setup()
    require("dap").adapters.dart = M.adapters
    require("dap").configurations.dart = { M.configurations }
end

return M
