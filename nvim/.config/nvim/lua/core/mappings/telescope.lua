local utils = require "core.utils"
local map = utils.map

map("n", "<C-p>t", [[<cmd>Telescope<cr>]])
map("n", "<C-p>f", [[<cmd>Telescope find_files<cr>]])
map("n", "<C-p>b", [[<cmd>Telescope buffers<cr>]])
map("n", "<C-p>r", [[<cmd>Telescope live_grep<cr>]])
map("n", "<C-p>h", [[<cmd>Telescope help_tags<cr>]])
map("n", "<C-p>e", [[<cmd>Telescope emoji<cr>]])
map("n", "<C-p>i", [[<cmd>Telescope media_files<cr>]])
