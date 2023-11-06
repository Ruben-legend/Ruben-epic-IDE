return {
  "mfussenegger/nvim-jdtls",
  dependencies = {
    "mason-org/mason-registry"
  },
  event = "BufRead",
  config = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.ts = 4
    vim.opt_local.expandtab = true

    local config = {
      cmd = { "/home/ruben-epic/.local/share/nvim/mason/bin/jdtls" },
      root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
    }

    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      pattern = { "*.java"},
      callback = function()
        local _, _ = pcall(vim.lsp.codelens.refresh)
      end,
    })

    require('jdtls').start_or_attach(config)

    vim.cmd(
      [[command! -buffer -nargs=? -complete=custom,v:lua.require'jdtls'._complete_set_runtime JdtSetRuntime lua require('jdtls').set_runtime(<f-args>)]]
    )
  end
}
