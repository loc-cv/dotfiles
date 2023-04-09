return {
  {
    'simeji/winresizer',
    init = function()
      vim.g.winresizer_start_key = '<leader>r'
    end,
  },
  {
    url = 'https://gitlab.com/yorickpeterse/nvim-window.git',
    lazy = true,
    opts = {
      hint_hl = 'Bold',
      border = 'single',
    },
    keys = {
      {
        '<leader>w',
        function()
          require('nvim-window').pick()
        end,
      },
    },
    config = function(_, opts)
      require('nvim-window').setup(opts)
    end,
  },
}
