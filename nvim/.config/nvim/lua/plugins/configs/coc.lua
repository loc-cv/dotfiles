local M = {}

M.setup = function()
  -- for coc-fzf
  vim.g.fzf_layout = { window = { height = 0.90, width = 0.90, border = 'sharp' } }
  vim.g.coc_fzf_preview = 'up:55%'
  vim.g.fzf_action = {
    ['ctrl-t'] = 'tab split',
    ['ctrl-s'] = 'split',
    ['ctrl-v'] = 'vsplit',
  }
  vim.g.fzf_colors = {
    ['border'] = { 'fg', 'Normal' },
  }

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
    'coc-highlight',
    '@yaegassy/coc-tailwindcss3',
  }
end

return M
