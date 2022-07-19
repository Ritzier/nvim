local M = {}

function M.check_available(plug)
    if pcall(require, plug) then
        return true
    else
        vim.notify(plug .. " not found", "error")
        return false
    end
end

function M.req(FileName, ...)
    local plugins = {...}
    local status = nil
    for _, plug in ipairs(plugins) do
        if not M.check_available(plug) then
            status = true
        end
    end

    if status == true then
        return
    else
        require(FileName)
    end
end

return M
