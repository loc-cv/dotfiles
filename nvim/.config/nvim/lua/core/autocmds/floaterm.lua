-- Make floaterm window transparent
vim.api.nvim_create_autocmd("FileType", {
  pattern = "floaterm",
  command = "setlocal winblend=15",
})
