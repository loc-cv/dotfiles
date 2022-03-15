local utils = require 'core.utils'
local map = utils.map

-- coc-explorer
map('n', '<C-n>', '<Cmd>CocCommand explorer<CR><Cmd>sleep 50ms<cr><C-w>=')

-- coc-prettier
map('n', '<C-i>', '<Cmd>CocCommand prettier.formatFile<Cr>')

-- coc-snippet
vim.g.coc_snippet_next = '<Tab>'
vim.g.coc_snippet_prev = '<S-Tab>'

-- Use <C-space> to trigger completion
map('i', '<C-space>', 'coc#refresh()', { expr = true })

-- Use <C-j> and <C-k> to navigate the completion list
map('i', '<C-j>', 'pumvisible() ? "<C-n>" : "<Tab>"', { expr = true })
map('i', '<C-k>', 'pumvisible() ? "<C-p>" : "<S-Tab>"', { expr = true })

-- Use `[g` and `]g` to navigate diagnostics
map('n', '[d', '<Plug>(coc-diagnostic-prev)', { noremap = false })
map('n', ']d', '<Plug>(coc-diagnostic-next)', { noremap = false })

-- GOTO code navigation
map('n', 'gd', '<Plug>(coc-definition)', { noremap = false })
map('n', 'gy', '<Plug>(coc-type-definition)', { noremap = false })
map('n', 'gi', '<Plug>(coc-implementation)', { noremap = false })
map('n', 'gr', '<Plug>(coc-references)', { noremap = false })

-- Use gh to show documentation in preview window
map('n', 'gh', function()
  local cw = vim.fn.expand '<cword>'
  if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
    vim.cmd('h ' .. cw)
  elseif vim.api.nvim_eval 'coc#rpc#ready()' then
    vim.fn.CocActionAsync 'doHover'
  else
    vim.cmd('!' .. vim.o.keywordprg .. ' ' .. cw)
  end
end)

-- Symbol renaming
map('n', '<space>rn', '<Plug>(coc-rename)', { noremap = false })

-- Formatting selected code
map({ 'x', 'n' }, '<space>fm', '<Plug>(coc-format-selected)', { noremap = false })

-- Applying code action to the selected region
map({ 'x', 'n' }, '<space>a', '<Plug>(coc-codeaction-selected)', { noremap = false })

-- Applying code action to the current buffer
map('n', '<space>A', '<Plug>(coc-codeaction)', { noremap = false })

-- Apply autofix to problem on the current line.
map('n', '<space>qf', '<Plug>(coc-fix-current)', { noremap = false })

-- Map function and class text objects
-- NOTE: Requires 'textDocument.documentSymbol' support from the language server.
map({ 'x', 'o' }, 'if', '<Plug>(coc-funcobj-i)', { noremap = false })
map({ 'x', 'o' }, 'af', '<Plug>(coc-funcobj-a)', { noremap = false })
map({ 'x', 'o' }, 'ic', '<Plug>(coc-classobj-i)', { noremap = false })
map({ 'x', 'o' }, 'ac', '<Plug>(coc-classobj-a)', { noremap = false })

-- Remap <C-f> and <C-b> for scroll float windows/popups.
map({ 'n', 'v' }, '<C-f>', "coc#float#has_scroll() ? coc#float#scroll(1) : '<C-d>'", { expr = true, nowait = true })
map({ 'n', 'v' }, '<C-b>', "coc#float#has_scroll() ? coc#float#scroll(0) : '<C-u>'", { expr = true, nowait = true })
map(
  'i',
  '<C-f>',
  "coc#float#has_scroll() ? '<C-r>=coc#float#scroll(1)<cr>' : '<Right>'",
  { expr = true, nowait = true }
)
map('i', '<C-b>', "coc#float#has_scroll() ? '<C-r>=coc#float#scroll(0)<cr>' : '<Left>'", {
  expr = true,
  nowait = true,
})

-- Use ctrl-s for selections ranges.
map({ 'n', 'x' }, '<C-s>', '<Plug>(coc-range-select)', { noremap = false })

-- Mappings for CoCList
map('n', '<space><space>', '<Cmd>CocFzfList<CR>')
map('n', '<space>D', '<Cmd>CocFzfList diagnostics<CR>')
map('n', '<space>d', '<Cmd>CocFzfList diagnostics --current-buf<CR>')
map('n', '<space>c', '<Cmd>CocFzfList commands<CR>')
map('n', '<space>e', '<Cmd>CocFzfList extensions<CR>')
map('n', '<space>l', '<Cmd>CocFzfList location<CR>')
map('n', '<space>o', '<Cmd>CocFzfList outline<CR>')
map('n', '<space>s', '<Cmd>CocFzfList symbols<CR>')
map('n', '<space>p', '<Cmd>CocFzfListResume<CR>')

-- Make <CR> auto-select the first completion item and notify coc.nvim to
-- format on enter, <CR> could be remapped by other vim plugin
_G.CR = function()
  local _, autopairs = pcall(require, 'nvim-autopairs')
  if vim.fn.pumvisible() ~= 0 then
    return vim.fn['coc#_select_confirm']()
  else
    return autopairs.autopairs_cr()
  end
end
map('i', '<cr>', 'v:lua.CR()', { expr = true })
