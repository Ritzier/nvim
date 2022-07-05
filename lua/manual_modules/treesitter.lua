local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    print("Treesitter not work")
	return
end

configs.setup({
	ensure_installed = "all", -- one of "all" or a list of languages
	ignore_install = { "" }, -- List of parsers to ignore installing
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "css" }, -- list of language that will be disabled
	},
	autopairs = {
		enable = true,
	},
	indent = { enable = true },
    rainbow = { enable = true },
    endwise = { enable = true },
})
