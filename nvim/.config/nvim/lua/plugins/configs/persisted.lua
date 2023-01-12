local M = {}

M.setup = function()
  local ok, persisted = pcall(require, 'persisted')
  if not ok then
    return
  end

  persisted.setup({
    autoload = false,
    autosave = true,
    use_git_branch = true,
    before_save = function()
      require('close_buffers').wipe({ type = 'hidden' })
      pcall(vim.cmd, 'NvimTreeClose')
    end,
    telescope = {
      before_source = function()
        require('close_buffers').wipe({ type = 'hidden' })
        vim.cmd({ cmd = 'SessionSave' })
      end,
    },
  })

  require('telescope').load_extension('persisted')
end

return M
