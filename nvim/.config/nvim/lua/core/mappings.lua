local M = {}
local map = require('core.utils').map

local configs = {
  -- Floaterm
  floaterm = function()
    map('n', '<C-q>c', [[<cmd>FloatermNew<cr>]])
    map('t', '<C-q>c', [[<C-\><C-n><cmd>FloatermNew<cr>]])
    map('n', '<C-q>p', [[<cmd>FloatermPrev<cr>]])
    map('t', '<C-q>p', [[<C-\><C-n><cmd>FloatermPrev<cr>]])
    map('n', '<C-q>n', [[<cmd>FloatermNext<cr>]])
    map('t', '<C-q>n', [[<C-\><C-n><cmd>FloatermNext<cr>]])
    map('n', '<C-q>t', [[<cmd>FloatermToggle<cr>]])
    map('t', '<C-q>t', [[<C-\><C-n><cmd>FloatermToggle<cr>]])
    map('n', '<C-q>h', [[<cmd>FloatermHide!<cr>]])
    map('t', '<C-q>h', [[<C-\><C-n><cmd>FloatermHide!<cr>]])
    map('n', '<C-q>k', [[<cmd>FloatermKill<cr><cmd>FloatermShow!<cr>]])
    map('t', '<C-q>k', [[<C-\><C-n><cmd>FloatermKill<cr><cmd>FloatermShow!<cr>]])
    map('t', '<C-h>', [[<C-\><C-n><C-w>h]])

    -- Clear terminal (Only work for floaterm)
    map(
      't',
      '<C-l>',
      [[<C-\><C-n><cmd>set scrollback=1<cr><cmd>sleep 10ms<cr><cmd>set scrollback=10000<cr>i<C-l><C-\><C-n><cmd>FloatermHide<cr><cmd>FloatermShow<cr><C-l>]]
    )
  end,

  -- Nvim_window
  nvim_window = function()
    map('n', '<space>w', function()
      require('nvim-window').pick()
    end)
  end,

  -- Smart-splits
  smart_splits = function()
    -- resizing splits
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

    -- moving between splits
    map('n', '<C-h>', function()
      require('smart-splits').move_cursor_left()
    end)
    map('n', '<C-j>', function()
      require('smart-splits').move_cursor_down()
    end)
    map('n', '<C-k>', function()
      require('smart-splits').move_cursor_up()
    end)
    map('n', '<C-l>', function()
      require('smart-splits').move_cursor_right()
    end)
  end,

  -- Fzf-lua
  fzf_lua = function()
    map('n', '<C-p>p', [[<cmd>FzfLua builtin<cr>]])
    map('n', '<C-p>f', [[<cmd>FzfLua files<cr>]])
    map('n', '<C-p>b', [[<cmd>FzfLua buffers<cr>]])
    map('n', '<C-p>r', [[<cmd>FzfLua live_grep_native<cr>]])
    map('n', '<C-p>h', [[<cmd>FzfLua help_tags<cr>]])
  end,
}

M.init = function()
  -- Better indenting in visual mode
  map('v', '<', '<gv')
  map('v', '>', '>gv')

  -- Make <C-w> work as expected in prompt window
  map('i', '<C-W>', '<C-S-W>')

  -- Better movement between wrapped lines
  map('n', 'j', 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
  map('n', 'k', 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })

  -- Don't copy the replaced text after pasting in visual mode
  map('v', 'p', '"_dP')

  -- Load plugins mappings
  for _, config in pairs(configs) do
    config()
  end
end

return M
