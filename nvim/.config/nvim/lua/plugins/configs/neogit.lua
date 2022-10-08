local M = {}

M.setup = function()
  local ok, neogit = pcall(require, 'neogit')
  if not ok then
    return
  end

  neogit.setup({
    signs = {
      -- { CLOSED, OPENED }
      section = { '❯', '' },
      item = { '❯', '' },
      hunk = { '', '' },
    },
    integrations = {
      diffview = true,
    },
  })
end

return M
