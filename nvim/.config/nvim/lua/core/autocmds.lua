-- No line numbers in terminals
vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("DisableTermLineNumbers", { clear = true }),
  pattern = "*",
  command = "setlocal nonumber norelativenumber",
})

-- Disable auto comment insertion
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("DisableAutoCommentInsertion", { clear = true }),
  pattern = "*",
  command = "setlocal formatoptions-=cro",
})

-- Better cursorline (somehow it's not consistent)
local cursorAuGroup = vim.api.nvim_create_augroup("Cursor", { clear = true })
local cursor_excluded_filetypes = { "coc-explorer", "DiffviewFiles", "coctree", "NvimTree" }
vim.api.nvim_create_autocmd({ "WinLeave", "InsertEnter", "BufLeave" }, {
  group = cursorAuGroup,
  pattern = "*",
  callback = function()
    if not vim.tbl_contains(cursor_excluded_filetypes, vim.bo.filetype) then
      vim.cmd({ cmd = "set", args = { "nocursorline" } })
    end
  end,
})
vim.api.nvim_create_autocmd({ "WinEnter", "InsertLeave", "BufEnter" }, {
  group = cursorAuGroup,
  pattern = "*",
  command = "set cursorline",
})

-- Better search
local incsearchHighlightAuGroup = vim.api.nvim_create_augroup("IncSearchHighlight", { clear = true })
vim.api.nvim_create_autocmd({ "CmdlineEnter" }, {
  group = incsearchHighlightAuGroup,
  pattern = "/,\\?",
  command = "set hlsearch",
})
vim.api.nvim_create_autocmd({ "CmdlineLeave" }, {
  group = incsearchHighlightAuGroup,
  pattern = "/,\\?",
  command = "set nohlsearch",
})

-- Enable comment in json filetype (make it jsonc)
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = vim.api.nvim_create_augroup("MakeJsonJsonc", { clear = true }),
  pattern = "*.json",
  command = "set filetype=jsonc",
})

-- Yaml filetype
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "eruby.yaml",
--   command = "set filetype=yaml",
-- })

-- Start insert when open terminal
vim.api.nvim_create_autocmd({ "BufWinEnter", "WinEnter" }, {
  pattern = "term://*",
  command = "startinsert",
})

-- Skip adding eol on last line or eof when saving
-- vim.api.nvim_create_autocmd({ "BufWritePre" }, {
--   pattern = "*",
--   command = "set binary | set noeol",
-- })
-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
--   pattern = "*",
--   command = "set nobinary | set eol",
-- })