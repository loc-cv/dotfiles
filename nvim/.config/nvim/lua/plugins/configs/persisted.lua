local M = {}

M.setup = function()
  local ok, persisted = pcall(require, 'persisted')
  if not ok then
    return
  end

  persisted.setup({
    use_git_branch = true,
    before_save = function()
      require('close_buffers').wipe({ type = 'hidden' })
      vim.cmd({ cmd = 'NvimTreeClose' })
    end,
    telescope = {
      before_source = function()
        require('close_buffers').wipe({ type = 'hidden' })
        vim.cmd({ cmd = 'SessionSave' })
      end,
      -- after_source = function()
      --   require('close_buffers').wipe({ type = 'hidden' })
      -- end,
    },
  })

  require('telescope').load_extension('persisted')
end

return M
