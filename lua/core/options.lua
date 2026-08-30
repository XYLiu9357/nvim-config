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
o.autoread = true -- reload files changed outside of neovim
o.linebreak = true
vim.opt.whichwrap:append("<>[]hl")

-- diagnostics visibility
vim.diagnostic.config({
  virtual_text = false,
  underline = false,
})

-- auto-reload buffers when the underlying file changes on disk.
-- checks on focus / buffer / window enter and when the terminal regains focus.
local autoread_group = vim.api.nvim_create_augroup("AutoReadCheck", { clear = true })
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "WinEnter", "CursorHold", "TermClose", "TermLeave" }, {
  group = autoread_group,
  callback = function()
    if vim.fn.mode() ~= "c" and vim.fn.getcmdwintype() == "" then
      vim.cmd("checktime")
    end
  end,
})

-- notify when a file was reloaded from disk
vim.api.nvim_create_autocmd("FileChangedShellPost", {
  group = autoread_group,
  callback = function()
    vim.notify("File changed on disk. Buffer reloaded.", vim.log.levels.WARN)
  end,
})
