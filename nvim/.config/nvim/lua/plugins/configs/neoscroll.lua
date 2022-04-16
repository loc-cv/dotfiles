local M = {}

M.setup = function()
  local ok, neoscroll = pcall(require, "neoscroll")
  if not ok then
    return
  end
  neoscroll.setup()
end

return M
