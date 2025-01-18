local map = vim.keymap.set

-- normal mode
map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<leader>sv", "<C-w>v")
map("n", "<leader>sh", "<C-w>h")
map("n", "<leader>nh", "nohl<CR>")
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- insert mode
map("i", "jk", "<ESC>")

-- visual mode
map("v", "J", "<cmd>m '>+1<CR>gv=gv")
map("v", "K", "<cmd>m '<-2<CR>gv=gv")

-- theme switcher
map("n", "<leader>th", function()
	require("nvchad.themes").open { style = "compact", border = false }
end, { desc = "nvchad theme switcher" })

-- telescope
local builtin = require("telescope.builtin")
map("n", "<C-p>", builtin.find_files, { desc = "telescope: find files" })
map("n", "<leader>lg", builtin.live_grep, {})

-- nvimtree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })

-- lsp
map("n", "K", vim.lsp.buf.hover, {})

-- toggle lsp diagnostics info
local isLspDiagnosticsVisible = true
map("n", "<leader>lx", function()
    isLspDiagnosticsVisible = not isLspDiagnosticsVisible
    vim.diagnostic.config({
        virtual_text = isLspDiagnosticsVisible,
        underline = isLspDiagnosticsVisible
    })
end)

