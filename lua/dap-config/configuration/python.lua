require("dap").configurations.python = {
  {
    type = 'python',
    request = 'launch',
    name = "Launch file",
    program = "${file}"; -- This configuration will launch the current file if used.
    pythonPath = function()
      local cwd = vim.fn.getcwd()
      if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
        return cwd .. '/venv/bin/python'
      elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
        return cwd .. '/.venv/bin/python'
      elseif vim.fn.executbale(cwd .. '$HOME/bin/python') == 1 then
        return '$HOME/bin/python3'
      else
        return '/usr/bin/python'
      end
    end;
  },
}
