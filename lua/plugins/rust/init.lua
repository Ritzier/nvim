local present1, module1 = pcall(require, "rust-tool") 
local present2, module2 = pcall(require, "dap-insatll")

if present1 and present2 then
  local dbg_path = require("dap-install.config.settings").options["installation_path"] .. "codelldb/"
  local codelldb_path = dbg_path .. "extension/adapter/codelldb"
  local liblldb_path = dbg_path .. "extension/lldb/lib/liblldb.so"
  local opts = {
    dap = {
      adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
    },
  }
  require("rust-tools").setup { opts }
end
