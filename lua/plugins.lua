local status, packer = pcall(require, 'packer')
if (not status) then
  print("Packer is not installed")
end

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
    'lewis6991/gitsigns.nvim',
    config = function ()
      require('gitsigns').setup()
    end
    -- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
  }
  --Lua line
  use {
    'nvim-lualine/lualine.nvim',
    'kyazdani42/nvim-web-devicons'
  }

  --lsp config
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "onsails/lspkind-nvim"
  }

  --Auto completion
  use {
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
  }

  -- Snippets for cmp
  use {
    'saadparwaiz1/cmp_luasnip',
    'L3MON4D3/LuaSnip'
  }

  -- Buffer line
  use 'romgrk/barbar.nvim'

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    'nvim-treesitter/nvim-treesitter-refactor',
    run = ':TSUpdate'
  }

  -- Telescope
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'nvim-lua/plenary.nvim'

  use { 'glepnir/dashboard-nvim', requires = { 'nvim-tree/nvim-web-devicons' } }

  --Null-ls
  use 'jose-elias-alvarez/null-ls.nvim'
  use('MunifTanjim/prettier.nvim')
  --Auto Pairs
  use "windwp/nvim-autopairs"

  --Indent line
  use "lukas-reineke/indent-blankline.nvim"

  --Color scheme
  use { "catppuccin/nvim", as = "catppuccin" }

  --Dap and jdtls
  use 'mfussenegger/nvim-jdtls'
  --  use 'mfussenegger/nvim-dap'

  --Toggle term
  use 'akinsho/toggleterm.nvim'

  --Snippets
  use "rafamadriz/friendly-snippets"

  use 'turbio/bracey.vim'
  if packer_bootstrap then
    require('packer').sync()
  end
end)
