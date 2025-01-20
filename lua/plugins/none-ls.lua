-- none-ls config
return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        -- general
        -- null_ls.builtins.diagnostics.codespell,

        -- lua
        null_ls.builtins.formatting.stylua,

        -- c++
        -- c++ linting and formatting are handled by clangd
        -- null_ls.builtins.formatting.clang_format,

        -- python
        -- python linting and formatting are handled by ruff lsp

        -- javascript
        -- null_ls.builtins.diagnostics.eslint,
        -- null_ls.builtins.formatting.prettier,

        null_ls.builtins.completion.spell,
      },
    })
  end,
}
