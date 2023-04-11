---@diagnostic disable: redundant-parameter, different-requires

return {
  { 'matze/vim-move', keys = { '<M-j>', '<M-k>', '<M-h>', '<M-l>' } },

  {
    'dstein64/vim-startuptime',
    cmd = { 'StartupTime' },
  },

  {
    'lambdalisue/suda.vim',
    cmd = { 'SudaRead', 'SudaWrite' },
  },

  {
    'declancm/cinnamon.nvim',
    opts = {
      always_scroll = true,
      centered = true,
      default_delay = 2,
    },
    config = function(_, opts)
      require('cinnamon').setup(opts)
    end,
  },

  { 'jeffkreeftmeijer/vim-numbertoggle' },

  {
    'anuvyklack/pretty-fold.nvim',
    opts = {
      keep_indentation = false,
      fill_char = '━',
      sections = {
        left = {
          '━ ',
          function()
            return string.rep('*', vim.v.foldlevel)
          end,
          ' ━┫',
          'content',
          '┣',
        },
        right = {
          '┫ ',
          'number_of_folded_lines',
          ': ',
          'percentage',
          ' ┣━━',
        },
      },
    },
    config = function(_, opts)
      require('pretty-fold').setup(opts)
    end,
  },

  {
    'anuvyklack/fold-preview.nvim',
    dependencies = 'anuvyklack/keymap-amend.nvim',
    config = function()
      require('fold-preview').setup()
    end,
  },

  {
    'markonm/traces.vim',
    init = function()
      vim.g.traces_abolish_integration = 1
    end,
  },

  { 'tpope/vim-abolish' },

  { 'tpope/vim-sleuth' },

  { 'tpope/vim-unimpaired' },
}
