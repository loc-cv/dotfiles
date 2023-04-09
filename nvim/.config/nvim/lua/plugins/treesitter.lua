return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
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
        'vue',
      },

      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },

      indent = {
        enable = false,
      },
    },
    config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)
    end,
  },
  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    dependencies = 'nvim-treesitter',
    opts = {
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },
    },
    config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)
    end,
  },
  {
    'windwp/nvim-ts-autotag',
    dependencies = 'nvim-treesitter',
    opts = {
      autotag = {
        enable = true,
      },
    },
    config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    dependencies = 'nvim-treesitter',
    opts = {
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
    },
    config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    dependencies = 'nvim-treesitter',
  },
  {
    'yioneko/nvim-yati',
    dependencies = 'nvim-treesitter',
    opts = {
      yati = {
        enable = true,
      },
    },
    config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)
    end,
  },
}
