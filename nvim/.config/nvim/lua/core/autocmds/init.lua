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

-- Better cursorline
vim.api.nvim_create_autocmd({ "WinLeave", "InsertEnter" }, {
  pattern = "*",
  callback = function()
    local filetypes_exclude = {
      "coc-explorer",
    }
    for _, v in ipairs(filetypes_exclude) do
      if vim.bo.filetype == v then
        return
      end
    end
    vim.cmd [[set nocursorline]]
  end
})

vim.api.nvim_create_autocmd({ "WinEnter", "InsertLeave" }, {
  pattern = "*",
  callback = function()
    vim.cmd [[set cursorline]]
  end,
})
