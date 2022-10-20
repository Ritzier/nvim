require("dap").adapters.codelldb = {
  type = "server",
  port = "${port}",
  executable = {
    command = CODELLDB_PATH,
    args = { "--port", "${port}" },
    detached = false,
  }
}
