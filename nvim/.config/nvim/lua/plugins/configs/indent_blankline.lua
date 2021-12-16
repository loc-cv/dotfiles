local indent_blankline = require "indent_blankline"

indent_blankline.setup {
  char = "▏",
  show_trailing_blankline_indent = false,
  show_current_context = true,
  show_current_context_start = true,
  filetype_exclude = {
    "help",
    "terminal",
    "dashboard",
    "TelescopePrompt",
    "TelescopeResults",
    "fugitive",
    "vim-plug",
    "coc-explorer",
    "packer",
    "lspinfo",
    "NvimTree",
    "CHADTree",
  },
  buftype_exclude = { "terminal" },
}
