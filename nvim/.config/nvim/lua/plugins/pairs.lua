return {
  -- auto pairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      map_cr = false,
      map_c_h = true,
      map_c_w = true,
      fast_wrap = {}, -- use <M-e> to fast wrap
      break_undo = false,
    },
    config = function(_, opts)
      require("nvim-autopairs").setup(opts)
    end,
  },

  -- highlight outer pair
  {
    "utilyre/sentiment.nvim",
    version = "*",
    event = "VeryLazy",
    init = function()
      vim.g.loaded_matchparen = 1
    end,
    config = true,
  },
}
