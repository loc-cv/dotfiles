-- Autocmds for plugins
require "core.autocmds.packer"
require "core.autocmds.coc"
require "core.autocmds.floaterm"

-- Making sure everything works as expected
vim.cmd [[filetype plugin indent on]]

-- No line numbers in terminals
vim.cmd [[autocmd TermOpen * setlocal nonumber norelativenumber]]

-- Disable auto comment insertion
vim.cmd [[autocmd FileType * setlocal formatoptions-=cro]]

-- Smarter cursorline
vim.cmd [[
  autocmd InsertLeave,WinEnter * if index(["coc-explorer"], &ft) < 0 | set cursorline
  autocmd InsertEnter,WinLeave * if index(["coc-explorer"], &ft) < 0 | set nocursorline
]]
