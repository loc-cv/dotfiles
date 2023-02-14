local M = {}

local configs = {
  -- packer.nvim
  packer = function()
    -- Auto compile/clean/install plugins with packer-nvim
    vim.api.nvim_create_autocmd('BufWritePost', {
      group = vim.api.nvim_create_augroup('Packer', { clear = true }),
      pattern = '*/lua/plugins/init.lua',
      callback = function()
        vim.cmd({ cmd = 'source', args = { '<afile>' } })
        vim.cmd({ cmd = 'PackerClean' })
        vim.cmd({ cmd = 'PackerInstall' })
        vim.cmd({ cmd = 'PackerCompile' })
      end,
    })
  end,

  -- vim-floaterm
  -- floaterm = function()
  --   -- Make floaterm window transparent
  --   vim.api.nvim_create_autocmd('FileType', {
  --     group = vim.api.nvim_create_augroup('Floaterm', { clear = true }),
  --     pattern = 'floaterm',
  --     command = 'setlocal winblend=15',
  --   })
  -- end,

  -- coc.nvim
  coc = function()
    local cocAuGroup = vim.api.nvim_create_augroup('CoC', { clear = true })

    -- Setup formatexpr specified filetype(s)
    vim.api.nvim_create_autocmd('FileType', {
      group = cocAuGroup,
      pattern = { 'typescript', 'json' },
      command = "setl formatexpr=CocAction('formatSelected')",
      desc = 'Setup formatexpr specified filetype(s)',
    })

    -- Update signature help on jump placeholder
    vim.api.nvim_create_autocmd('User', {
      group = cocAuGroup,
      pattern = 'CocJumpPlaceholder',
      command = "call CocActionAsync('showSignatureHelp')",
      desc = 'Update signature help on jump placeholder',
    })

    -- Highlight the symbol and its references when holding the cursor
    vim.api.nvim_create_autocmd('CursorHold', {
      group = cocAuGroup,
      command = "silent call CocActionAsync('highlight')",
      desc = 'Highlight symbol under cursor on CursorHold',
    })
  end,

  telescope = function()
    vim.api.nvim_create_autocmd('User', {
      group = vim.api.nvim_create_augroup('Telescope', { clear = true }),
      pattern = 'TelescopePreviewerLoaded',
      command = 'setlocal number',
    })
  end,
}

M.init = function()
  -- No line numbers in terminals
  vim.api.nvim_create_autocmd('TermOpen', {
    group = vim.api.nvim_create_augroup('DisableTermLineNumbers', { clear = true }),
    pattern = '*',
    command = 'setlocal nonumber norelativenumber',
  })

  -- Disable auto comment insertion
  vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup('DisableAutoCommentInsertion', { clear = true }),
    pattern = '*',
    command = 'setlocal formatoptions-=cro',
  })

  -- Better cursorline (somehow it's not consistent)
  local cursorAuGroup = vim.api.nvim_create_augroup('Cursor', { clear = true })
  local cursor_excluded_filetypes = { 'coc-explorer', 'DiffviewFiles', 'coctree', 'NvimTree' }
  vim.api.nvim_create_autocmd({ 'WinLeave', 'InsertEnter', 'BufLeave' }, {
    group = cursorAuGroup,
    pattern = '*',
    callback = function()
      if not vim.tbl_contains(cursor_excluded_filetypes, vim.bo.filetype) then
        vim.cmd({ cmd = 'set', args = { 'nocursorline' } })
      end
    end,
  })
  vim.api.nvim_create_autocmd({ 'WinEnter', 'InsertLeave', 'BufEnter' }, {
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

  -- Enable comment in json filetype (make it jsonc)
  vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
    group = vim.api.nvim_create_augroup('MakeJsonJsonc', { clear = true }),
    pattern = '*.json',
    command = 'set filetype=jsonc',
  })

  -- Load plugins autocmds
  for _, config in pairs(configs) do
    config()
  end
end

return M
