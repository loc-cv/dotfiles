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
      { "<C-q>c", [[<CMD>FloatermNew<CR>]], mode = "n" },
      { "<C-q>c", [[<C-\><C-n><cmd>FloatermNew<CR>]], mode = "t" },
      { "<C-q>p", [[<cmd>FloatermPrev<CR>]], mode = "n" },
      { "<C-q>p", [[<C-\><C-n><CMD>FloatermPrev<CR>]], mode = "t" },
      { "<C-q>n", [[<CMD>FloatermNext<CR>]], mode = "n" },
      { "<C-q>n", [[<C-\><C-n><CMD>FloatermNext<CR>]], mode = "t" },
      { "<C-q>t", [[<CMD>FloatermToggle<CR>]], mode = "n" },
      { "<C-q>t", [[<C-\><C-n><CMD>FloatermToggle<CR>]], mode = "t" },
      { "<C-q>h", [[<CMD>FloatermHide!<CR>]], mode = "n" },
      { "<C-q>h", [[<C-\><C-n><CMD>FloatermHide!<CR>]], mode = "t" },
      { "<C-q>k", [[<CMD>FloatermKill<CR><CMD>FloatermShow!<CR>]], mode = "n" },
      { "<C-q>k", [[<C-\><C-n><CMD>FloatermKill<CR><CMD>FloatermShow!<CR>]], mode = "t" },
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
      vim.g.floaterm_wintype = "float"
      vim.g.floaterm_position = "topright"
      vim.g.floaterm_title = " TERMINAL: $1/$2 "
      vim.g.floaterm_width = 0.5
      vim.g.floaterm_height = 0.99
    end,
    config = function()
      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("Floaterm", { clear = true }),
        pattern = "floaterm",
        command = "setlocal winblend=20",
      })
    end,
  },
}
