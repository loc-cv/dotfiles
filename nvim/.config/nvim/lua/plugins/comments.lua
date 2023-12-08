return {
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    lazy = true,
    init = function()
      vim.g.skip_ts_context_commentstring_module = true
    end,
  },

  {
    "numToStr/Comment.nvim",
    dependencies = "JoosepAlviste/nvim-ts-context-commentstring",
    event = "VeryLazy",
    config = function()
      require("Comment").setup({
        ignore = "^$",
        toggler = { block = "gbb" },
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      })
    end,
  },
}
