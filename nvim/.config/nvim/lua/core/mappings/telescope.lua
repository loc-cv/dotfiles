local utils = require "core.utils"
local map = utils.map

map("n", "<C-p>t", [[<Cmd>Telescope<CR>]])
map("n", "<C-p>f", [[<Cmd>Telescope find_files<CR>]])
map("n", "<C-p>b", [[<Cmd>Telescope buffers<CR>]])
map("n", "<C-p>r", [[<Cmd>Telescope live_grep<CR>]])
map("n", "<C-p>h", [[<Cmd>Telescope help_tags<CR>]])
map("n", "<C-p>e", [[<Cmd>Telescope emoji<CR>]])
map("n", "<C-p>i", [[<Cmd>Telescope media_files<CR>]])
