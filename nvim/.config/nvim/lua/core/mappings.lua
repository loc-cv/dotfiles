---@diagnostic disable: missing-parameter
local M = {}
local map = require('core.utils').map

local configs = {
  -- coc.nvim
  coc = function()
    -- coc-snippet
    vim.g.coc_snippet_next = '<C-f>'
    vim.g.coc_snippet_prev = '<C-b>'

    -- Use <C-space> to trigger completion
    map('i', '<C-space>', function()
      return vim.fn['coc#refresh']()
    end, { expr = true })

    -- Make <CR> auto-select the first completion item and notify coc.nvim to ...
    -- ... format on enter, <CR> could be remapped by other vim plugin
    _G.CR = function()
      local _, autopairs = pcall(require, 'nvim-autopairs')
      if vim.fn['coc#pum#visible']() ~= 0 then
        return vim.fn['coc#pum#confirm']()
      else
        return autopairs.autopairs_cr()
      end
    end
    map('i', '<CR>', 'v:lua.CR()', { expr = true, replace_keycodes = false })

    -- Use <C-j> and <C-k> to navigate the completion list
    map('i', '<C-j>', "coc#pum#visible() ? coc#pum#next(1) : '<C-j>'", { expr = true, replace_keycodes = false })
    map('i', '<C-k>', "coc#pum#visible() ? coc#pum#prev(1) : '<C-k>'", { expr = true, replace_keycodes = false })

    -- Use `[d` and `]d` to navigate diagnostics
    map('n', '[d', '<Plug>(coc-diagnostic-prev)')
    map('n', ']d', '<Plug>(coc-diagnostic-next)')

    -- GOTO code navigation
    -- map('n', 'gd', '<Plug>(coc-definition)')
    -- map('n', 'gy', '<Plug>(coc-type-definition)')
    -- map('n', 'gi', '<Plug>(coc-implementation)')
    -- map('n', 'gr', '<Plug>(coc-references)')

    -- Use K to show documentation in preview window
    function _G.show_docs()
      local cw = vim.fn.expand('<cword>')
      if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
      elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
      else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
      end
    end
    map('n', 'K', '<CMD>lua _G.show_docs()<CR>')

    -- Symbol renaming
    map('n', '<leader>lrn', '<Plug>(coc-rename)')

    -- Format selected code
    map({ 'x', 'n' }, '<leader>lfm', '<Plug>(coc-format-selected)')

    -- Apply code action to the selected region
    map({ 'x', 'n' }, '<leader>lca', '<Plug>(coc-codeaction-selected)')

    -- Apply code action to the current buffer
    map('n', '<leader>lcA', '<Plug>(coc-codeaction-source)')

    -- Apply autofix to problem on the current line
    map('n', '<leader>laf', '<Plug>(coc-fix-current)')

    -- Run the Code Lens action on the current line
    map('n', '<leader>lcl', '<Plug>(coc-codelens-action)')

    -- Apply refactor code actions
    map({ 'x', 'n' }, '<leader>lrf', '<Plug>(coc-codeaction-refactor-selected)')
    map('n', '<leader>lrF', '<Plug>(coc-codeaction-refactor)')

    -- Map function and class text objects
    -- NOTE: Requires 'textDocument.documentSymbol' support from the language server
    -- map({ 'x', 'o' }, 'if', '<Plug>(coc-funcobj-i)')
    -- map({ 'x', 'o' }, 'af', '<Plug>(coc-funcobj-a)')
    -- map({ 'x', 'o' }, 'ic', '<Plug>(coc-classobj-i)')
    -- map({ 'x', 'o' }, 'ac', '<Plug>(coc-classobj-a)')

    -- Remap <C-e> and <C-y> for scroll float windows/popups
    map({ 'n', 'v' }, '<C-e>', "coc#float#has_scroll() ? coc#float#scroll(1) : '<C-e>'", { expr = true, nowait = true })
    map({ 'n', 'v' }, '<C-y>', "coc#float#has_scroll() ? coc#float#scroll(0) : '<C-y>'", { expr = true, nowait = true })
    map('i', '<C-e>', "coc#float#has_scroll() ? '<C-r>=coc#float#scroll(1)<cr>' : '<C-e>'", {
      expr = true,
      nowait = true,
    })
    map('i', '<C-y>', "coc#float#has_scroll() ? '<C-r>=coc#float#scroll(0)<cr>' : '<C-y>'", {
      expr = true,
      nowait = true,
    })

    -- Use <C-q> to close coc floating window/popup in insert mode
    map(
      'i',
      '<C-q>',
      "coc#float#has_float() ? '<C-r>=coc#float#close_all()<BS><cr>' : '<C-q>'",
      { expr = true, nowait = true }
    )

    -- Use ctrl-s for selections ranges
    map({ 'n', 'x' }, '<C-s>', '<Plug>(coc-range-select)')

    -- Use ctrl-s in insert mode to trigger signature help
    map('i', '<C-s>', "<C-r>=CocActionAsync('showSignatureHelp')<CR>")

    -- Mappings for CoCList
    map('n', '<leader>lli', '<CMD>CocList<CR>', { nowait = true })
    map('n', '<leader>lex', '<CMD>CocList extensions<CR>', { nowait = true })
    -- map('n', '<leader>lol', '<CMD>CocList -A outline<CR>', { nowait = true })
    -- map('n', '<C-m>c', '<CMD>CocList commands<CR>', { nowait = true })
    -- map('n', '<C-m>d', '<CMD>CocList -A diagnostics<CR>', { nowait = true })
    -- map('n', '<C-m>l', '<CMD>CocList -A location<CR>', { nowait = true })
    -- map('n', '<C-m>s', '<CMD>CocList -A -I symbols<CR>', { nowait = true })

    local toggleOutline = function()
      for _, win in ipairs(vim.api.nvim_list_wins()) do
        local buf = vim.api.nvim_win_get_buf(win)
        local buf_ft = vim.api.nvim_buf_get_option(buf, 'filetype')
        if buf_ft == 'coctree' then
          vim.fn.CocAction('hideOutline')
          return
        end
      end
      vim.fn.CocAction('showOutline')
    end
    map('n', '<leader>lol', toggleOutline, { nowait = true })
  end,

  -- telescope-coc.nvim
  telescope_coc = function()
    map('n', 'gd', [[<Cmd>Telescope coc definitions<cr>]])
    map('n', 'gy', [[<cmd>Telescope coc type_definitions<cr>]])
    map('n', 'gi', [[<cmd>Telescope coc implementations<cr>]])
    map('n', 'gr', [[<CMD>Telescope coc references<CR>]])
    map('n', 'gD', [[<cmd>Telescope coc declarations<cr>]])
    map('n', '<leader>lcm', [[<cmd>Telescope coc commands<cr>]])
    map('n', '<leader>lda', [[<cmd>Telescope coc diagnostics<cr>]])
    map('n', '<leader>ldA', [[<cmd>Telescope coc workspace_diagnostics<cr>]])
    map('n', '<leader>llo', [[<cmd>Telescope coc locations<cr>]])
    map('n', '<leader>lds', [[<cmd>Telescope coc document_symbols<cr>]])
    map('n', '<leader>lws', [[<cmd>Telescope coc workspace_symbols<cr>]])
  end,

  -- telescope.nvim
  telescope = function()
    map('n', '<leader>fp', [[<CMD>Telescope builtin<CR>]])
    map('n', '<leader>ff', [[<CMD>Telescope find_files<CR>]])
    map('n', '<leader>fb', [[<CMD>Telescope buffers<CR>]])
    map('n', '<leader>fr', [[<CMD>Telescope live_grep<CR>]])
    map('n', '<leader>fh', [[<CMD>Telescope help_tags<CR>]])
  end,

  -- vim-floaterm
  floaterm = function()
    map('n', '<C-q>c', [[<CMD>FloatermNew<CR>]])
    map('t', '<C-q>c', [[<C-\><C-n><cmd>FloatermNew<CR>]])
    map('n', '<C-q>p', [[<cmd>FloatermPrev<CR>]])
    map('t', '<C-q>p', [[<C-\><C-n><CMD>FloatermPrev<CR>]])
    map('n', '<C-q>n', [[<CMD>FloatermNext<CR>]])
    map('t', '<C-q>n', [[<C-\><C-n><CMD>FloatermNext<CR>]])
    map('n', '<C-q>t', [[<CMD>FloatermToggle<CR>]])
    map('t', '<C-q>t', [[<C-\><C-n><CMD>FloatermToggle<CR>]])
    map('n', '<C-q>h', [[<CMD>FloatermHide!<CR>]])
    map('t', '<C-q>h', [[<C-\><C-n><CMD>FloatermHide!<CR>]])
    map('n', '<C-q>k', [[<CMD>FloatermKill<CR><CMD>FloatermShow!<CR>]])
    map('t', '<C-q>k', [[<C-\><C-n><CMD>FloatermKill<CR><CMD>FloatermShow!<CR>]])
    map('t', '<C-h>', [[<C-\><C-n><C-w>h]])

    -- Clear terminal (Only work for floaterm)
    map('t', '<C-l>', function()
      if vim.bo.filetype == 'floaterm' then
        return [[<C-\><C-n><CMD>set scrollback=1<CR><CMD>sleep 10ms<CR><CMD>set scrollback=10000<CR>i<C-l><C-\><C-n><CMD>FloatermHide<CR><CMD>FloatermShow<CR><C-l>]]
      end
      return [[<C-\><C-n><C-w>l]]
    end, { expr = true })
  end,

  -- nvim-window
  nvim_window = function()
    map('n', '<leader>w', function()
      require('nvim-window').pick()
    end)
  end,

  -- gitsigns.nvim
  gitsigns = function()
    local ok, gs = pcall(require, 'gitsigns')
    if not ok then
      return
    end
    map('n', ']c', function()
      if vim.wo.diff then
        return ']c'
      end
      vim.schedule(function()
        gs.next_hunk()
      end)
      return '<Ignore>'
    end, { expr = true })

    map('n', '[c', function()
      if vim.wo.diff then
        return '[c'
      end
      vim.schedule(function()
        gs.prev_hunk()
      end)
      return '<Ignore>'
    end, { expr = true })
  end,

  -- lazygit.nvim
  lazygit = function()
    map('n', '<leader>g', '<cmd>LazyGit<cr>')
  end,

  -- close-buffers.nvim
  close_buffers = function()
    map('n', '<leader>bc', function()
      require('close_buffers').wipe({ type = 'hidden' })
    end, { silent = false })
  end,

  -- nvim-tree.lua
  nvim_tree = function()
    local api = require('nvim-tree.api')
    map('n', '<leader>e', function()
      api.tree.toggle(nil, true)
    end)
  end,

  -- svart.nvim
  -- svart = function()
  --   map({ 'n', 'x', 'o' }, 'z/', [[<CMD>Svart<CR>]])
  -- end,
}

M.init = function()
  -- Change mapleader
  vim.g.mapleader = ' '

  -- Better indenting in visual mode
  map('v', '<', '<gv')
  map('v', '>', '>gv')

  -- Don't copy the replaced text after pasting in visual mode
  map('v', 'p', '"_dP')

  -- Better vertical movements
  map('n', 'j', [[v:count ? (v:count > 1 ? "m'" . v:count : '') . 'j' : 'gj']], { expr = true })
  map('n', 'k', [[v:count ? (v:count > 1 ? "m'" . v:count : '') . 'k' : 'gk']], { expr = true })

  -- Use <C-j> and <C-k> to navigate the completion list in command-line
  map('c', '<C-j>', '<C-n>', { silent = false })
  map('c', '<C-k>', '<C-p>', { silent = false })

  -- Use ALT-g and ALT-t to move to matches when searching
  -- map('c', '<M-g>', '<C-g>', { silent = false })
  -- map('c', '<M-t>', '<C-t>', { silent = false })

  -- map('t', '<C-[><C-[>', '<C-\\><C-n>')

  -- Load plugins mappings
  for _, config in pairs(configs) do
    config()
  end
end

return M
