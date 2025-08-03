return function()
	require("otter").setup({
		-- Whether to enable completion
		lsp = {
			-- Function to determine hover provider
			hover = {
				border = "rounded", -- Border style for hover windows
			},
			-- Diagnostic configuration
			diagnostic = {
				-- How to handle diagnostics from embedded languages
				update_in_insert = false,
			},
		},
		-- Buffer configuration
		buffers = {
			-- Whether otter buffers should be written to disk
			write_to_disk = false,
			-- Whether to set filetype on otter buffers
			set_filetype = true,
		},
		-- How to handle quotes and whitespace
		strip_wrapping_quote_characters = { "'", '"', "`" },
		handle_leading_whitespace = true,
	})

	vim.api.nvim_create_autocmd({ "FileType" }, {
		pattern = { "toml" },
		group = vim.api.nvim_create_augroup("EmbedToml", {}),
		callback = function()
			require("otter").activate()
		end,
	})

	-- TODO: only python lsp would show in markdown
	-- vim.api.nvim_create_autocmd({ "FileType" }, {
	-- 	pattern = { "markdown", "md" },
	-- 	group = vim.api.nvim_create_augroup("EmbedMarkdown", {}),
	-- 	callback = function()
	-- 		require("otter").activate({ "python", "javascript", "bash", "lua", "html", "css" })
	-- 	end,
	-- })
end
