-- Check if packer is installed (~/.local/share/nvim/site/pack)
local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
local is_installed = vim.fn.empty(vim.fn.glob(install_path)) == 0

if not is_installed then
  local execute = vim.api.nvim_command
  if vim.fn.input "Install packer.nvim? (y for yes) " == "y" then
    execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    execute "packadd packer.nvim"
    print "Installed packer.nvim"
    is_installed = 1
  else
    return
  end
end

local _, packer = pcall(require, "packer")
local miscs = require "plugins.configs.miscs"
local use = packer.use

return packer.startup {
  function()
    -- Packer himself
    use "wbthomason/packer.nvim"

    -- Make Neovim look good
    use "Mofiqul/vscode.nvim"

    use {
      "NTBBloodbath/galaxyline.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require "plugins.configs.galaxyline"
      end,
    }

    -- Lsp and friends
    use {
      "neoclide/coc.nvim",
      branch = "release",
      config = function()
        require "plugins.configs.coc"
      end,
    }

    use "rafamadriz/friendly-snippets"

    use {
      "antoinemadec/coc-fzf",
      branch = "release",
      requires = {
        { "neoclide/coc.nvim", branch = "release" },
        {
          "junegunn/fzf",
          run = function()
            vim.fn["fzf#install"]()
          end,
        },
        "junegunn/fzf.vim",
      },
    }

    -- Syntax highlighting (and more)
    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      config = function()
        require "plugins.configs.treesitter"
      end,
    }

    use "sheerun/vim-polyglot"

    -- Telescope
    use {
      "nvim-telescope/telescope.nvim",
      requires = {
        "nvim-lua/plenary.nvim",
        "kyazdani42/nvim-web-devicons",
        { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
        "xiyaowong/telescope-emoji.nvim",
        "nvim-telescope/telescope-media-files.nvim",
      },
      config = function()
        require "plugins.configs.telescope"
      end,
    }

    -- Terminal
    use {
      "voldikss/vim-floaterm",
      config = function()
        require "plugins.configs.floaterm"
      end,
    }

    -- Git
    use "tpope/vim-fugitive"

    use {
      "lewis6991/gitsigns.nvim",
      requires = "nvim-lua/plenary.nvim",
      config = function()
        require "plugins.configs.gitsigns"
      end,
    }

    -- Sessions
    use "tpope/vim-obsession"

    -- Coding enhancements
    use {
      "numToStr/Comment.nvim",
      after = "nvim-ts-context-commentstring",
      config = function()
        require "plugins.configs.comment"
      end,
    }

    use {
      "JoosepAlviste/nvim-ts-context-commentstring",
      requires = "nvim-treesitter/nvim-treesitter",
      after = "nvim-treesitter",
      config = miscs.context_commentstring,
    }

    use {
      "windwp/nvim-ts-autotag",
      requires = "nvim-treesitter/nvim-treesitter",
      after = "nvim-treesitter",
      config = miscs.autotag,
    }

    use {
      "windwp/nvim-autopairs",
      config = function()
        require "plugins.configs.autopairs"
      end,
    }

    use {
      "kana/vim-textobj-entire",
      requires = "kana/vim-textobj-user",
    }

    use {
      "lukas-reineke/indent-blankline.nvim",
      config = function()
        require "plugins.configs.indent_blankline"
      end,
    }

    use {
      "machakann/vim-sandwich",
      config = function()
        vim.cmd [[runtime macros/sandwich/keymap/surround.vim]]
      end,
    }

    use {
      "machakann/vim-highlightedyank",
      config = function()
        vim.g.highlightedyank_highlight_duration = 300
      end,
    }

    use {
      "https://gitlab.com/yorickpeterse/nvim-window.git",
      config = function()
        require "plugins.configs.nvim_window"
      end,
    }

    -- Easy motions
    use {
      "phaazon/hop.nvim",
      branch = "v1",
      config = function()
        require "plugins.configs.hop"
      end,
    }

    use "rlane/pounce.nvim"

    -- Buffers management
    use {
      "kazhala/close-buffers.nvim",
      config = function()
        require "plugins.configs.close_buffers"
      end,
    }

    -- Tmux
    use {
      "aserowy/tmux.nvim",
      config = function()
        require "plugins.configs.tmux"
      end,
    }

    -- Miscs
    use "matze/vim-move"
    use "haya14busa/is.vim"
    use "PeterRincker/vim-searchlight"
    use "ntpeters/vim-better-whitespace"
    use "junegunn/vim-easy-align"
    use "lewis6991/impatient.nvim"

    -- Temps
    use "digitaltoad/vim-pug"
  end,
}
