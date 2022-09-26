local M = {}

local configs = {
  -- packer.nvim
  packer = function()
    -- Auto compile/clean/install plugins with packer-nvim
    vim.api.nvim_create_autocmd('BufWritePost', {
      group = vim.api.nvim_create_augroup('Packer', { clear = true }),
      pattern = '*/lua/plugins/init.lua',
      callback = function()
        vim.cmd('source <afile> | PackerClean')
        vim.cmd('source <afile> | PackerInstall')
        vim.cmd('source <afile> | PackerCompile')
      end,
    })
  end,

  -- vim-floaterm
  floaterm = function()
    -- Make floaterm window transparent
    vim.api.nvim_create_autocmd('FileType', {
      group = vim.api.nvim_create_augroup('Floaterm', { clear = true }),
      pattern = 'floaterm',
      command = 'setlocal winblend=15',
    })
  end,

  -- coc.nvim
  coc = function()
    local cocAuGroup = vim.api.nvim_create_augroup('CoC', { clear = true })

    -- Setup formatexpr specified filetype(s)
    vim.api.nvim_create_autocmd('FileType', {
      group = cocAuGroup,
      pattern = { 'typescript', 'json' },
      command = "setl formatexpr=CocAction('formatSelected')",
    })

    -- Update signature help on jump placeholder
    vim.api.nvim_create_autocmd('User', {
      group = cocAuGroup,
      pattern = 'CocJumpPlaceholder',
      callback = function()
        vim.fn.CocActionAsync('showSignatureHelp')
      end,
    })

    -- Highlight the symbol and its references when holding the cursor
    vim.api.nvim_create_autocmd('CursorHold', {
      group = cocAuGroup,
      pattern = '*',
      callback = function()
        vim.fn.CocActionAsync('highlight')
      end,
    })
  end,
}

M.init = function()
  -- No line numbers in terminals
  vim.api.nvim_create_autocmd('TermOpen', {
    pattern = '*',
    command = 'setlocal nonumber norelativenumber',
  })

  -- Disable auto comment insertion
  vim.api.nvim_create_autocmd('FileType', {
    pattern = '*',
    command = 'setlocal formatoptions-=cro',
  })

  -- Better cursorline (somehow it's not consistent)
  local cursorAuGroup = vim.api.nvim_create_augroup('Cursor', { clear = true })
  local cursor_excluded_filetypes = { 'coc-explorer', 'DiffviewFiles', 'coctree' }
  vim.api.nvim_create_autocmd({ 'WinLeave', 'InsertEnter' }, {
    group = cursorAuGroup,
    pattern = '*',
    callback = function()
      if vim.tbl_contains(cursor_excluded_filetypes, vim.bo.filetype) then
        return
      end
      vim.cmd('set nocursorline')
    end,
  })
  vim.api.nvim_create_autocmd({ 'WinEnter', 'InsertLeave', 'BufWinEnter', 'BufEnter' }, {
    group = cursorAuGroup,
    pattern = '*',
    command = 'set cursorline',
  })

  -- Better search
  local incsearchHighlightAuGroup = vim.api.nvim_create_augroup('IncSearchHighlight', { clear = true })
  vim.api.nvim_create_autocmd({ 'CmdlineEnter' }, {
    group = incsearchHighlightAuGroup,
    pattern = '/,\\?',
    command = 'set hlsearch',
  })
  vim.api.nvim_create_autocmd({ 'CmdlineLeave' }, {
    group = incsearchHighlightAuGroup,
    pattern = '/,\\?',
    command = 'set nohlsearch',
  })

  -- Load plugins autocmds
  for _, config in pairs(configs) do
    config()
  end
end

return M
