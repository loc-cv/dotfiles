---@diagnostic disable: missing-parameter
local map = require('core.utils').map

-- Better indenting in visual mode
map('v', '<', '<gv')
map('v', '>', '>gv')

-- Don't copy the replaced text after pasting in visual mode
map('v', 'p', '"_dP')

-- Better vertical movements
map('n', 'j', [[v:count ? (v:count > 1 ? "m'" . v:count : '') . 'j' : 'gj']], { expr = true })
map('n', 'k', [[v:count ? (v:count > 1 ? "m'" . v:count : '') . 'k' : 'gk']], { expr = true })

-- Use <C-j> and <C-k> to navigate the completion list in command-line
map('c', '<C-j>', '<C-n>', { silent = false })
map('c', '<C-k>', '<C-p>', { silent = false })

-- Use ALT-g and ALT-t to move to matches when searching
-- map('c', '<M-g>', '<C-g>', { silent = false })
-- map('c', '<M-t>', '<C-t>', { silent = false })

-- map('t', '<C-[><C-[>', '<C-\\><C-n>')
