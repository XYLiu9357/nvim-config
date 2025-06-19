return {
  "mfussenegger/nvim-jdtls",
  ft = { "java" },
  config = function()
    local jdtls = require('jdtls')
    local config = {
      cmd = { vim.fn.expand("~/.local/share/nvim/mason/bin/jdtls") },
      root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw', 'pom.xml' }, { upward = true })[1]),
    }
    jdtls.start_or_attach(config)
  end
}
