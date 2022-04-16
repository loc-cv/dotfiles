local g = vim.g

g.floaterm_wintype = "float"
g.floaterm_position = "bottomright"
g.floaterm_title = " TERMINAL: $1/$2 "
g.floaterm_width = 0.4
g.floaterm_height = vim.api.nvim_win_get_height(0)
