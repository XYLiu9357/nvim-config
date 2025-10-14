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
        -- "gopls",
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
      -- Create a compatibility layer to use new vim.lsp.config API with old syntax
      local lspconfig = setmetatable({}, {
        __index = function(_, server)
          return {
            setup = function(config)
              vim.lsp.config[server] = config
            end
          }
        end
      })
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

      -- -- golang lsp setup
      -- lspconfig.gopls.setup({
      --   capabilities = capabilities,
      --   settings = {
      --     gopls = {
      --       analyses = {
      --         unusedparams = true,
      --         shadow = true,
      --       },
      --       staticcheck = true,
      --       usePlaceholders = true,
      --       completeUnimported = true,
      --     },
      --   },
      -- })

      -- java lsp setup
      -- more setup work is needed, see java.lua
      lspconfig.jdtls.setup({
        capabilities = capabilities,
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
        settings = {
          texlab = {
            auxDirectory = ".",
            bibtexFormatter = "texlab",

            chktex = {
              onEdit = false,
              onOpenAndSave = true,
            },

            diagnosticsDelay = 300,
            formatterLineLength = 80,

            latexFormatter = "latexindent",
            latexindent = {
              executable = "cmd.exe",
              args = {
                "/C",
                [[D:\texlive\2023\bin\windows\latexindent.exe]],
              },
              modifyLineBreaks = true, -- enable so that .latexindent.yaml settings apply
            },

            forwardSearch = {
              executable = "cmd.exe",
              args = {
                "/C",
                [[
                C:\Users\flotc\AppData\Local\SumatraPDF.exe
                -reuse-instance
                "%p.pdf"
                -forward-search "%f" %l
                ]]
              },
            },
          },
        },
      })
    -- end of config
    end,
  },
}
