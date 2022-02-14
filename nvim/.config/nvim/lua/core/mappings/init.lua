local utils = require 'core.utils'
local map = utils.map

-- Mappings for plugins
require 'core.mappings.coc'
require 'core.mappings.easy_align'
require 'core.mappings.floaterm'
require 'core.mappings.telescope'
require 'core.mappings.nvim_window'
require 'core.mappings.pounce'

-- Better movements
map('n', '<C-j>', '<C-w><C-j>')
map('n', '<C-k>', '<C-w><C-k>')
map('n', '<C-l>', '<C-w><C-l>')
map('n', '<C-h>', '<C-w><C-h>')

-- Better indenting in visual mode
map('v', '<', '<gv')
map('v', '>', '>gv')

-- Make <C-w> work as expected in prompt window
map('i', '<C-W>', '<C-S-W>')

-- Better movement between wrapped lines
map('n', 'j', 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
map('n', 'k', 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })

-- Don't copy the replaced text after pasting in visual mode
map('v', 'p', '"_dP')
