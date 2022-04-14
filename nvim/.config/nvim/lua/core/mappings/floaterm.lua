local utils = require 'core.utils'
local map = utils.map

map('n', '<C-q>c', [[<cmd>FloatermNew<cr>]])
map('t', '<C-q>c', [[<C-\><C-n><cmd>FloatermNew<cr>]])
map('n', '<C-q>p', [[<cmd>FloatermPrev<cr>]])
map('t', '<C-q>p', [[<C-\><C-n><cmd>FloatermPrev<cr>]])
map('n', '<C-q>n', [[<cmd>FloatermNext<cr>]])
map('t', '<C-q>n', [[<C-\><C-n><cmd>FloatermNext<cr>]])
map('n', '<C-q>t', [[<cmd>FloatermToggle<cr>]])
map('t', '<C-q>t', [[<C-\><C-n><cmd>FloatermToggle<cr>]])
map('n', '<C-q>h', [[<cmd>FloatermShow<cr><C-\><C-n><cmd>FloatermHide<cr>]])
map('t', '<C-q>h', [[<C-\><C-n><cmd>FloatermHide<cr>]])
map('n', '<C-q>k', [[<cmd>FloatermKill<cr><cmd>FloatermShow!<cr>]])
map('t', '<C-q>k', [[<C-\><C-n><cmd>FloatermKill<cr><cmd>FloatermShow!<cr>]])
map('t', '<C-h>', [[<C-\><C-n><C-w>h]])

-- Clear terminal
map(
  't',
  '<C-l>',
  [[<C-\><C-n><cmd>set scrollback=1<cr><cmd>sleep 10ms<cr><cmd>set scrollback=10000<cr>i<C-l><C-\><C-n><cmd>FloatermHide<cr><cmd>FloatermShow<cr><C-l>]]
)
