local M = {}

M.setup = function()
  local ok, gitsigns = pcall(require, 'gitsigns')
  if not ok then
    return
  end

  gitsigns.setup({
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
  })
end

return M
