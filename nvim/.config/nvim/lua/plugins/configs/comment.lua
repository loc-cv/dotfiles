local M = {}

M.setup = function()
  local ok, comment = pcall(require, 'Comment')
  if not ok then
    return
  end

  comment.setup({
    ignore = '^$',
    toggler = {
      block = 'gbb',
    },
    pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
  })
end

return M
