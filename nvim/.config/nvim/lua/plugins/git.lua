---@diagnostic disable: redundant-parameter

return {
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '┃' },
        change = { text = '┃' },
        delete = { text = '🭻' },
        topdelete = { text = '🭶' },
        changedelete = { text = '~' },
        untracked = { text = '┆' },
      },
      current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 200,
        ignore_whitespace = false,
      },
    },
    config = function(_, opts)
      require('gitsigns').setup(opts)
    end,
  },
  {
    'kdheepak/lazygit.nvim',
    cmd = 'LazyGit',
    init = function()
      vim.g.lazygit_floating_window_winblend = 0
      vim.g.lazygit_floating_window_scaling_factor = 1
      vim.g.lazygit_floating_window_corner_chars = { '┌', '┐', '└', '┘' }
      vim.g.lazygit_floating_window_use_plenary = 0
    end,
  },
}
