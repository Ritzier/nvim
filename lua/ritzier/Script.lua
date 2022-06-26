local Script = {}

function Script.check(module)
    local ok, mod = pcall(require, module)
    if ok then
        return true
    else
        print(module .. " not found")
    end
end

function Script.test()
    return yes
end

return Script
