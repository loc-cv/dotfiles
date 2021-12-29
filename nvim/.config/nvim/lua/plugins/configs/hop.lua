local _, hop = pcall(require, "hop")

hop.setup {
  jump_on_sole_occurrence = false,
  char2_fallback_key = "<esc>",
  -- uppercase_labels = true,
}
