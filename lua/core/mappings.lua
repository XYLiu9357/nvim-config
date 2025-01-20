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

-- toggle lsp diagnostics info
local isLspDiagnosticsVisible = true
map("n", "<leader>dg", function()
  isLspDiagnosticsVisible = not isLspDiagnosticsVisible
  vim.diagnostic.config({
    virtual_text = isLspDiagnosticsVisible,
    underline = isLspDiagnosticsVisible,
  })
end)

-- github copilot
local is_copilot_enabled = true
map("n", "<leader>cc", function()
  vim.g.copilot_enabled = not vim.g.copilot_enabled
  if vim.g.copilot_enabled then
    vim.cmd("Copilot disable")
    print("Copilot OFF")
  else
    vim.cmd("Copilot enable")
    print("Copilot ON")
  end
end, { desc = "Toggle Github Copilot", noremap = true })
