-- mason lsp config: more LSP servers are supported
return {
  {
    "williamboman/mason.nvim",
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "dockerls",
        "gopls",
        "jdtls",
        "lua_ls",
        "pyright",
        "rust_analyzer",
        "texlab",
        -- "matlab_ls",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities() -- cmp-nvim-lsp support

      -- lua lsp setup
      lspconfig.lua_ls.setup({ capabilities = capabilities })

      -- c++ lsp setup
      lspconfig.clangd.setup({
        capabilities = capabilities,
        cmd = {
          "clangd",
          "--fallback-style=llvm", -- LLVM for 2 space indent, webkit for 4
          "--clang-tidy",
          "--completion-style=detailed",
          "--header-insertion=never",
        },
      })

      -- docker lsp setup
      lspconfig.dockerls.setup({
        capabilities = capabilities,
        filetypes = { "dockerfile" },
      })

      -- golang lsp setup
      lspconfig.gopls.setup({
        capabilities = capabilities,
        settings = {
          gopls = {
            analyses = {
              unusedparams = true,
              shadow = true,
            },
            staticcheck = true,
            usePlaceholders = true,
            completeUnimported = true,
          },
        },
      })

      -- java lsp setup
      -- more setup work is needed, see java.lua
      lspconfig.jdtls.setup({
        capabilities=capabilities,
      })

      -- python lsp setup
      lspconfig.pyright.setup({
        capabilities = capabilities,
      })

      -- -- matlab lsp setup
      -- lspconfig.matlab_ls.setup({
      --   capabilities = capabilities,
      --   settings = {
      --     filetypes = { "matlab" },
      --     matlab = {
      --       installPath = "/mnt/d/Program Files/MATLAB/R2024b",
      --     },
      --     single_file_support = true,
      --   },
      -- })

      -- latex lsp setup
      lspconfig.texlab.setup({
        capabilities = capabilities,
        settings = {
          texlab = {
            auxDirectory = ".",
            bibtexFormatter = "/mnt/d/texlive/2023/bin/windows/texlab.exe",
            build = {
              args = { "--lualatex", "--synctex", "--interaction=nonstopmode", "--shell-escape", "%f" },
              executable = "latexmk",
              forwardSearchAfter = false,
              onSave = true,
            },
            chktex = {
              onEdit = false,
              onOpenAndSave = true,
            },
            diagnosticsDelay = 300,
            formatterLineLength = 80,
            forwardSearch = {
              args = {},
              executable = "/mnt/c/Users/flotc/AppData/Local/SumatraPDF.exe",
              onSave = true,
            },
            latexFormatter = "/mnt/d/texlive/2023/bin/windows/latexindent.exe",
            latexindent = {
              modifyLineBreaks = false,
            },
          },
        },
      })

      -- end of config
    end,
  },
}
