return {
	{
		"ray-x/go.nvim",
		lazy = true,
		ft = { "go" },
		config = require("modules.lang.vim-go"),
	},
	{
		"habamax/vim-godot",
		lazy = true,
	},
	{
		"rust-lang/rust.vim",
		lazy = true,
		ft = "rust",
	},
	{
		"Saecki/crates.nvim",
		lazy = true,
		event = "BufReadPost Cargo.toml",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = require("modules.lang.crates"),
	},
	{
		"iamcco/markdown-preview.nvim",
		lazy = true,
		ft = "markdown",
		build = ":call mkdp#util#install()",
	},
	{
		"chrisbra/csv.vim",
		lazy = true,
		ft = "csv",
	},
	{
		"ziglang/zig.vim",
		lazy = true,
		ft = "zig",
	},
	{
		"vimjas/vim-python-pep8-indent",
		lazy = true,
		ft = "python",
	},
}
