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
    -- use('tomasiser/vim-code-dark')
    use('Mofiqul/vscode.nvim')
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
    -- use({
    --   'neoclide/coc.nvim',
    --   branch = 'release',
    --   config = function()
    --     require('plugins.configs.coc').setup()
    --   end,
    -- })
    use({
      'williamboman/mason.nvim',
      config = function()
        require('lsp.mason').setup()
      end,
    })
    use('WhoIsSethDaniel/mason-tool-installer.nvim')
    use({
      'neovim/nvim-lspconfig',
      config = function()
        require('lsp.lsp-config').setup()
      end,
    })
    use({
      'jose-elias-alvarez/null-ls.nvim',
      requires = 'nvim-lua/plenary.nvim',
      config = function()
        require('lsp.null-ls').setup()
      end,
    })
    use({
      'ray-x/lsp_signature.nvim',
      config = function()
        require('lsp.lsp-signature').setup()
      end,
    })
    use('RRethy/vim-illuminate')
    use('SmiteshP/nvim-navic')
    -- use({
    --   'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
    --   config = function()
    --     require('lsp_lines').setup()
    --   end,
    -- })

    -- Completion
    use({
      'hrsh7th/nvim-cmp',
      config = function()
        require('lsp.cmp').setup()
      end,
    })
    use('hrsh7th/cmp-nvim-lsp')
    use('hrsh7th/cmp-nvim-lua')
    use('saadparwaiz1/cmp_luasnip')
    use('hrsh7th/cmp-buffer')
    use('hrsh7th/cmp-path')

    -- Explorer
    use({
      'kyazdani42/nvim-tree.lua',
      config = function()
        require('plugins.configs.nvim-tree').setup()
      end,
    })

    -- Snippet
    use({
      'rafamadriz/friendly-snippets',
      -- after = 'coc.nvim',
    })
    use({ 'L3MON4D3/LuaSnip' })

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
    -- use({
    --   'ibhagwan/fzf-lua',
    --   cmd = { 'FzfLua' },
    --   config = function()
    --     require('plugins.configs.fzf-lua').setup()
    --   end,
    -- })
    use({
      'nvim-telescope/telescope.nvim',
      tag = '0.1.0',
      requires = 'nvim-lua/plenary.nvim',
      config = function()
        require('plugins.configs.telescope').setup()
      end,
    })
    use({ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' })
    use({ 'nvim-telescope/telescope-media-files.nvim' })
    use({
      'LukasPietzschmann/telescope-tabs',
      config = function()
        require('telescope-tabs').setup({
          show_preview = true,
        })
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
    use({ 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' })
    use({
      'TimUntersberger/neogit',
      requires = 'nvim-lua/plenary.nvim',
      config = function()
        require('plugins.configs.neogit').setup()
      end,
    })

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
          centered = false,
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
  end,
  config = {
    compile_path = vim.fn.stdpath('config') .. '/lua/plugins/packer_compiled.lua',
    auto_clean = true,
    compile_on_sync = true,
  },
})
