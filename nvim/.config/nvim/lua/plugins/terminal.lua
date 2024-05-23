local map_prefix = "<C-q>"

return {
  {
    "voldikss/vim-floaterm",
    cmd = {
      "FloatermNew",
      "FloatermPrev",
      "FloatermNext",
      "FloatermToggle",
      "FloatermHide",
      "FloatermKill",
      "FloatermShow",
    },
    keys = {
      { map_prefix .. "c", [[<CMD>FloatermNew<CR>]], mode = "n" },
      { map_prefix .. "c", [[<C-\><C-n><cmd>FloatermNew<CR>]], mode = "t" },
      { map_prefix .. "p", [[<cmd>FloatermPrev<CR>]], mode = "n" },
      { map_prefix .. "p", [[<C-\><C-n><CMD>FloatermPrev<CR>]], mode = "t" },
      { map_prefix .. "n", [[<CMD>FloatermNext<CR>]], mode = "n" },
      { map_prefix .. "n", [[<C-\><C-n><CMD>FloatermNext<CR>]], mode = "t" },
      { map_prefix .. "t", [[<CMD>FloatermToggle<CR>]], mode = "n" },
      { map_prefix .. "t", [[<C-\><C-n><CMD>FloatermToggle<CR>]], mode = "t" },
      { map_prefix .. "h", [[<CMD>FloatermHide!<CR>]], mode = "n" },
      { map_prefix .. "h", [[<C-\><C-n><CMD>FloatermHide!<CR>]], mode = "t" },
      { map_prefix .. "k", [[<CMD>FloatermKill<CR><CMD>FloatermShow!<CR>]], mode = "n" },
      { map_prefix .. "k", [[<C-\><C-n><CMD>FloatermKill<CR><CMD>FloatermShow!<CR>]], mode = "t" },
      { "<C-h>", [[<C-\><C-n><C-w>h]], mode = "t" },

      -- Clear terminal (Only work for floaterm)
      {
        "<C-l>",
        function()
          if vim.bo.filetype == "floaterm" then
            return [[<C-\><C-n><CMD>set scrollback=1<CR><CMD>sleep 10ms<CR><CMD>set scrollback=10000<CR>i<C-l><C-\><C-n><CMD>FloatermHide<CR><CMD>FloatermShow<CR><C-l>]]
          end
          return [[<C-\><C-n><C-w>l]]
        end,
        expr = true,
        mode = "t",
      },
    },
    init = function()
      -- vim.g.floaterm_wintype = "float"
      vim.g.floaterm_wintype = "vsplit"
      vim.g.floaterm_position = "botright"
      vim.g.floaterm_title = " TERMINAL: $1/$2 "
      vim.g.floaterm_width = 0.4
      -- vim.g.floaterm_height = 0.99
    end,
  },
}
