local M = {}

M.setup = function()
  local ok, nvim_window = pcall(require, "nvim-window")
  if not ok then
    return
  end

  nvim_window.setup {
    normal_hl = "NvimWindow",
    hint_hl = "Bold",
    border = "none",
  }
end

return M
