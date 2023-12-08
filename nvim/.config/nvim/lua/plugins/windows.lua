return {
  {
    "simeji/winresizer",
    init = function()
      vim.g.winresizer_start_key = "<leader>r"
    end,
    keys = { "<leader>r" },
  },

  {
    url = "https://gitlab.com/yorickpeterse/nvim-window.git",
    keys = {
      {
        "<leader>w",
        function()
          require("nvim-window").pick()
        end,
      },
    },
    opts = {
      hint_hl = "Bold",
      border = "single",
    },
    config = function(_, opts)
      require("nvim-window").setup(opts)
    end,
  },

  -- maximize neovim windows
  {
    "declancm/maximize.nvim",
    event = "VeryLazy",
    config = true,
  },
}
