local M = {}

M.setup = function()
  local ok, nvim_window = pcall(require, "nvim-window")
  if not ok then
    return
  end

  nvim_window.setup {
    chars = {
      "A",
      "B",
      "C",
      "D",
      "E",
      "F",
      "G",
      "H",
      "I",
      "J",
      "K",
      "L",
      "M",
      "N",
      "O",
      "P",
      "Q",
      "R",
      "S",
      "T",
      "U",
      "V",
      "W",
      "X",
      "Y",
      "Z",
    },
    normal_hl = "NvimWindow",
    hint_hl = "Bold",
    border = "none",
  }
end

return M
