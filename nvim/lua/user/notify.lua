local status_ok, notify = pcall(require, "notify")
if not status_ok then
  vim.notify("Couldn't load 'notify' plugin!")
  return
end

notify.setup({})

vim.notify = notify
