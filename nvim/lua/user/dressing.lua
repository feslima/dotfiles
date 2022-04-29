local status_ok, dressing = pcall(require, "dressing")
if not status_ok then
  vim.notify("Couldn't load 'dressing' plugin!")
  return
end

dressing.setup()
