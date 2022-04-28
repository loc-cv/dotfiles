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
local cursorGrp = vim.api.nvim_create_augroup("CursorLine", { clear = true })

vim.api.nvim_create_autocmd({ "WinLeave", "InsertEnter" }, {
  group = cursorGrp,
  pattern = "*",
  callback = function()
    local filetypes_exclude = { "coc-explorer" }
    for _, v in ipairs(filetypes_exclude) do
      if vim.bo.filetype == v then
        return
      end
    end
    vim.cmd [[set nocursorline]]
  end,
})

vim.api.nvim_create_autocmd({ "WinEnter", "InsertLeave" }, {
  group = cursorGrp,
  pattern = "*",
  command = "set cursorline",
})
