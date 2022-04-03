local colorscheme = "darkplus"

-- Check if the theme defined in colorscheme can be loaded, if not notify that the scheme is missing
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
