local utils = require "core.utils"
local map = utils.map

map("n", "<space>w", function()
  require("nvim-window").pick()
end)
