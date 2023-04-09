return {
  {
    'kazhala/close-buffers.nvim',
    lazy = true,
    opts = {
      filetype_ignore = { 'floaterm' },
    },
    config = function(_, opts)
      require('close_buffers').setup(opts)
    end,
    keys = {
      {
        '<leader>bc',
        function()
          require('close_buffers').wipe({ type = 'hidden' })
        end,
        silent = false,
      },
    },
  },
}
