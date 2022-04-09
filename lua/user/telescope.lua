local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  vim.notify("Couldn't load telescope plugin!")
  return
end

-- Load telescope extensions here
telescope.load_extension('media_files')

telescope.setup {
  defaults = {
    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },

    extensions = {
      media_files = {
        -- filetypes whitelist
        filetypes = {"png", "webp", "jpg", "jpeg"},
        find_cmd = "rg" -- find command (defaults to `fd`)
      }
    }
  }
}
