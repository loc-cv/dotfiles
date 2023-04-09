return {
  {
    'kazhala/close-buffers.nvim',
    opts = {
      filetype_ignore = { 'floaterm' },
    },
    config = function(_, opts)
      require('close_buffers').setup(opts)
    end,
  },
}
