local M = {}

M.setup = function()
  local ok, gitsigns = pcall(require, "gitsigns")
  if not ok then
    return
  end

  gitsigns.setup {
    signs = {
      add = { hl = "DiffAdd", text = "┃", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
      change = { hl = "DiffChange", text = "┃", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
      delete = { hl = "DiffDelete", text = "🭻", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
      topdelete = { hl = "DiffDelete", text = "🭶", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
      changedelete = { hl = "DiffChange", text = "~", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
    },
  }
end

return M
