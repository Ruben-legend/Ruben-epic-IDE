local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting

local sources = {
	null_ls.builtins.formatting.stylua,
  null_ls.builtins.formatting.clang_format,
	null_ls.builtins.diagnostics.eslint,
	null_ls.builtins.completion.spell,
}

null_ls.setup({
  debug = false,
	sources = sources,
})
