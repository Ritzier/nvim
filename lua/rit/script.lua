local M = {}
function M.req(module)
    --require("rit.config." .. module)
    print("rit.config."..module)
end

function M.check(module)
    local ok, mod = pcall(require, module)
    if ok then
        return true
    else
        print(module .. " not found")
    end
end

return M
