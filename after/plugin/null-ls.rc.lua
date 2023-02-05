local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

local formatting = null_ls.builtins.formatting

local sources = {
  formatting.eslint,
  formatting.autopep8,
  formatting.stylua,
}
null_ls.setup({
  sources = {
    null_ls.builtins.diagnostics.eslint_d.with({
      diagnostics_format = '[eslint] #{m}\n(#{c})'
    }),
    null_ls.builtins.diagnostics.fish
  }
})
--[[null_ls.setup({
  sources = sources,

  on_attach = function(client)
    vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting()")
  end,
})]] ---
