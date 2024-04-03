local window_map_prefix = "<leader>w"

return {
  {
    "simeji/winresizer",
    init = function()
      vim.g.winresizer_start_key = ""
    end,
    keys = {
      { window_map_prefix .. "r", [[<cmd>WinResizerStartResize<cr>]] },
      { window_map_prefix .. "m", [[<cmd>WinResizerStartMove<cr>]] },
    },
  },

  {
    url = "https://gitlab.com/yorickpeterse/nvim-window.git",
    keys = {
      {
        window_map_prefix .. "p",
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
    keys = { { window_map_prefix .. "f", [[<cmd>ZenMode<cr>]] } },
  },

  {
    "ton/vim-bufsurf",
    lazy = false,
    keys = {
      { "]b", "<cmd>BufSurfForward<cr>" },
      { "[b", "<cmd>BufSurfBack<cr>" },
    },
  },
}
