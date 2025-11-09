local map = vim.keymap.set

-- normal mode
map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<leader>sv", "<C-w>v", { noremap = true, desc = "Split window vertically" })
map("n", "<leader>sh", "<C-w>h", { desc = "Split window horizontally" })
map("n", "<leader>nh", "<cmd>noh<CR>", { desc = "Clear highlights" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- insert mode

-- visual mode
map("v", "J", "<cmd>m '>+1<CR>gv=gv", { noremap = true })
map("v", "K", "<cmd>m '<-2<CR>gv=gv", { noremap = true })

-- theme switcher
map("n", "<leader>th", function()
  require("nvchad.themes").open({ style = "compact", border = false })
end, { noremap = true, desc = "nvchad theme switcher" })

-- telescope
local builtin = require("telescope.builtin")
map("n", "<C-p>", builtin.find_files, { desc = "telescope: find files" })
map("n", "<leader>lg", builtin.live_grep, {})

-- nvimtree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })

-- lsp
map("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "<A-S-F>", vim.lsp.buf.format, { noremap = true, desc = "Format buffer using LSP" })
vim.api.nvim_set_keymap("n", "gd", vim.lsp.buf.definition(), { noremap = true, silent = true })

-- toggle lsp diagnostics info: off by default, see options.lua
local isLspDiagnosticsVisible = false
map("n", "<leader>dg", function()
  isLspDiagnosticsVisible = not isLspDiagnosticsVisible
  vim.diagnostic.config({
    virtual_text = isLspDiagnosticsVisible,
    underline = isLspDiagnosticsVisible,
  })
end)

-- -- github copilot toggle
-- -- Enable copilot by default
-- local copilot_on = false
-- vim.cmd("Copilot disable")
-- 
-- -- Disable copilot by default
-- -- local copilot_on = false
-- -- vim.cmd("Copilot disable")
-- 
-- vim.api.nvim_create_user_command("CopilotToggle", function()
--   if copilot_on then
--     vim.cmd("Copilot disable")
--     print("Copilot OFF")
--   else
--     vim.cmd("Copilot enable")
--     print("Copilot ON")
--   end
--   copilot_on = not copilot_on
-- end, { nargs = 0 })
-- vim.keymap.set("n", "<leader>gc", ":CopilotToggle<CR>", { noremap = true, silent = true })
