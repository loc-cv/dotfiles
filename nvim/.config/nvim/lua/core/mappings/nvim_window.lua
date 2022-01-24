local utils = require 'core.utils'
local map = utils.map

map('n', '<space>w', [[<cmd>lua require("nvim-window").pick()<cr>]])
