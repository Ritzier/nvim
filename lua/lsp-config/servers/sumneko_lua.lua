local M = {}

-- function M.setup(on_attach, capabilities)
--     -- local runtime_path = vim.split(package.path, ';')
--     -- table.insert(runtime_path, 'lua/?.lua')
--     -- table.insert(runtime_path, 'lua/?/init.lua')
--     require("lua-dev").setup({
--         library = {
--             enabled = true,
--             runtime = true,
--             types = true,
--             plugins = true,
--         },
--         setup_jsonls = true,
--     })
--
--     require("lspconfig")["sumneko_lua"].setup({
--         on_attach = on_attach,
--         capabilities = capabilities,
--         settings = {
--             Lua = {
--                 diagnostics = {
--                     disable = { "lowercase-global", "undefined-global", "unused-local", "unused-vararg", "trailing-space" },
--                     globals = { "vim", "packer_plugins" }
--                 },
--                 workspace = {
--                     maxPreload = 3000,
--                     preloadFileSize = 50000,
--                 },
--                 telemetry = {
--                     enable = false
--                 },
--                 completion = {
--                     callSnippet = "Replace"
--                 },
--                 hint = {
--                     enable = true,
--                     setType = true,
--                 },
--                 runtime = {
--                     path = { "lua/?.lua", "lua/?/init.lua" },
--                     version = "LuaJIT",
--                 }
--             },
--         },
--     })
-- end

function M.setup_1(on_attach, capabilities)
	local function custome_attach(client, bufnr)
		on_attach(client, bufnr)
	end

	local luadev = require("lua-dev").setup {}
	local lspconfig = vim.tbl_deep_extend("force", luadev, {
		on_attach = custome_attach,
		capabilities = capabilities,
		settings = {
			Lua = {
				diagnostics = {
					disable = { "lowercase-global", "undefined-global", "unused-local", "unused-vararg", "trailing-space" },
					globals = { "vim", "packer_plugins" }
				},
				workspace = {
					library = vim.api.nvim_get_runtime_file('', true),
					checkThirdParty = false, -- THIS IS THE IMPORTANT LINE TO ADD
					maxPreload = 3000,
					preloadFileSize = 50000,
				},
				telemetry = {
					enable = false
				},
				completion = {
					callSnippet = "Replace"
				},
				hint = {
					enable = true,
					setType = true,
				},
				runtime = {
					path = { "lua/?.lua", "lua/?/init.lua" },
					version = "LuaJIT",
				}
			},
		},
	})
	require("lspconfig").sumneko_lua.setup(lspconfig)
end

function M.basic_setup(on_attach, capabilities)
	require("lspconfig")["sumneko_lua"].setup({
		on_attach = on_attach,
		capabilities = capabilities,
		settings = {
			Lua = {
				diagnostics = { globals = { "vim", "packer_plugins" } },
				workspace = {
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
					},
					maxPreload = 100000,
					preloadFileSize = 10000,
				},
				telemetry = { enable = false },
			},
		},
	})
end

function M.setup(on_attach, capabilities)
  local function custom_attach(client, bufnr)
    require("lsp-config.servers.on_attach").on_attach(client, bufnr)
    require("inlay-hints").on_attach(client, bufnr)
  end

	local luadev = require("lua-dev").setup {}
	local lspconfig = vim.tbl_deep_extend("force", luadev, {
    on_attach = custom_attach,
		capabilities = capabilities,
		settings = {
			Lua = {
				diagnostics = {
					disable = { "lowercase-global", "undefined-global", "unused-local", "unused-vararg", "trailing-space" },
					globals = { "vim", "packer_plugins" }
				},
				workspace = {
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
						plugins = { "neotest" },
						types = true,
					},
					checkThirdParty = false, -- THIS IS THE IMPORTANT LINE TO ADD
					maxPreload = 100000,
					preloadFileSize = 10000,
				},
				telemetry = {
					enable = false
				},
				completion = {
					callSnippet = "Replace"
				},
				hint = {
					enable = true,
					setType = true,
				},
				runtime = {
					path = { "lua/?.lua", "lua/?/init.lua" },
					version = "LuaJIT",
				}
			},
		},
	})
	require("lspconfig").sumneko_lua.setup(lspconfig)
end

return M
