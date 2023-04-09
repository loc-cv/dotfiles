return {
  {
    'brenoprata10/nvim-highlight-colors',
    opts = {
      render = 'background',
      enable_named_color = true,
      enable_tailwind = true,
    },
    config = function(_, opts)
      require('nvim-highlight-colors').setup(opts)
    end,
  },
}
