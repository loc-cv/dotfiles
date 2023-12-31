return {
  {
    "simeji/winresizer",
    keys = {
      { "<leader>wr", [[<cmd>WinResizerStartResize<cr>]] },
      { "<leader>wm", [[<cmd>WinResizerStartMove<cr>]] },
    },
  },

  {
    url = "https://gitlab.com/yorickpeterse/nvim-window.git",
    keys = {
      {
        "<leader>wp",
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
    keys = {
      {
        "<leader>wz",
        function()
          require("maximize").toggle()
        end,
      },
    },
    opts = {
      default_keymaps = false,
    },
    config = function(_, opts)
      require("maximize").setup(opts)
    end,
  },
}
