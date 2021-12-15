local utils = require "core.utils"
local map = utils.map

map("n", "<C-q>c", [[<Cmd>FloatermNew<CR>]])
map("t", "<C-q>c", [[<C-\><C-n><Cmd>FloatermNew<CR>]])
map("n", "<C-q>p", [[<Cmd>FloatermPrev<CR>]])
map("t", "<C-q>p", [[<C-\><C-n><Cmd>FloatermPrev<CR>]])
map("n", "<C-q>n", [[<Cmd>FloatermNext<CR>]])
map("t", "<C-q>n", [[<C-\><C-n><Cmd>FloatermNext<CR>]])
map("n", "<C-q>t", [[<Cmd>FloatermToggle<CR>]])
map("t", "<C-q>t", [[<C-\><C-n><Cmd>FloatermToggle<CR>]])
map("n", "<C-q>h", [[<Cmd>FloatermShow<CR><C-\><C-n><Cmd>FloatermHide<CR>]])
map("t", "<C-q>h", [[<C-\><C-n><Cmd>FloatermHide<CR>]])
map("n", "<C-q>k", [[<Cmd>FloatermKill<CR><Cmd>FloatermShow!<CR>]])
map("t", "<C-q>k", [[<C-\><C-n><Cmd>FloatermKill<CR><Cmd>FloatermShow!<CR>]])
map("t", "<C-h>", [[<C-\><C-n><C-w>h]])

-- Clear terminal
map(
  "t",
  "<C-l>",
  [[<C-\><C-n><Cmd>set scrollback=1<CR><Cmd>sleep 10ms<CR><Cmd>set scrollback=10000<CR>i<C-l><C-\><C-n><Cmd>FloatermHide<CR><Cmd>FloatermShow<CR><C-l>]]
)
