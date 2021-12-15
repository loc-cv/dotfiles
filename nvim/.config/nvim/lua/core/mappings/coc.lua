local utils = require "core.utils"
local map = utils.map
_G.coc_utils = require "plugins.configs.coc"

-- coc-explorer
map("n", "<C-n>", "<Cmd>CocCommand explorer<CR><Cmd>sleep 10ms<cr><C-w>=")

-- coc-prettier
map("n", "<C-i>", "<Cmd>CocCommand prettier.formatFile<Cr>")

-- coc-snippet
vim.g.coc_snippet_next = "<Tab>"
vim.g.coc_snippet_prev = "<S-Tab>"

-- Use <C-space> to trigger completion
map("i", "<C-space>", "coc#refresh()", { expr = true })

-- Use <C-j> and <C-k> to navigate the completion list
map("i", "<C-j>", 'pumvisible() ? "<C-n>" : "<Tab>"', { expr = true })
map("i", "<C-k>", 'pumvisible() ? "<C-p>" : "<S-Tab>"', { expr = true })

-- Use `[g` and `]g` to navigate diagnostics
map("n", "[d", "<Plug>(coc-diagnostic-prev)", { noremap = false })
map("n", "]d", "<Plug>(coc-diagnostic-next)", { noremap = false })

-- GOTO code navigation
map("n", "gd", "<Plug>(coc-definition)", { noremap = false })
map("n", "gy", "<Plug>(coc-type-definition)", { noremap = false })
map("n", "gi", "<Plug>(coc-implementation)", { noremap = false })
map("n", "gr", "<Plug>(coc-references)", { noremap = false })

-- Use gh to show documentation in preview window
map("n", "gh", "<CMD>lua require('plugins.configs.coc').show_docs()<CR>")

-- Symbol renaming
map("n", "<space>rn", "<Plug>(coc-rename)", { noremap = false })

-- Formatting selected code
map("x", "<space>fm", "<Plug>(coc-format-selected)", { noremap = false })
map("n", "<space>fm", "<Plug>(coc-format-selected)", { noremap = false })

-- Applying code action to the selected region
map("x", "<space>a", "<Plug>(coc-codeaction-selected)", { noremap = false })
map("n", "<space>a", "<Plug>(coc-codeaction-selected)", { noremap = false })

-- Applying code action to the current buffer
map("n", "<space>A", "<Plug>(coc-codeaction)", { noremap = false })

-- Apply autofix to problem on the current line.
map("n", "<space>qf", "<Plug>(coc-fix-current)", { noremap = false })

-- Map function and class text objects
-- NOTE: Requires 'textDocument.documentSymbol' support from the language server.
map("x", "if", "<Plug>(coc-funcobj-i)", { noremap = false })
map("o", "if", "<Plug>(coc-funcobj-i)", { noremap = false })
map("x", "af", "<Plug>(coc-funcobj-a)", { noremap = false })
map("o", "af", "<Plug>(coc-funcobj-a)", { noremap = false })
map("x", "ic", "<Plug>(coc-classobj-i)", { noremap = false })
map("o", "ic", "<Plug>(coc-classobj-i)", { noremap = false })
map("x", "ac", "<Plug>(coc-classobj-a)", { noremap = false })
map("o", "ac", "<Plug>(coc-classobj-a)", { noremap = false })

-- Remap <C-d> and <C-u> for scroll float windows/popups.
map("n", "<C-d>", "coc#float#has_scroll() ? coc#float#scroll(1) : '<C-d>'", { expr = true, nowait = true })
map("n", "<C-u>", "coc#float#has_scroll() ? coc#float#scroll(0) : '<C-u>'", { expr = true, nowait = true })
map("v", "<C-d>", "coc#float#has_scroll() ? coc#float#scroll(1) : '<C-d>'", { expr = true, nowait = true })
map("v", "<C-u>", "coc#float#has_scroll() ? coc#float#scroll(0) : '<C-u>'", { expr = true, nowait = true })
map(
  "i",
  "<C-d>",
  "coc#float#has_scroll() ? '<C-r>=coc#float#scroll(1)<cr>' : '<Right>'",
  { expr = true, nowait = true }
)
map("i", "<C-u>", "coc#float#has_scroll() ? '<C-r>=coc#float#scroll(0)<cr>' : '<Left>'", {
  expr = true,
  nowait = true,
})

-- Use ctrl-s for selections ranges.
map("n", "<C-s>", "<Plug>(coc-range-select)", { noremap = false })
map("x", "<C-s>", "<Plug>(coc-range-select)", { noremap = false })

-- Mappings for CoCList
map("n", "<space><space>", "<Cmd>CocFzfList<CR>")
map("n", "<space>D", "<Cmd>CocFzfList diagnostics<CR>")
map("n", "<space>d", "<Cmd>CocFzfList diagnostics --current-buf<CR>")
map("n", "<space>c", "<Cmd>CocFzfList commands<CR>")
map("n", "<space>e", "<Cmd>CocFzfList extensions<CR>")
map("n", "<space>l", "<Cmd>CocFzfList location<CR>")
map("n", "<space>o", "<Cmd>CocFzfList outline<CR>")
map("n", "<space>s", "<Cmd>CocFzfList symbols<CR>")
map("n", "<space>p", "<Cmd>CocFzfListResume<CR>")

-- Make <CR> auto-select the first completion item and notify coc.nvim to
-- format on enter, <CR> could be remapped by other vim plugin
map("i", "<cr>", "v:lua.coc_utils.CR()", { expr = true })
