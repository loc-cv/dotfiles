local M = {}

M.setup = function()
  local ok, nvim_window = pcall(require, "nvim-window")
  if not ok then
    return
  end

  nvim_window.setup {
    chars = {
      "a",
      "b",
      "c",
      "d",
      "e",
      "f",
      "g",
      "h",
      "i",
      "j",
      "k",
      "l",
      "m",
      "n",
      "o",
      "p",
      "q",
      "r",
      "s",
      "t",
      "u",
      "v",
      "w",
      "x",
      "y",
      "z",
    },
    normal_hl = "NvimWindow",
    hint_hl = "Bold",
    border = "none",
  }
end

return M
