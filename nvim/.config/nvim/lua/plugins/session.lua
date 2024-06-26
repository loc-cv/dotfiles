return {
  {
    "rmagatti/auto-session",
    config = function()
      local close_unwanted_wins = function()
        -- vim.cmd({ cmd = 'TSContextDisable' })
        for _, win in ipairs(vim.api.nvim_list_wins()) do
          -- Close all floating windows before saving
          local config = vim.api.nvim_win_get_config(win)
          if config.relative ~= "" then
            vim.api.nvim_win_close(win, false)
          end

          -- Close all special buffers before savings
          local excluded_filetypes = { "coc-explorer", "packer", "coctree", "NvimTree" }
          local buf = vim.api.nvim_win_get_buf(win)
          local buf_ft = vim.api.nvim_get_option_value("filetype", { buf = buf })
          if vim.tbl_contains(excluded_filetypes, buf_ft) then
            vim.api.nvim_win_close(win, false)
          end
        end
      end

      require("auto-session").setup({
        pre_save_cmds = { close_unwanted_wins },
      })
    end,
  },
}
