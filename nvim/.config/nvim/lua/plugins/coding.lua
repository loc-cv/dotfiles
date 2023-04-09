return {
  { 'tpope/vim-rails', ft = { 'ruby', 'eruby' } },
  {
    'kkoomen/vim-doge',
    build = ':call doge#install()',
    keys = '<leader>d',
    init = function()
      vim.g.doge_javascript_settings = {
        destructuring_props = 1,
        omit_redundant_param_types = 1,
      }
    end,
  },
  {
    'numToStr/Comment.nvim',
    dependencies = 'JoosepAlviste/nvim-ts-context-commentstring',
    keys = { 'gc', 'gb' },
    config = function()
      require('Comment').setup({
        ignore = '^$',
        toggler = { block = 'gbb' },
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      })
    end,
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {
      map_cr = false,
      map_c_h = true,
      map_c_w = true,
      fast_wrap = {}, -- use <M-e> to fast wrap
      break_undo = false,
    },
    config = function(_, opts)
      require('nvim-autopairs').setup(opts)
    end,
  },
  {
    'machakann/vim-sandwich',
    config = function()
      vim.cmd({ cmd = 'runtime', args = { 'macros/sandwich/keymap/surround.vim' } })
    end,
  },
  {
    'machakann/vim-highlightedyank',
    init = function()
      vim.g.highlightedyank_highlight_duration = 300
    end,
  },
  { 'svban/YankAssassin.vim' },

  -- Markdown
  {
    'iamcco/markdown-preview.nvim',
    ft = { 'markdown' },
    build = 'cd app && npm install',
    init = function()
      vim.g.mkdp_filetypes = { 'markdown' }
    end,
  },
  {
    'ntpeters/vim-better-whitespace',
    init = function()
      vim.g.better_whitespace_filetypes_blacklist = {
        'toggleterm',
        'diff',
        'git',
        'gitcommit',
        'unite',
        'qf',
        'help',
        'markdown',
        'fugitive',
      }
    end,
  },
}
