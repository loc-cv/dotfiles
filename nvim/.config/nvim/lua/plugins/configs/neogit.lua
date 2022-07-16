local M = {}

M.setup = function()
  local ok, neogit = pcall(require, 'neogit')
  if not ok then
    return
  end

  neogit.setup({
    integrations = {
      diffview = false,
    },
  })
end

return M
