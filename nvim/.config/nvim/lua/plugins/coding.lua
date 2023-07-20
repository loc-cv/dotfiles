return {
  { "tpope/vim-rails" },

  {
    "matze/vim-move",
    keys = { "<M-j>", "<M-k>", "<M-h>", "<M-l>" },
  },

  {
    "kkoomen/vim-doge",
    build = ":call doge#install()",
    keys = "<leader>d",
    init = function()
      vim.g.doge_javascript_settings = {
        destructuring_props = 1,
        omit_redundant_param_types = 1,
      }
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

  {
    "https://github.com/machakann/vim-sandwich",
    event = "VeryLazy",
  },

  {
    "Wansmer/treesj",
    keys = { { "<leader>m", [[<cmd>TSJToggle<cr>]] } },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = { use_default_keymaps = false, max_join_length = 9999 },
    config = function(_, opts)
      require("treesj").setup(opts)
    end,
  },

  {
    "utilyre/sentiment.nvim",
    version = "*",
    config = true,
  },
}
