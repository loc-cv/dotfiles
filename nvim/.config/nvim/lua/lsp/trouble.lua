local M = {}

M.setup = function()
  local ok, trouble = pcall(require, 'trouble')
  if not ok then
    return
  end
  trouble.setup({
    action_keys = {
      open_split = { '<c-s>' },
      hover = 'gh',
    },
    use_diagnostic_signs = true,
  })
end

return M
