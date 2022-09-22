local ok, packer = pcall(require, 'packer')
if not ok then
  return
end

local use = packer.use

return packer.startup({
  function()
    -- Packer himself
    use('wbthomason/packer.nvim')

    -- Better performance for Neovim
    use('lewis6991/impatient.nvim')

    -- Make Neovim look good
    use('kyazdani42/nvim-web-devicons')
    use('tomasiser/vim-code-dark')
    use({
      'feline-nvim/feline.nvim',
      config = function()
        require('plugins.configs.feline').setup()
      end,
    })

    -- Lsp and friends
    use({
      'neoclide/coc.nvim',
      branch = 'release',
      config = function()
        vim.g.coc_max_treeview_width = 100
        vim.g.coc_global_extensions = {
          'coc-html',
          'coc-css',
          'coc-emmet',
          'coc-tsserver',
          'coc-json',
          'coc-prettier',
          'coc-eslint',
          'coc-snippets',
          'coc-explorer',
          'coc-sumneko-lua',
          'coc-stylua',
          -- '@yaegassy/coc-tailwindcss3',
          -- 'coc-styled-components',
        }
      end,
    })

    -- Snippet
    use({
      'rafamadriz/friendly-snippets',
      after = 'coc.nvim',
    })

    -- Document generator
    use({
      'kkoomen/vim-doge',
      run = ':call doge#install()',
      config = function()
        vim.g.doge_javascript_settings = {
          destructuring_props = 1,
          omit_redundant_param_types = 1,
        }
      end,
    })

    -- Fuzzy finder
    use({
      'ibhagwan/fzf-lua',
      cmd = { 'FzfLua' },
      config = function()
        require('plugins.configs.fzf-lua').setup()
      end,
    })

    -- Terminal
    use({
      'voldikss/vim-floaterm',
      cmd = {
        'FloatermNew',
        'FloatermPrev',
        'FloatermNext',
        'FloatermToggle',
        'FloatermHide',
        'FloatermKill',
        'FloatermShow',
      },
      config = function()
        vim.g.floaterm_wintype = 'float'
        vim.g.floaterm_position = 'topright'
        vim.g.floaterm_title = ' TERMINAL: $1/$2 '
        vim.g.floaterm_width = 0.5
        vim.g.floaterm_height = 0.99
      end,
    })

    -- Git
    use({
      'lewis6991/gitsigns.nvim',
      config = function()
        require('plugins.configs.gitsigns').setup()
      end,
    })
    use('tpope/vim-fugitive')

    -- Commenting code
    use({
      'numToStr/Comment.nvim',
      after = 'nvim-ts-context-commentstring',
      config = function()
        require('plugins.configs.comment').setup()
      end,
    })

    -- Syntax highlighting (and more)
    use({
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      config = function()
        require('plugins.configs.treesitter').setup_ts()
      end,
    })
    use('sheerun/vim-polyglot')

    -- Set the comment string based on the cursor location in a file
    use({
      'JoosepAlviste/nvim-ts-context-commentstring',
      requires = 'nvim-treesitter/nvim-treesitter',
      after = 'nvim-treesitter',
      config = function()
        require('plugins.configs.treesitter').setup_context_commentstring()
      end,
    })

    -- Use treesitter to auto close and auto rename HTML tags
    use({
      'windwp/nvim-ts-autotag',
      requires = 'nvim-treesitter/nvim-treesitter',
      after = 'nvim-treesitter',
      config = function()
        require('plugins.configs.treesitter').setup_autotag()
      end,
    })

    -- Show code context
    use({
      'nvim-treesitter/nvim-treesitter-context',
      requires = 'nvim-treesitter/nvim-treesitter',
      after = 'nvim-treesitter',
    })

    -- Autopairs
    use({
      'windwp/nvim-autopairs',
      event = 'InsertEnter',
      config = function()
        require('plugins.configs.autopairs').setup()
      end,
    })

    -- Text objects for entire buffer
    use({
      'kana/vim-textobj-entire',
      requires = 'kana/vim-textobj-user',
    })

    -- Indent guides for Neovim
    use({
      'lukas-reineke/indent-blankline.nvim',
      config = function()
        require('plugins.configs.indent-blankline').setup()
      end,
    })

    -- Surround
    use({
      'machakann/vim-sandwich',
      config = function()
        vim.cmd('runtime macros/sandwich/keymap/surround.vim')
      end,
    })

    -- Make the yanked region apparent
    use({
      'machakann/vim-highlightedyank',
      config = function()
        vim.g.highlightedyank_highlight_duration = 300
      end,
    })

    -- Easy motions / navigations
    use({
      'mrjones2014/smart-splits.nvim',
      module = 'smart-splits',
    })
    use({
      'https://gitlab.com/yorickpeterse/nvim-window.git',
      module = 'nvim-window',
      config = function()
        require('plugins.configs.window').setup()
      end,
    })
    use({
      'christoomey/vim-tmux-navigator',
      config = function()
        vim.g.tmux_navigator_disable_when_zoomed = 1
      end,
    })

    -- Buffers management
    use({
      'Asheq/close-buffers.vim',
      cmd = { 'Bdelete', 'Bwipeout' },
    })

    -- Search
    use('nelstrom/vim-visual-star-search')

    -- Markdown
    use({
      'iamcco/markdown-preview.nvim',
      run = 'cd app && npm install',
      setup = function()
        vim.g.mkdp_filetypes = { 'markdown' }
      end,
      ft = { 'markdown' },
    })

    -- Move lines and selections
    use('matze/vim-move')

    -- Trailing whitespaces
    use('ntpeters/vim-better-whitespace')

    -- Sessions
    use({
      'rmagatti/auto-session',
      config = function()
        require('plugins.configs.session').setup()
      end,
    })

    -- Startup time
    use({
      'dstein64/vim-startuptime',
      cmd = { 'StartupTime' },
    })

    -- Colors related stuff
    use({
      'rrethy/vim-hexokinase',
      run = 'make hexokinase',
      config = function()
        vim.g.Hexokinase_highlighters = { 'backgroundfull' }
      end,
    })

    -- Scrolling
    use('psliwka/vim-smoothie')

    -- Miscs
    use('lambdalisue/suda.vim')
  end,
  config = {
    compile_path = vim.fn.stdpath('config') .. '/lua/plugins/packer_compiled.lua',
    auto_clean = true,
    compile_on_sync = true,
  },
})
