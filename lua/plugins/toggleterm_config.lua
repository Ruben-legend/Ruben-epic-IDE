return {
  'akinsho/toggleterm.nvim',
  config = function()
    local Terminal = require('toggleterm.terminal').Terminal

    local opts = { silent = true }
    local keymap = vim.keymap.set


    local toggle_lazygit = function()
      local lazygit = Terminal:new({ cmd = 'lazygit', direction = 'float' })
      return lazygit:toggle()
    end

    keymap("n", "<F1>", toggle_lazygit, opts)
  end
}
