return{
  "catppuccin/nvim", 
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  config = function()   
    local cat = require("catppuccin")

    cat.setup({
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      background = { -- :h background
        light = "latte",
        dark = "mocha",
      },
      transparent_background = true,
    })

    vim.cmd([[colorscheme catppuccin]])
  end,
}
