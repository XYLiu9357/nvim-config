return {
  "mfussenegger/nvim-jdtls",
  ft = { "java" },
  config = function()
    local jdtls = require('jdtls')
    local config = {
      cmd = { "~/.local/share/nvim/mason/bin/jdtls" }, -- Replace with actual path
      root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw', 'pom.xml' }, { upward = true })[1]),
    }
    jdtls.start_or_attach(config)
  end
}
