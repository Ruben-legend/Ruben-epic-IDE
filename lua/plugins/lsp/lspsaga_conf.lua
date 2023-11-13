return {
  'nvimdev/lspsaga.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',     -- optional
    'nvim-tree/nvim-web-devicons'          -- optional
  },
  config = function()
    require('lspsaga').setup({
      ui = {
        code_action = ""
      },
      diagnostic = {
        show_code_action = true,
      },
      outline = {
        win_width = 50,
      }
    })
  end,
}
