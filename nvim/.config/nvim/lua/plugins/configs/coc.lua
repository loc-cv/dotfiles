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
    -- '@yaegassy/coc-tailwindcss3',
    -- 'coc-styled-components',
    -- '@yaegassy/coc-volar',
  }
end

return M
