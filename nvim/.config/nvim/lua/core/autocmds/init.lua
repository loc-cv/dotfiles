-- Autocmds for plugins
require 'core.autocmds.packer'
require 'core.autocmds.coc'
require 'core.autocmds.floaterm'

-- Making sure everything works as expected
vim.cmd [[filetype plugin indent on]]

-- No line numbers in terminals
vim.cmd [[autocmd TermOpen * setlocal nonumber norelativenumber]]

-- Disable auto comment insertion
vim.cmd [[autocmd FileType * setlocal formatoptions-=cro]]

-- Markdown
vim.cmd [[autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown]]
