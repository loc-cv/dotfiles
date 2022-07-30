local M = {}

M.setup = function()
  local ok, indent_blankline = pcall(require, 'indent_blankline')
  if not ok then
    return
  end

  indent_blankline.setup({
    char = '▏',
    -- context_char = '▏',
    context_char = '▎',
    show_current_context = true,
    show_current_context_start = true,
    show_trailing_blankline_indent = false,
    show_current_context_start_oncurrent_line = true,
    filetype_exclude = {
      'help',
      'terminal',
      'TelescopePrompt',
      'TelescopeResults',
      'fugitive',
      'coc-explorer',
      'packer',
      'tutor',
      'startuptime',
      'NeogitStatus',
      'DiffviewFiles',
      'lsp-installer',
      'lspinfo',
      'Trouble',
      'neo-tree',
      'neo-tree-popup',
      'NvimTree',
      'mason.nvim',
      '',
    },
    buftype_exclude = { 'terminal' },
  })
end

return M
