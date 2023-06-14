local overseer = require("overseer")

local function test()
    overseer.run_template({ name = "npm watch", prompt = "always" })
end

test()
