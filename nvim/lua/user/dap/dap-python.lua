local status_ok, dap_python = pcall(require, "dap-python")
if not status_ok then
  vim.notify("Couldn't load the 'dap-python' plugin!", "error")
  return
end

dap_python.setup(vim.g.python3_host_prog)
