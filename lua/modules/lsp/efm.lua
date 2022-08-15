-- Bash
local shellcheck = require("efmls-configs.linters.shellcheck")
local shfmt = require("efmls-configs.formatters.shfmt")
-- C, c++
local cpplint = require("efmls-configs.linters.cpplint")
local uncrustify = require("efmls-configs.formatters.uncrustify")
-- Csharp
local mcs = require("efmls-configs.linters.mcs")
-- CSS
local prettier = require("efmls-configs.formatters.prettier")
local stylelint = require("efmls-configs.linters.stylelint")
-- Docker
local hadolint = require("efmls-configs.linters.hadolint")
-- Go
local golangci = require("efmls-configs.linters.golangci_lint")
local goimports = require("efmls-configs.formatters.goimports")
-- GraphQL
local eslint = require("efmls-configs.linters.eslint")
-- local prettier = require 'efmls-configs.formatters.prettier'
-- HTML
local write_good = require("efmls-configs.linters.write_good")
-- local prettier = require 'efmls-configs.formatters.prettier'
-- JavaScript
local xo = require("efmls-configs.linters.xo")
local xo_fmt = require("efmls-configs.formatters.xo")
-- JSON, JSON5, JSONC
-- local eslint = require 'efmls-configs.linters.eslint'
-- local prettier = require 'efmls-configs.formatters.prettier'
-- LUA
local stylua = require("efmls-configs.formatters.stylua")
-- local luacheck = require("efmls-configs.linters.luacheck")
-- PHP
local phpcs = require("efmls-configs.linters.phpcs")
local phpcbf = require("efmls-configs.formatters.phpcbf")
-- Python
local flake8 = require("efmls-configs.linters.flake8")
local black = require("efmls-configs.formatters.black")
-- Ruby
local rubocop = require("efmls-configs.linters.rubocop")
-- Vim
local vint = require("efmls-configs.linters.vint")

local efmls = require("efmls-configs")

efmls.setup({
	bash = {
		linter = shellcheck,
		formatter = shfmt,
	},
	c = {
		linter = cpplint,
		formatter = uncrustify,
	},
	csharp = {
		linter = mcs,
		formatter = uncrustify,
	},
	cpp = {
		linter = cpplint,
		formatter = uncrustify,
	},
	css = {
		linter = stylelint,
		formatter = prettier,
	},
	dockerfile = {
		linter = hadolint,
		formatter = goimports,
	},
	go = {
		linter = golangci,
		formatter = goimports,
	},
	graphql = {
		linter = eslint,
		formatter = prettier,
	},
	html = {
		linter = prettier,
		formatter = write_good,
	},
	java = {
		formatter = uncrustify,
	},
	javascript = {
		linter = xo,
		formatter = xo_fmt,
	},
	json = {
		linter = eslint,
		formatter = prettier,
	},
	json5 = {
		linter = eslint,
	},
	jsonc = {
		linter = eslint,
	},
	lua = {
		-- linter = luacheck,
		formatter = stylua,
	},
	markdown = {
		linter = write_good,
		formatter = prettier,
	},
	php = {
		linter = phpcs,
		formatter = phpcbf,
	},
	python = {
		linter = flake8,
		formatter = black,
	},
	ruby = {
		linter = rubocop,
		formatter = prettier,
	},
    rust = {
        {formatCommand = "rustfmt", formatStdin = true }
    },
	sass = {
		linter = stylelint,
	},
	scss = {
		linter = stylelint,
		formatter = prettier,
	},
	stylus = {
		linter = stylelint,
	},
	typescript = {
		linter = eslint,
		formatter = prettier,
	},
	vim = {
		linter = vint,
	},
	vue = {
		formatter = prettier,
	},
	xhtml = {
		linter = write_good,
	},
	yaml = {
		formatter = prettier,
	},
})
