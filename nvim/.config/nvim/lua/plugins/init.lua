local ok, packer = pcall(require, 'packer')
if not ok then
  return
end

local use = packer.use

return packer.startup({
  function()
    -- Packer himself
    use('wbthomason/packer.nvim')

    -- Make Neovim look good
    use('kyazdani42/nvim-web-devicons')
    use('Mofiqul/vscode.nvim')
    use({
      'NTBBloodbath/galaxyline.nvim',
      config = function()
        require('plugins.configs.galaxyline').setup()
      end,
    })

    -- Better performance for Neovim
    use('lewis6991/impatient.nvim')
    use('nathom/filetype.nvim')
    use('antoinemadec/FixCursorHold.nvim')

    -- Lsp and friends
    use({
      'neoclide/coc.nvim',
      branch = 'release',
      config = function()
        require('plugins.configs.coc').setup()
      end,
    })
    use({
      'antoinemadec/coc-fzf',
      branch = 'release',
      requires = {
        {
          'junegunn/fzf',
          run = function()
            vim.fn['fzf#install']()
          end,
        },
        'junegunn/fzf.vim',
      },
    })

    -- Snippet
    use({
      'rafamadriz/friendly-snippets',
      -- event = 'InsertEnter',
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
        require('plugins.configs.floaterm').setup()
      end,
    })

    -- Git
    use({
      'lewis6991/gitsigns.nvim',
      requires = 'nvim-lua/plenary.nvim',
      event = { 'BufRead', 'BufNewFile' },
      config = function()
        require('plugins.configs.gitsigns').setup()
      end,
    })
    use('tpope/vim-fugitive')

    -- Commenting code
    use({
      'numToStr/Comment.nvim',
      event = { 'BufRead', 'BufNewFile' },
      config = function()
        require('plugins.configs.comment').setup()
      end,
    })

    -- Syntax highlighting (and more)
    use({
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      event = { 'BufRead', 'BufNewFile' },
      config = function()
        require('plugins.configs.treesitter').setup_ts()
      end,
    })
    use({
      'sheerun/vim-polyglot',
      event = { 'BufRead', 'BufNewFile' },
    })

    -- Set the comment string based on the cursor location in a file
    use({
      'JoosepAlviste/nvim-ts-context-commentstring',
      requires = 'nvim-treesitter/nvim-treesitter',
      after = 'nvim-treesitter',
      event = { 'BufRead', 'BufNewFile' },
      config = function()
        require('plugins.configs.treesitter').setup_context_commentstring()
      end,
    })

    -- Use treesitter to auto close and auto rename HTML tags
    use({
      'windwp/nvim-ts-autotag',
      requires = 'nvim-treesitter/nvim-treesitter',
      after = 'nvim-treesitter',
      event = { 'BufRead', 'BufNewFile' },
      config = function()
        require('plugins.configs.treesitter').setup_autotag()
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

    -- Text objects for entire buffer
    use({
      'kana/vim-textobj-entire',
      requires = 'kana/vim-textobj-user',
      event = { 'BufRead', 'BufNewFile' },
    })

    -- Indent guides for Neovim
    use({
      'lukas-reineke/indent-blankline.nvim',
      event = { 'BufRead', 'BufNewFile' },
      config = function()
        require('plugins.configs.indent-blankline').setup()
      end,
    })

    -- Surround
    use({
      'kylechui/nvim-surround',
      event = { 'BufRead', 'BufNewFile' },
      config = function()
        require('plugins.configs.surround').setup()
      end,
    })

    -- Make the yanked region apparent
    use({
      'machakann/vim-highlightedyank',
      event = { 'BufRead', 'BufNewFile' },
      config = function()
        require('plugins.configs.highlightedyank').setup()
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
        require('plugins.configs.tmux').setup()
      end,
    })

    -- Buffers management
    use({
      'Asheq/close-buffers.vim',
      cmd = { 'Bdelete', 'Bwipeout' },
    })

    -- Markdown
    use({ 'ellisonleao/glow.nvim', ft = { 'markdown' } })
    use({ 'davidgranstrom/nvim-markdown-preview', ft = { 'markdown' } })

    -- Move lines and selections
    use({
      'matze/vim-move',
      event = { 'BufRead', 'BufNewFile' },
    })

    -- Search enhancements
    use({
      'haya14busa/is.vim',
      event = { 'BufRead', 'BufNewFile' },
    })
    use({
      'PeterRincker/vim-searchlight',
      event = { 'BufRead', 'BufNewFile' },
    })

    -- Trailing whitespaces
    use({
      'ntpeters/vim-better-whitespace',
      event = { 'BufRead', 'BufNewFile' },
    })

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

    -- Web dev
    use({
      'ziontee113/color-picker.nvim',
      cmd = { 'PickColor', 'PickColorInsert' },
      config = function()
        require('plugins.configs.color-picker').setup()
      end,
    })
    use({
      'rrethy/vim-hexokinase',
      run = 'make hexokinase',
      config = function()
        require('plugins.configs.hexokinase').setup()
      end,
    })
  end,
  config = {
    compile_path = vim.fn.stdpath('config') .. '/lua/plugins/packer_compiled.lua',
    auto_clean = true,
    compile_on_sync = true,
  },
})
