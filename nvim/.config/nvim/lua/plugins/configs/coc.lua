local M = {}

M.setup = function()
  vim.g.coc_max_treeview_width = 100
  vim.g.coc_global_extensions = {
    'coc-html',
    'coc-css',
    'coc-emmet',
    'coc-tsserver',
    'coc-json',
    'coc-prettier',
    'coc-eslint',
    'coc-snippets',
    'coc-explorer',
    'coc-sumneko-lua',
    'coc-stylua',
    'coc-symbol-line',
    'coc-styled-components',
    '@yaegassy/coc-tailwindcss3',
  }

  function _G.symbol_line()
    local bufnr = vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
    local ok, line = pcall(vim.api.nvim_buf_get_var, bufnr, 'coc_symbol_line')
    return ok and '%#CocSymbolLine# ' .. line or ''
  end

  vim.api.nvim_create_autocmd({ 'CursorHold', 'WinEnter', 'BufWinEnter' }, {
    pattern = '*',
    callback = function()
      if vim.b.coc_symbol_line and vim.bo.buftype == '' then
        if vim.opt_local.winbar:get() == '' then
          vim.opt_local.winbar = '%!v:lua.symbol_line()'
        end
      else
        vim.opt_local.winbar = ''
      end
    end,
  })
end

return M
