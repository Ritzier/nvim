local M = {}

function M.status(name)
    local status_ok, module = pcall(require, name)
    if not status_ok then
        print(name .. " not work")
        return
    else
        return true
    end
end

M.status("packer")

return M
