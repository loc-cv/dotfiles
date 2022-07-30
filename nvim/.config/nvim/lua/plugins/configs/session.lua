local M = {}

local function close_unwanted_wins()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    -- Close all floating windows before saving
    local config = vim.api.nvim_win_get_config(win)
    if config.relative ~= '' then
      vim.api.nvim_win_close(win, false)
    end

    -- Close all special buffers before savings
    local excluded_filetypes = { 'coc-explorer' }
    local buf = vim.api.nvim_win_get_buf(win)
    local buf_ft = vim.api.nvim_buf_get_option(buf, 'filetype')
    if vim.tbl_contains(excluded_filetypes, buf_ft) then
      vim.api.nvim_win_close(win, false)
    end
  end
end

M.setup = function()
  local ok, auto_session = pcall(require, 'auto-session')
  if not ok then
    return
  end

  auto_session.setup({
    pre_save_cmds = { close_unwanted_wins },
  })
end

return M
