if vim.env.SSH_TTY then
	local function paste()
		return {
			vim.split(vim.fn.getreg('"'), "\n"),
			vim.fn.getregtype('"'),
		}
	end

	vim.g.clipboard = {
		name = "OSC 52",
		copy = {
			["+"] = require("vim.ui.clipboard.osc52").copy("+"),
			["*"] = require("vim.ui.clipboard.osc52").copy("*"),
		},
		paste = {
			["+"] = paste,
			["*"] = paste,
		},
	}
	vim.opt.clipboard:append("unnamedplus")
else
	vim.opt.clipboard = "unnamedplus"
end
