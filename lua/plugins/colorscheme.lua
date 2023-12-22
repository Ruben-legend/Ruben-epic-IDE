return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	priority = 1000,
	config = function()
		local cat = require("catppuccin")

		cat.setup({
			flavour = "frappe", -- latte, frappe, macchiato, mocha
			transparent_background = false,
			background = { -- :h background
				light = "latte",
				dark = "mocha",
			},
		})

		vim.cmd([[colorscheme catppuccin]])
	end,
}
