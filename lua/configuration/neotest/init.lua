local function config_test()
	vim.api.nvim_exec(
		[[
        " Test config
        let test#strategy = "neovim"
        let test#neovim#term_position = "belowright"
        let g:test#preserve_screen = 1

        " Python
        let test#python#runner = 'pyunit'
        " let test#python#runner = 'pytest'

        " Javascript
        let test#javascript#reactscripts#options = "--watchAll=false"
        let g:test#javascript#runner = 'jest'
        let g:test#javascript#cypress#executable = 'npx cypress run-ct'

        " csharp
        let test#csharp#runner = 'dotnettest'
    ]],
		false
	)
end

local function javascript_runner()
	local runners = { "cypress", "jest" }
	vim.ui.select(runners, { prompt = "Choose Javascript Runner" }, function(selected)
		if selected then
			vim.g["test#javascript#runner"] = selected
			require("utils").info("Test runner changed to " .. selected, "Test Runner")
		end
	end)
end

require("neotest").setup({
	adapters = {
		require("neotest-python")({
			dap = { justMyCode = false },
			runner = "unittest",
		}),
		require("neotest-jest"),
		require("neotest-go"),
		require("neotest-plenary"),
		require("neotest-vim-test")({
			ignore_file_types = { "python", "vim", "lua" },
		}),
		require("neotest-rust"),
		require("neotest-dart") {
			command = "flutter",
		},
		require("neotest-dotnet"),
		require("neotest-scala")({
			runner = "bloop"
		})
	},
	-- overseer.nvim
	consumers = {
		overseer = require("neotest.consumers.overseer"),
		always_open_output = function(client)
			local async = require("neotest.async")

			client.listeners.results = function(adapter_id, results)
				local file_path = async.fn.expand("%:p")
				local row = async.fn.getpos(".")[2] - 1
				local position = client:get_nearest(file_path, row, {})
				if not position then
					return
				end
				local pos_id = position:data().id
				if not results[pos_id] then
					return
				end
				neotest.output.open({ position_id = pos_id, adapter = adapter_id })
			end
		end,
	},
	overseer = {
		enabled = true,
		force_default = true,
	},
	output = {
		enabled = true,
		open_on_run = true,
	},
})

-- vim-test
config_test()
