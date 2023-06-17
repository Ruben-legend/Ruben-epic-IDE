local opts = { silent = true}
local keymap = vim.keymap.set

--local Terminal = require('toggleterm.terminal').Terminal

local toggle_lazygit = function()
  local lazygit = Terminal:new({ cmd = 'lazygit', direction = 'float' })
  return lazygit:toggle()
end

local toggle_maven = function()
  local mvn = Terminal:new({ cmd = 'mvn exec:java', direction = 'float' })
  return mvn:toggle()
end

local toggle_spring = function()
  local spring = Terminal:new({ cmd = 'mvn spring-boot:run', direction = 'float' })
  return spring:toggle()
end

--Delete a word backwards and duplicate an line
keymap("n", "dw", 'vb"_d')
keymap("n", "dl", ':t.<CR>')

--split window
keymap("n", "ss", ":split<Return><C-w>w", opts)
keymap("n", "sv", ":vsplit<Return><C-w>w", opts)

--Exit, save and quit
keymap("i", "jk", '<esc>', opts)
keymap("n", "gh", ':w<CR>', opts)
keymap("n", "el", ':q<CR>' , opts)

--Move window
keymap("n", "<Space>", "<C-w>w")
keymap("n", "sh", "<C-w>h")
keymap("n", "sk", "<C-w>k")
keymap("n", "sj", "<C-w>j")
keymap("n", "sl", "<C-w>l")

--Toggle term

keymap("n", "<F1>", toggle_lazygit, { silent = true })
keymap("n", "<F2>", toggle_maven, { silent = true })
keymap("n", "<F3>", toggle_spring, { silent = true })

--Bracey Live Server
keymap("n", "<F4>", ":Bracey<cr>", { silent = true })
keymap("n", "<F5>", ":BraceyReload<cr>", { silent = true })
keymap("n", "<F6>", ":BraceyStop<cr>", { silent = true })
