local config = require("modules.lsp.config")

local function check(plug)
	if not pcall(require, plug) then
		vim.notify(plug .. " not found", "error")
		return false
	else
		return true
	end
end

if check("nvim-lightbulb") then
	config.lightbulb()
end

if check("luasnip") then
	config.luasnip()
end
