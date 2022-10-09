local M = {}
local map = require('core.utils').map

local configs = {
  -- Lsp related mappings
  lsp = function()
    map('n', '[d', vim.diagnostic.goto_prev)
    map('n', ']d', vim.diagnostic.goto_next)
    map('n', 'gf', vim.diagnostic.open_float)
    map('n', 'K', vim.lsp.buf.hover)
    map('n', 'gs', vim.lsp.buf.signature_help)
    map('n', '<leader>ca', vim.lsp.buf.code_action)
    map('n', '<leader>rn', vim.lsp.buf.rename)
    map('n', '<leader>fm', function()
      vim.lsp.buf.format({ async = true })
    end)
    map('n', 'gr', [[<cmd>Telescope lsp_references<cr>]])
    map('n', 'gi', [[<cmd>Telescope lsp_implementations<cr>]])
    map('n', 'gy', [[<cmd>Telescope lsp_type_definitions<cr>]])
    map('n', 'gd', [[<cmd>Telescope lsp_definitions<cr>]])
    map('n', '<C-p>d', [[<cmd>Telescope diagnostics bufnr=0<cr>]])
    map('n', '<C-p>D', [[<cmd>Telescope diagnostics<cr>]])
    map('n', '<C-p>s', [[<cmd>Telescope lsp_document_symbols<cr>]])
    map('n', '<C-p>S', [[<cmd>Telescope lsp_workspace_symbols<cr>]])
  end,

  -- nvim-tree
  nvimtree = function()
    map('n', '<leader>e', [[<cmd>NvimTreeToggle<cr>]])
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

  -- smart-splits.nvim
  smart_splits = function()
    -- Resizing splits
    map('n', '<A-H>', function()
      require('smart-splits').resize_left()
    end)
    map('n', '<A-J>', function()
      require('smart-splits').resize_down()
    end)
    map('n', '<A-K>', function()
      require('smart-splits').resize_up()
    end)
    map('n', '<A-L>', function()
      require('smart-splits').resize_right()
    end)
  end,

  -- telescope.nvim
  telescope = function()
    map('n', '<C-p>p', [[<CMD>Telescope builtin<CR>]])
    map('n', '<C-p>f', [[<CMD>Telescope find_files<CR>]])
    map('n', '<C-p>b', [[<CMD>Telescope buffers<CR>]])
    map('n', '<C-p>r', [[<CMD>Telescope live_grep<CR>]])
    map('n', '<C-p>h', [[<CMD>Telescope help_tags<CR>]])
    map('n', '<C-p>t', [[<cmd>Telescope telescope-tabs list_tabs<cr>]])
  end,
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
  map('c', '<M-g>', '<C-g>', { silent = false })
  map('c', '<M-t>', '<C-t>', { silent = false })

  -- Load plugins mappings
  for _, config in pairs(configs) do
    config()
  end
end

return M
