local o = vim.o

-- visual
o.cursorline = true
o.cursorlineopt = "both"
o.termguicolors = true
o.signcolumn = "yes"
o.splitbelow = true
o.splitright = true

-- indentation
o.expandtab = true
o.shiftwidth = 2
o.smartindent = true
o.tabstop = 2
o.softtabstop = 2

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
o.linebreak = true
vim.opt.whichwrap:append("<>[]hl")

-- diagnostics visibility
vim.diagnostic.config({
  virtual_text = false,
  underline = false,
})
