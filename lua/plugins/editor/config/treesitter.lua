return function()
	local deps = {
		"bash",
		"c",
		"c_sharp",
		"cpp",
		"css",
		"csv",
		"dockerfile",
		"dot",
		"fsh",
		"go",
		"gomod",
		"gosum",
		"gowork",
		"html",
		"htmldjango",
		"javascript",
		"lisp",
		"json",
		"json5",
		"julia",
		"lua",
		"luadoc",
		"luap",
		"luau",
		"markdown",
		"proto",
		"python",
		"query",
		"rust",
		"rust_with_rstml",
		"toml",
		"tsx",
		"typescript",
		"yaml",
	}

	-- -- Enable `rstml`
	vim.treesitter.language.register("rust_with_rstml", "rust")

	vim.api.nvim_create_autocmd("FileType", {
		pattern = deps,
		callback = function(args)
			-- Condition: Does `TS` ready
			local ok, ts = pcall(require, "nvim-treesitter")
			if not ok then
				return
			end

			local ft = vim.bo[args.buf].filetype

			-- Condition: Does `TS` support buffer's lang
			local ok_lang, lang = pcall(vim.treesitter.language.get_lang, ft)
			if not ok_lang or not lang then
				return
			end

			-- Condition: Does `TS` installed the `lang`'s parser
			local ok_parser, parser = pcall(vim.treesitter.get_parser, args.buf, lang)
			if not ok_parser or not parser then
				ts.install({ lang }):await()

				local function wait_for_parser(tries)
					tries = tries or 0
					-- ~10s max
					if tries > 50 then
						return
					end

					local ok2, parser2 = pcall(vim.treesitter.get_parser, args.buf, lang)
					if ok2 and parser2 then
						vim.treesitter.start(args.buf, lang)
						vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
						return
					end

					vim.defer_fn(function()
						wait_for_parser(tries + 1)
					end, 200)
				end

				wait_for_parser()

				return
			end

			vim.treesitter.start(args.buf, lang)
			vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
		end,
	})
end
