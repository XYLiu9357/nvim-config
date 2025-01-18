local o = vim.o

-- visual
o.cursorline = true
o.cursorlineopt = "both"
o.termguicolors = true
o.signcolumn = "yes"
o.splitbelow = true
o.splitright = true

-- indentation
o.expandtab = false
o.shiftwidth = 4
o.smartindent = true
o.tabstop = 4
o.softtabstop = 4

-- line numbering
o.number = true
o.relativenumber = false -- set rnu / set nornu
o.numberwidth = 2

-- clipboard
o.clipboard = "unnamedplus"

-- searching
o.ignorecase = true
o.smartcase = true

-- miscellaneous
o.updatetime = 250
o.timeoutlen = 400
o.undofile = true

