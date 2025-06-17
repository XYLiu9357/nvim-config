-- The file `lua/chadrc.lua` is user's config file used to customize Base46 & UI
-- plugin and it needs to return a table,

local M = {}

M.base46 = {
  theme = "vscode_light",
  transparency = false,
}

M.ui = {
  statusline = { theme = "default" },
}

return M
