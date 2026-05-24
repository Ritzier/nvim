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

-- ============ Create parent path when folder not exists ========

vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function()
		local dir = vim.fn.expand("<afile>:p:h")
		if vim.fn.isdirectory(dir) == 0 then
			vim.fn.mkdir(dir, "p")
		end
	end,
})
