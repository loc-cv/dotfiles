return {
  -- lua functions for other plugins
  { "nvim-lua/plenary.nvim", lazy = true },

  -- smart relative number toggle
  { "cpea2506/relative-toggle.nvim" },

  -- don't let the cursor move while yanking
  { "svban/YankAssassin.vim", event = "VeryLazy" },

  -- highlight yank
  {
    "machakann/vim-highlightedyank",
    event = "VeryLazy",
    init = function()
      vim.g.highlightedyank_highlight_duration = 300
    end,
  },

  -- better whitespace highlighting
  {
    "ntpeters/vim-better-whitespace",
    init = function()
      vim.g.strip_whitespace_on_save = 0
      vim.g.better_whitespace_filetypes_blacklist = {
        "toggleterm",
        "diff",
        "git",
        "gitcommit",
        "unite",
        "qf",
        "help",
        "markdown",
        "fugitive",
      }
    end,
  },

  -- automatically close inactive buffers
  {
    "chrisgrieser/nvim-early-retirement",
    config = true,
    event = "VeryLazy",
  },

  -- range, pattern and substitute preview
  {
    "markonm/traces.vim",
    event = "VeryLazy",
    init = function()
      vim.g.traces_abolish_integration = 1
    end,
  },

  -- move lines and selections up and down
  {
    "echasnovski/mini.move",
    config = true,
    event = "VeryLazy",
    version = false,
  },

  -- automatically restoring file's cursor position and folding
  {
    "vim-scripts/restore_view.vim",
  },

  -- bookmark files
  {
    "otavioschwanck/arrow.nvim",
    opts = {
      show_icons = true,
      leader_key = '<leader>fs',
      mappings = {
        edit = "e",
        delete_mode = "d",
        clear_all_items = "C",
        toggle = "x", -- used as save if separate_save_and_remove is true
        open_vertical = "v",
        open_horizontal = "s",
        quit = "q",
        remove = "x", -- only used if separate_save_and_remove is true
        next_item = "]",
        prev_item = "["
      },
    },
  },
}