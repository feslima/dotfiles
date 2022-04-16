local M = {
  python = {
    {
      type = 'python',
      request = 'launch',
      name = 'Launch current file',

      program = "${file}",
      pythonPath = function()
        local cwd = vim.fn.getcwd()
        if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
          return cwd .. '/venv/bin/python'
        elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
          return cwd .. '/.venv/bin/python'
        else
          return vim.g.python3_host_prog
        end
      end
    },
  }
}

return M
