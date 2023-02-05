local keymap = vim.keymap

local Terminal = require('toggleterm.terminal').Terminal

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

-- Do not yank with x
keymap.set("n", "x", '"_x')

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

--Delete a word backwards and duplicate line
keymap.set("n", "dw", 'vb"_d')
keymap.set("n", 'dl', ":t.<CR>")

--New tab:
keymap.set("n", "te", ":tabedit<Return>", { silent = true })

--Split window
keymap.set("n", "ss", ":split<Return><C-w>w", { silent = true })
keymap.set("n", "sv", ":vsplit<Return><C-w>w", { silent = true })

-- Move window
keymap.set("n", "<Space>", "<C-w>w")
keymap.set("", "sh", "<C-w>h")
keymap.set("", "sk", "<C-w>k")
keymap.set("", "sj", "<C-w>j")
keymap.set("", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

--Buffer line
keymap.set("n", "<C-h>", ":BufferPrevious<CR>", { silent = true })
keymap.set("n", "<C-l>", ":BufferNext<CR>", { silent = true })
keymap.set("n", "<C-C>", ":BufferClose<CR>", { silent = true })

--exit
keymap.set("i", "jk", "<esc>", { silent = true })

--formatting's
keymap.set("", "<leader>f>", ":lua vim.lsp.buf.formatting()<CR>")

keymap.set("", 'df', ":DashboardNewFile<CR>", { silent = true })

--Toggle term
keymap.set("n", "<F1>", toggle_lazygit, { silent = true })
keymap.set("n", "<F2>", toggle_maven, { silent = true })
keymap.set("n", "<F3>", toggle_spring, { silent = true })

--Bracey Live Server
keymap.set("n", "<F4>", ":Bracey<cr>", { silent = true })
keymap.set("n", "<F5>", ":BraceyReload<cr>", { silent = true })
keymap.set("n", "<F6>", ":BraceyStop<cr>", { silent = true })

keymap.set("n", "el", ":q<cr>", {silent = true})
keymap.set("n", "gh", ":w<cr>", {silent = true})


