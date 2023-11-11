return {
  'akinsho/toggleterm.nvim',
  config = function()
    local Terminal = require('toggleterm.terminal').Terminal
    local term = require('toggleterm')

    term.setup{
      size = 13,
      open_mapping = [[<c-\>]],
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = '1',
      start_in_insert = true,
      persist_size = true,
      direction = 'horizontal'
    }

    local opts = { silent = true }
    local keymap = vim.keymap.set

    local toggle_lazygit = function()
      local lazygit = Terminal:new({ cmd = 'lazygit', direction = 'float' })
      return lazygit:toggle()
    end

    local toggle_gradle_spring = function()
      local gradle_run = Terminal:new({ cmd = 'gradle bootrun', direction = 'float', hidden = false })
      return gradle_run:toggle()
    end

    keymap("n", "<F1>", toggle_lazygit, opts)
    keymap("n", "<F5>", toggle_gradle_spring, opts)
  end
}
