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

    -- Sessions
    use({
      'rmagatti/auto-session',
      config = function()
        require('plugins.configs.session').setup()
      end,
    })

    -- Lsp and friends
    use({
      'neoclide/coc.nvim',
      branch = 'release',
      config = function()
        require('plugins.configs.coc').setup()
      end,
    })
    use('xiyaowong/coc-symbol-line')

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
      'nvim-telescope/telescope.nvim',
      tag = '0.1.0',
      requires = 'nvim-lua/plenary.nvim',
      config = function()
        require('plugins.configs.telescope').setup()
      end,
    })
    use({ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' })
    use('nvim-telescope/telescope-media-files.nvim')
    use('fannheyward/telescope-coc.nvim')

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
    use({ 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' })
    use('tpope/vim-fugitive')

    -- Commenting code
    use({
      'numToStr/Comment.nvim',
      after = 'nvim-ts-context-commentstring',
      keys = { 'gc', 'gb' },
      config = function()
        require('plugins.configs.comment').setup()
      end,
    })

    -- Syntax highlighting (and more)
    use({
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      commit = '4cccb6f494eb255b32a290d37c35ca12584c74d0',
      config = function()
        require('plugins.configs.treesitter').setup_ts()
      end,
    })
    use({
      'sheerun/vim-polyglot',
      event = { 'BufNewFile', 'BufRead' },
    })

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

    -- Syntax aware text-objects
    use({
      'nvim-treesitter/nvim-treesitter-textobjects',
      requires = 'nvim-treesitter/nvim-treesitter',
      after = 'nvim-treesitter',
      config = function()
        require('plugins.configs.treesitter').setup_textobjects()
      end,
    })

    -- Show code context
    -- use({
    --   'nvim-treesitter/nvim-treesitter-context',
    --   requires = 'nvim-treesitter/nvim-treesitter',
    --   after = 'nvim-treesitter',
    -- })

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

    -- Make yank better
    use({
      'machakann/vim-highlightedyank',
      config = function()
        vim.g.highlightedyank_highlight_duration = 300
      end,
    })
    use('svban/YankAssassin.vim')

    -- Windows / Split
    use({
      'simeji/winresizer',
      config = function()
        vim.g.winresizer_start_key = '<M-e>'
      end,
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

    -- Easy motion
    use({
      'loc-cv/pounce.nvim',
      config = function()
        vim.keymap.set('', 'z/', '<cmd>Pounce<CR>')
      end,
    })

    -- Buffers management
    use({
      'Asheq/close-buffers.vim',
      cmd = { 'Bdelete', 'Bwipeout' },
    })

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

    -- Miscs
    use({
      'lambdalisue/suda.vim',
      cmd = { 'SudaRead', 'SudaWrite' },
    })
    use({
      'declancm/cinnamon.nvim',
      config = function()
        require('cinnamon').setup({
          always_scroll = true,
          centered = true,
          extra_keymaps = true,
          extended_keymaps = true,
          default_delay = 2,
        })
      end,
    })
    use({
      'anuvyklack/pretty-fold.nvim',
      config = function()
        require('plugins.configs.pretty-fold').setup()
      end,
    })
    use({
      'anuvyklack/fold-preview.nvim',
      requires = 'anuvyklack/keymap-amend.nvim',
      config = function()
        require('fold-preview').setup()
      end,
    })
    use('gcmt/taboo.vim')
    use('jeffkreeftmeijer/vim-numbertoggle')
  end,
  config = {
    compile_path = vim.fn.stdpath('config') .. '/lua/plugins/packer_compiled.lua',
    auto_clean = true,
    compile_on_sync = true,
  },
})
