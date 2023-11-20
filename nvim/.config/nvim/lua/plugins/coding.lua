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
    init = function()
      vim.g.sandwich_no_default_key_mappings = 1
      vim.g.operator_sandwich_no_default_key_mappings = 1
      vim.g.textobj_sandwich_no_default_key_mappings = 1
    end,
    config = function()
      vim.cmd("runtime macros/sandwich/keymap/surround.vim")
    end,
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
    event = "VeryLazy",
    init = function()
      vim.g.loaded_matchparen = 1
    end,
    config = true,
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },

  {
    "declancm/cinnamon.nvim",
    event = "VeryLazy",
    opts = {
      always_scroll = true,
      centered = true,
      default_delay = 2,
    },
    config = function(_, opts)
      require("cinnamon").setup(opts)
    end,
  },

  -- { "craigemery/vim-autotag", event = "VeryLazy" },
  { "tpope/vim-sleuth" },
  { "tpope/vim-abolish", event = "VeryLazy" },
  { "tpope/vim-unimpaired", event = "VeryLazy" },
  { "tpope/vim-eunuch", event = "VeryLazy" },
}
