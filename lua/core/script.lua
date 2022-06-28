local Script = {}
function Script.req(modules)
    require("rit.plugins."..modules)
end

function Script.check(modules)
    local ok, mod = pcall(require, modules)
    if ok then
        return true
    else
        print(modules .." not found")
    end
end

return Script
