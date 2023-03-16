---@diagnostic disable: different-requires
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  ---@diagnostic disable-next-line: missing-parameter
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd({ cmd = 'packadd', args = { 'packer.nvim' } })
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

local ok, packer = pcall(require, 'packer')
if not ok then
  return
end

return packer.startup({
  function(use)
    -- Packer himself
    use('wbthomason/packer.nvim')

    -- Better performance for Neovim
    use('lewis6991/impatient.nvim')

    -- UI stuff
    use('Mofiqul/vscode.nvim')
    -- use('projekt0n/github-nvim-theme')
    use('kyazdani42/nvim-web-devicons')
    use({
      'freddiehaddad/feline.nvim',
      branch = 'main',
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

    -- LSP and friends
    use({
      'neoclide/coc.nvim',
      branch = 'release',
      config = function()
        require('plugins.configs.coc').setup()
      end,
    })
    -- use('xiyaowong/coc-symbol-line')

    -- Languages
    use({ 'tpope/vim-rails', ft = 'ruby' })

    -- Document generator
    use({
      'kkoomen/vim-doge',
      run = ':call doge#install()',
      keys = '<leader>d',
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
      cmd = 'Telescope',
      config = function()
        require('plugins.configs.telescope').setup()
      end,
    })
    use({
      'nvim-telescope/telescope-fzf-native.nvim',
      run = 'make',
      after = 'telescope.nvim',
      config = function()
        require('telescope').load_extension('fzf')
      end,
    })
    use({
      'nvim-telescope/telescope-media-files.nvim',
      after = 'telescope.nvim',
      config = function()
        require('telescope').load_extension('media_files')
      end,
    })
    use({
      'fannheyward/telescope-coc.nvim',
      after = 'telescope.nvim',
      config = function()
        require('telescope').load_extension('coc')
      end,
    })

    -- Explorer
    use({
      'nvim-tree/nvim-tree.lua',
      tag = 'nightly',
      cmd = 'NvimTreeToggle',
      config = function()
        require('plugins.configs.nvim-tree').setup()
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
    use({
      'kdheepak/lazygit.nvim',
      cmd = 'LazyGit',
      config = function()
        vim.g.lazygit_floating_window_winblend = 0
        vim.g.lazygit_floating_window_scaling_factor = 1
        vim.g.lazygit_floating_window_corner_chars = { '┌', '┐', '└', '┘' }
        vim.g.lazygit_floating_window_use_plenary = 0
      end,
    })
    use({ 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' })

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

    -- Set the comment string based on the cursor location in a file
    use({
      'JoosepAlviste/nvim-ts-context-commentstring',
      after = 'nvim-treesitter',
      config = function()
        require('plugins.configs.treesitter').setup_context_commentstring()
      end,
    })

    -- Use treesitter to auto close and auto rename HTML tags
    use({
      'windwp/nvim-ts-autotag',
      after = 'nvim-treesitter',
      config = function()
        require('plugins.configs.treesitter').setup_autotag()
      end,
    })

    -- Syntax aware text-objects
    use({
      'nvim-treesitter/nvim-treesitter-textobjects',
      after = 'nvim-treesitter',
      config = function()
        require('plugins.configs.treesitter').setup_textobjects()
      end,
    })

    -- Show code context
    use({
      'nvim-treesitter/nvim-treesitter-context',
      after = 'nvim-treesitter',
    })

    -- Better indentation for treesitter
    use({
      'yioneko/nvim-yati',
      after = 'nvim-treesitter',
      config = function()
        require('plugins.configs.treesitter').setup_yati()
      end,
    })

    -- Autopairs
    use({
      'windwp/nvim-autopairs',
      event = 'InsertEnter',
      config = function()
        require('plugins.configs.autopairs').setup()
      end,
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
        vim.cmd({ cmd = 'runtime', args = { 'macros/sandwich/keymap/surround.vim' } })
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
      cmd = 'WinResizerStartResize',
    })
    use({
      'https://gitlab.com/yorickpeterse/nvim-window.git',
      module = 'nvim-window',
      config = function()
        require('plugins.configs.window').setup()
      end,
    })

    -- Tmux
    use({
      'christoomey/vim-tmux-navigator',
      config = function()
        vim.g.tmux_navigator_disable_when_zoomed = 1
      end,
    })

    -- Buffers
    use({
      'kazhala/close-buffers.nvim',
      module = 'close_buffers',
      config = function()
        require('plugins.configs.close-buffers').setup()
      end,
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

    -- Trailing whitespaces
    use({
      'ntpeters/vim-better-whitespace',
      config = function()
        vim.g.better_whitespace_filetypes_blacklist = {
          'toggleterm',
          'diff',
          'git',
          'gitcommit',
          'unite',
          'qf',
          'help',
          'markdown',
          'fugitive',
        }
      end,
    })

    -- Colors related stuff
    use({
      'brenoprata10/nvim-highlight-colors',
      config = function()
        require('plugins.configs.highlight-colors').setup()
      end,
    })

    -- Utils
    use({ 'matze/vim-move', keys = { '<M-j>', '<M-k>', '<M-h>', '<M-l>' } })
    use({
      'dstein64/vim-startuptime',
      cmd = { 'StartupTime' },
    })
    use({
      'lambdalisue/suda.vim',
      cmd = { 'SudaRead', 'SudaWrite' },
    })
    use({
      'declancm/cinnamon.nvim',
      config = function()
        require('plugins.configs.cinnamon').setup()
      end,
    })
    use('jeffkreeftmeijer/vim-numbertoggle')
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
    use({
      'markonm/traces.vim',
      config = function()
        vim.g.traces_abolish_integration = 1
      end,
    })
    use('tpope/vim-abolish')
    use('tpope/vim-sleuth')
    use('tpope/vim-unimpaired')
    -- use('gcmt/taboo.vim')

    if packer_bootstrap then
      require('packer').sync()
    end
  end,
  config = {
    compile_path = vim.fn.stdpath('config') .. '/lua/plugins/packer_compiled.lua',
    auto_clean = true,
    compile_on_sync = true,
  },
})
