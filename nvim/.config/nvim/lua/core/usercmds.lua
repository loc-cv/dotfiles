local M = {}

local configs = {
  -- packer.nvim
  packer = function()
    local ok, packer = pcall(require, 'packer')
    if not ok then
      return
    end

    -- Add Packer commands because we are not loading it at startup
    local packer_cmds = { 'Compile', 'Install', 'Update', 'Sync', 'Clean', 'Status' }
    for _, cmd in ipairs(packer_cmds) do
      vim.api.nvim_create_user_command('Packer' .. cmd, function()
        require('plugins')
        packer[vim.fn.tolower(cmd)]()
      end, {})
    end
  end,

  -- vim-fugitive
  fugitive = function()
    vim.api.nvim_create_user_command('V', 'vertical G', {})
  end,
}

M.init = function()
  -- Load plugins related user cmds
  for _, config in pairs(configs) do
    config()
  end
end

return M
