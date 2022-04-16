local status_ok, dapui = pcall(require, "dapui")
if not status_ok then
  vim.notify("Couldn't load 'dapui' for 'dap' plugin!")
  return
end

dapui.setup({
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  sidebar = {
    -- You can change the order of elements in the sidebar
    elements = {
      -- Provide as ID strings or tables with "id" and "size" keys
      {
        id = "scopes",
        size = 0.25, -- Can be float or integer > 1
      },
      { id = "breakpoints", size = 0.25 },
      { id = "stacks", size = 0.25 },
      { id = "watches", size = 00.25 },
    },
    size = 40,
    position = "right", -- Can be "left", "right", "top", "bottom"
  },
  tray = {
    elements = { "repl" },
    size = 10,
    position = "bottom", -- Can be "left", "right", "top", "bottom"
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = "single", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
})

function debugger_toggle(args)
  dapui.toggle()
end

function debugger_open(args)
  dapui.open()
end

function debugger_close(args)
  dapui.close()
end

vim.api.nvim_create_user_command("DebuggerToggle", debugger_toggle, { desc = "Toggle debugger UI" })
vim.api.nvim_create_user_command("DebuggerOpen", debugger_open, { desc = "Open debugger UI" })
vim.api.nvim_create_user_command("DebuggerClose", debugger_close, { desc = "Close debugger UI" })
