require("dap").configurations.kotlin = {
  {
    type = "kotlin",
    name = "launch - kotlin",
    request = "launch",
    projectRoot = vim.fn.getcwd() .. "/app",
    mainClass = function()
      -- return vim.fn.input("Path to main class > ", "myapp.sample.app.AppKt", "file")
      return vim.fn.input("Path to main class > ", "", "file")
    end,
  }
}
