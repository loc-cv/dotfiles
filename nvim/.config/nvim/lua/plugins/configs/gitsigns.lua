local _, gitsigns = pcall(require, "gitsigns")

gitsigns.setup {
  signs = {
    add = { hl = "DiffAdd", text = "┃", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
    change = { hl = "DiffChange", text = "┃", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
    delete = { hl = "DiffDelete", text = "_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    topdelete = { hl = "DiffDelete", text = "‾", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    changedelete = { hl = "DiffChange", text = "~", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
  },
}
