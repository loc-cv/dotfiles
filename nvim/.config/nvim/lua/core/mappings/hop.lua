local utils = require "core.utils"
local map = utils.map

map("", "z/", "<cmd>lua require'hop'.hint_char1()<cr>")
map("", "z.", "<cmd>lua require'hop'.hint_lines()<cr>")
