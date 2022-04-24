-- Autocmds for plugins
require "core.autocmds.packer"
require "core.autocmds.coc"
require "core.autocmds.floaterm"

-- Just making sure everything works as expected
vim.cmd [[filetype plugin indent on]]

-- No line numbers in terminals
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  command = "setlocal nonumber norelativenumber",
})

-- Disable auto comment insertion
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  command = "setlocal formatoptions-=cro",
})
