require 'nvim-treesitter.configs'.setup {
  ensure_installed = {
    'python',
    'lua',
    'javascript',
    'typescript',
    'bash',
    'java',
    'kotlin'
  },

  autopairs = {
    enable = true,
  },

  sync_install = false,

  highlight = {
    enable = true,
    --additional_vim_regex_highlighting = false
  },

  refactor = {
    highlight_definitions = { enable = true },
    smart_rename = {
      enable = true,
      keymaps = { smart_rename = "grr" },
    },

    navigation = {
      enable = true,
      keymaps = {
        goto_definitions = "gnd",
        list_definitions = "gnD",
        list_definitions_toc = "gO",
        goto_next_usage = "<A-y>",
        goto_previous_usage = "<A-i>",
      },
    },
  },
}
