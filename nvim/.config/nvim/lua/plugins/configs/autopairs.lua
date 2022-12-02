local M = {}

M.setup = function()
  local ok, npairs = pcall(require, 'nvim-autopairs')
  if not ok then
    return
  end

  npairs.setup({
    map_cr = false,
    map_c_h = true,
    map_c_w = true,
    fast_wrap = {}, -- use <M-e> to fast wrap
    break_undo = false,
  })

  -- local Rule = require('nvim-autopairs.rule')
  -- Add spaces between parentheses
  -- npairs.add_rules({
  --   Rule(' ', ' '):with_pair(function(opts)
  --     local pair = opts.line:sub(opts.col - 1, opts.col)
  --     return vim.tbl_contains({ '()', '[]', '{}' }, pair)
  --   end),
  --   Rule('( ', ' )')
  --     :with_pair(function()
  --       return false
  --     end)
  --     :with_move(function(opts)
  --       return opts.prev_char:match('.%)') ~= nil
  --     end)
  --     :use_key(')'),
  --   Rule('{ ', ' }')
  --     :with_pair(function()
  --       return false
  --     end)
  --     :with_move(function(opts)
  --       return opts.prev_char:match('.%}') ~= nil
  --     end)
  --     :use_key('}'),
  --   Rule('[ ', ' ]')
  --     :with_pair(function()
  --       return false
  --     end)
  --     :with_move(function(opts)
  --       return opts.prev_char:match('.%]') ~= nil
  --     end)
  --     :use_key(']'),
  -- })
end

return M
