return {
  {
    'simeji/winresizer',
    init = function()
      vim.g.winresizer_start_key = '<leader>r'
    end,
  },
  {
    url = 'https://gitlab.com/yorickpeterse/nvim-window.git',
    opts = {
      hint_hl = 'Bold',
      border = 'single',
    },
    config = function(_, opts)
      require('nvim-window').setup(opts)
    end,
  },
}
