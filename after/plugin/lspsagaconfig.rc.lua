local status, saga = pcall(require, "lspsaga")
if not status then
  return
end

saga.setup{
  server_filetype_map = {}
}

local opts = {noremap = true, silent = true}
local keymap = vim.keymap.set

keymap('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<cr>', opts)
keymap('n', 'K', '<Cmd>Lspsaga hover_doc<cr>', opts)
keymap('n', '<C-k>', '<Cmd>Lspsaga signature_help<cr>', opts)
keymap('n', 'ld', '<Cmd>Lspsaga show_line_diagnostics<cr>', opts)
keymap('n', 'gd', '<Cmd>Lspsaga lsp_finder<cr>', opts)
keymap('n', 'ca', '<Cmd>Lspsaga code_action<cr>', opts)
keymap('n', 'gp', '<Cmd>Lspsaga preview_definition<cr>', opts)
keymap('n', 'rn', '<Cmd>Lspsaga rename<cr>', opts)
