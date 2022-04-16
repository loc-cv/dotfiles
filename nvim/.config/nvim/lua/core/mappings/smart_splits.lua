local utils = require "core.utils"
local map = utils.map

-- resizing splits
map("n", "<A-H>", require("smart-splits").resize_left)
map("n", "<A-J>", require("smart-splits").resize_down)
map("n", "<A-K>", require("smart-splits").resize_up)
map("n", "<A-L>", require("smart-splits").resize_right)

-- moving between splits
map("n", "<C-h>", require("smart-splits").move_cursor_left)
map("n", "<C-j>", require("smart-splits").move_cursor_down)
map("n", "<C-k>", require("smart-splits").move_cursor_up)
map("n", "<C-l>", require("smart-splits").move_cursor_right)
