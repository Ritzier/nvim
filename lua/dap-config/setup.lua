local dap = require("dap")
local path = require("dap-config.path")
--------------- ADAPTER ----------------------------

dap.adapters.lldb = {
  type = "executable",
  command = path.codelldb,
  name = "codelldb",
}

dap.adapters.codelldb = {
  type = 'server',
  port = "${port}",
  executable = {
    command = path.codelldb,
    args = { "--port", "${port}" },
  }
}

dap.adapters.nlua = function(callback, config)
  callback({
    type = "server",
    host = config.host,
    port = config.port,
  })
end

dap.adapters.sh = {
  type = "executable",
  command = path.BASH_DEBUGGER
}

----------------------------------------------------------------------------

local nlua = {
  type = "nlua",
  request = "attach",
  name = "Attach to running Neovim instance",
  host = function()
    local value = vim.fn.input("Host [127.0.0.1]: ")
    if value ~= "" then
      return value
    end
    return "127.0.0.1"
  end,
  port = function()
    local val = tonumber(vim.fn.input("Port: "))
    assert(val, "Please provide a port number")
    return val
  end,
}

local lldb = {
  name = "Launch lldb",
  type = "lldb",
  request = "launch",
  program = function()
    return vim.fn.input(
      "Path to executable: ",
      vim.fn.getcwd() .. "/",
      "file"
    )
  end,
  cwd = "${workspaceFolder}",
  stopOnEntry = false,
  args = {},
  runInTerminal = false,
}

local codelldb = {
  name = "Launch CodeLLDB",
  type = "codelldb",
  request = "launch",
  program = function()
    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
  end,
  cwd = '${workspaceFolder}',
  stopOnEntry = true,

}

local tauri_dev = {
  type = "lldb",
  request = "launch",
  name = "Tauri Development Debug",
  args = {
    "cargo",
    "build",
    "--manifest-path=./src-tauri/Cargo.toml",
    "--no-default-features",
  },
  -- task for the `beforeDevCommand` if used, must be configured in `.vscode/tasks.json`
  -- preLaunchTask = "ui:dev"
}

local tauri_prod = {
  type = "lldb",
  request = "launch",
  name = "Tauri Production Debug",
  args = {
    "cargo",
    "build",
    "--release",
    "--manifest-path=./src-tauri/Cargo.toml",
  },
  -- // task for the `beforeBuildCommand` if used, must be configured in `.vscode/tasks.json`
  -- "preLaunchTask": "ui:build"
}

local sh = {
  {
    name = "Launch Bash debugger",
    type = "sh",
    request = "launch",
    program = "${file}",
    cwd = "${fileDirname}",
    pathBashdb = path.BASHDB,
    pathBashdbLib = path.BASHDB_DIR,
    pathBash = "bash",
    pathCat = "cat",
    pathMkfifo = "mkfifo",
    pathPkill = "pkill",
    env = {},
    args = {},
    -- showDebugOutput = true,
    -- trace = true,
  }
}


-------- Configuration -----------------------------------------------------

dap.configurations.rust = {
  lldb,
  codelldb,
  tauri_dev,
  tauri_prod,
}

dap.configurations.lua = {
  nlua,
}

dap.configurations.sh = {
  sh,
}

vim.api.nvim_create_autocmd("FileType", {
  pattern = "dap-repl",
  callback = function()
    require("dap.ext.autocompl").attach()
  end,
})
