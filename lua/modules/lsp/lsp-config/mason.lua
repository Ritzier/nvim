local M = {}

function M.setup()
	require("mason").setup({})
	require("mason-tool-installer").setup({
		ensure_installed = {
			"stylua",
			"shfmt",
			"shellcheck",
			"prettierd",
      -- "julia-lsp",
      "html-lsp",

      "json-lsp",
      "wgsl-analyzer",

      -- DEBUGGER
      -- "chrome-debug-adapter",
			-- "netcoredbg",
			-- "codelldb",
      "bash-debug-adapter",
      "debugpy",
      "java-debug-adapter",
      -- "node-debug2-adapter",
      "go-debug-adapter",
		},
		auto_update = false,
		run_on_start = true,
	})
end

return M
