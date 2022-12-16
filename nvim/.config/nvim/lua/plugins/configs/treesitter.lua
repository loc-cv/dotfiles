local M = {}

local ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not ok then
  return
end

M.setup_ts = function()
  treesitter.setup({
    ensure_installed = {
      'lua',
      'javascript',
      'typescript',
      'tsx',
      'html',
      'css',
      'scss',
      'jsdoc',
      'json',
      'jsonc',
      'markdown',
      'c_sharp',
      'ruby',
    },

    highlight = {
      enable = true,
      disable = { 'vim', 'html' },
      additional_vim_regex_highlighting = false,
    },

    indent = {
      enable = false,
    },

    -- endwise = {
    --   enable = true,
    -- },
  })
end

M.setup_context_commentstring = function()
  treesitter.setup({
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },
  })
end

M.setup_autotag = function()
  treesitter.setup({
    autotag = {
      enable = true,
    },
  })
end

M.setup_textobjects = function()
  treesitter.setup({
    textobjects = {
      select = {
        enable = true,

        -- Automatically jump forward to textobj, similar to targets.vim
        lookahead = true,

        keymaps = {
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
          ['ac'] = '@class.outer',
          ['ic'] = '@class.inner',
        },
      },
    },
  })
end

return M
