local M = {}

M.setup = function()
  local ok, gitsigns = pcall(require, 'gitsigns')
  if not ok then
    return
  end

  gitsigns.setup({
    signs = {
      add = { hl = 'DiffAdd', text = '┃', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
      change = { hl = 'DiffChange', text = '┃', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
      delete = { hl = 'DiffDelete', text = '🭻', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
      topdelete = { hl = 'DiffDelete', text = '🭶', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
      changedelete = { hl = 'DiffChange', text = '~', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
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
