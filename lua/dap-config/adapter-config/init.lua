local path = require("dap-config.path")
local netcoredbg = path.netcoredbg
local codelldb = path.codelldb
local kotin = path.kotlin_adapter
local lldb = path.lldb

require("dap-config.adapter-config.chrome")
require("dap-config.adapter-config.node")
require("dap-config.adapter-config.nlua")

require("dap-config.adapter-config.coreclr").setup(netcoredbg)
require("dap-config.adapter-config.codelldb").setup(codelldb)
require("dap-config.adapter-config.kotlin").setup(kotlin)

require("dap-config.adapter-config.go")
