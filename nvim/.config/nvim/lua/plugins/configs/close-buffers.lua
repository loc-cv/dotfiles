local M = {}

M.setup = function()
  local ok, cb = pcall(require, 'close_buffers')
  if not ok then
    return
  end

  cb.setup({
    filetype_ignore = { 'floaterm' },
  })
end

return M
