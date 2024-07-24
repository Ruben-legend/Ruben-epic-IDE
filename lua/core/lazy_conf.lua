local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ import = "plugins" },
	{ "LazyVim/LazyVim", import = "lazyvim.plugins" },
	{ "folke/flash.nvim", enabled = false },
	{
		"nvimdev/lspsaga.nvim",
		config = function()
			require("lspsaga").setup({
				ui = {
					code_action = "",
				},
				diagnostic = {
					show_code_action = true,
				},
				outline = {
					win_width = 50,
				},
			})
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter", -- optional
			"nvim-tree/nvim-web-devicons", -- optional
		},
	},
}, {
	install = {
		colorscheme = { "catppuccin" },
	},

	checker = {
		enable = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
})
