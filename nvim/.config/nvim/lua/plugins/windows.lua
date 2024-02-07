return {
  {
    "simeji/winresizer",
    init = function()
      vim.g.winresizer_start_key = ""
    end,
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

  -- zen mode
  {
    "folke/zen-mode.nvim",
    keys = { { "<leader>wf", [[<cmd>ZenMode<cr>]] } },
  },
}
