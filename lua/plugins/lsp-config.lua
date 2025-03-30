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
        -- "dockerls",
        "lua_ls",
        "pyright",
        "ruff",
        "texlab",
        "matlab_ls",
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
      -- lspconfig.dockerls.setup{}

      -- python lsp setup: pyright for hover and ruff for linting and formatting
      lspconfig.pyright.setup({
        capabilities = capabilities,
        settings = {
          pyright = {
            -- using ruff's import organizer
            disableOrganizeImports = true,
          },
          python = {
            analysis = {
              -- ignore all files for analysis to exclusively use Ruff for linting
              ignore = { "*" },
            },
          },
        },
      })

      lspconfig.ruff.setup({
        capabilities = capabilities,
        init_options = {
          settings = {
            -- Ruff language server settings go here
            logLevel = "error",
          },
          lint = {
            enable = true,
            args = "--fix --select I", -- fix all fixable errors and sort imports
            run = "onSave",      -- onType = every keystroke, or onSave
          },
        },
      })

      -- disable ruff hover in favor of pyright
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("lsp_attach_disable_ruff_hover", { clear = true }),
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client == nil then
            return
          end
          if client.name == "ruff" then
            client.server_capabilities.hoverProvider = false
          end
        end,
        desc = "LSP: Disable hover capability from Ruff",
      })

      -- matlab lsp setup
      lspconfig.matlab_ls.setup({
        capabilities = capabilities,
        settings = {
          filetypes = { "matlab" },
          matlab = {
            installPath = "/mnt/d/Program Files/MATLAB/R2024b",
          },
          single_file_support = true,
        },
      })

      -- latex lsp setup
      lspconfig.texlab.setup({
        capabilities = capabilities,
        settings = {
          texlab = {
            auxDirectory = ".",
            bibtexFormatter = "texlab",
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
              executable = "sumatraPDF",
              onSave = true,
            },
            latexFormatter = "latexindent",
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
