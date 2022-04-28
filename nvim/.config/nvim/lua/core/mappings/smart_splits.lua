local utils = require "core.utils"
local map = utils.map

-- resizing splits
map("n", "<A-H>", function()
  require("smart-splits").resize_left()
end)
map("n", "<A-J>", function()
  require("smart-splits").resize_down()
end)
map("n", "<A-K>", function()
  require("smart-splits").resize_up()
end)
map("n", "<A-L>", function()
  require("smart-splits").resize_right()
end)

-- moving between splits
map("n", "<C-h>", function()
  require("smart-splits").move_cursor_left()
end)
map("n", "<C-j>", function()
  require("smart-splits").move_cursor_down()
end)
map("n", "<C-k>", function()
  require("smart-splits").move_cursor_up()
end)
map("n", "<C-l>", function()
  require("smart-splits").move_cursor_right()
end)
