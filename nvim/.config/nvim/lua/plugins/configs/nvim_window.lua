local _, nvim_window = pcall(require, "nvim-window")

nvim_window.setup {
  normal_hl = "NvimWindow",
  hint_hl = "Bold",
  border = "none",
}
