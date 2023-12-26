return {
  {
    "simeji/winresizer",
    keys = {
      { "<leader>rr", [[<cmd>WinResizerStartResize<cr>]] },
      { "<leader>rm", [[<cmd>WinResizerStartMove<cr>]] },
    },
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
