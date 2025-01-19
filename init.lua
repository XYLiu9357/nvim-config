vim.g.mapleader = " "

-- base46: put this before lazy setup
vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46_cache/"

require("configs.lazy")

-- base46: caching, put this after lazy setup
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")
dofile(vim.g.base46_cache .. "syntax")
dofile(vim.g.base46_cache .. "treesitter")

require("core.options")
require("core.mappings")
