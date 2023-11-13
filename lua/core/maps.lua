local opts = { silent = true }
local keymap = vim.keymap.set

--Delete a word backwards and duplicate an line
      keymap("n", "dw", 'vb"_d')
keymap("n", "dl", ':t.<CR>')

--split window
keymap("n", "ss", ":split<Return><C-w>w", opts)
keymap("n", "sv", ":vsplit<Return><C-w>w", opts)

--Exit, save and quit
keymap("i", "jk", '<esc>', opts)
keymap("n", "gh", ':w<CR>', opts)
keymap("n", "el", ':q<CR>', opts)

--Move window
keymap("n", "<Space>", "<C-w>w")
keymap("n", "sh", "<C-w>h")
keymap("n", "sk", "<C-w>k")
keymap("n", "sj", "<C-w>j")
keymap("n", "sl", "<C-w>l")

--lsp saga
keymap('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<cr>', opts)
keymap('n', 'K', '<Cmd>Lspsaga hover_doc<cr>', opts)
keymap('n', '<C-k>', '<Cmd>Lspsaga signature_help<cr>', opts)
keymap('n', 'ld', '<Cmd>Lspsaga show_line_diagnostics<cr>', opts)
keymap('n', 'gf', '<Cmd>Lspsaga finder<cr>', opts)
keymap('n', 'ca', '<Cmd>Lspsaga code_action<cr>', opts)
keymap('n', 'gp', '<Cmd>Lspsaga preview_definition<cr>', opts)
keymap('n', 'rn', '<Cmd>Lspsaga rename<cr>', opts)
keymap('n', 'go', '<Cmd>Lspsaga goto_definition<cr>')
keymap('n', '<A-d>', '<Cmd>Lspsaga term_toggle<cr>')
keymap('n', 'ol', '<Cmd>Lspsaga outline<cr>')
