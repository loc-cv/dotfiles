-- Setup formatexpr specified filetype(s)
-- and update signature help on jump placeholder
local augroup = vim.api.nvim_create_augroup("MyGroup", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = { "typescript", "json" },
  command = "setl formatexpr=CocAction('formatSelected')",
})

vim.api.nvim_create_autocmd("User", {
  group = augroup,
  pattern = "CocJumpPlaceholder",
  command = "call CocActionAsync('showSignatureHelp')",
})

-- Auto close coc-explorer when exit Neovim
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  command = "if (winnr('$') == 1 && &filetype == 'coc-explorer') | q | endif",
})

-- Highlight the symbol and its references when holding the cursor
vim.api.nvim_create_autocmd("CursorHold", {
  pattern = "*",
  callback = function()
    vim.fn.CocActionAsync "highlight"
  end,
})
