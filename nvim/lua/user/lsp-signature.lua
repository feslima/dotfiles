local status_ok, lsp_signature = pcall(require, "lsp_signature")
if not status_ok then
  vim.notify("Couldn't load 'lsp_signature' plugin!")
  return
end

local configs = {
  floating_window_above_cur_line = true
}
lsp_signature.setup(configs)
