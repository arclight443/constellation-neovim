local theme = "gruvbox-flat"

vim.g.gruvbox_transparent = true

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. theme)

if not status_ok then
  return end

