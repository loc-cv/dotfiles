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

local ok, packer = pcall(require, "packer")
if not ok then
  return
end

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
        require("plugins.configs.galaxyline").setup()
      end,
    }

    -- Lsp and friends
    use {
      "neoclide/coc.nvim",
      branch = "release",
      config = function()
        require("plugins.configs.coc").setup()
      end,
    }
    use "rafamadriz/friendly-snippets"

    -- Syntax highlighting (and more)
    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      config = function()
        require("plugins.configs.treesitter").setup()
      end,
    }

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
        require("plugins.configs.telescope").setup()
      end,
    }

    -- Terminal
    use {
      "voldikss/vim-floaterm",
      config = function()
        require("plugins.configs.floaterm").setup()
      end,
    }

    -- Git
    use "tpope/vim-fugitive"
    use {
      "lewis6991/gitsigns.nvim",
      requires = "nvim-lua/plenary.nvim",
      config = function()
        require("plugins.configs.gitsigns").setup()
      end,
    }

    -- Sessions
    use "tpope/vim-obsession"

    -- Coding enhancements
    use {
      "numToStr/Comment.nvim",
      after = "nvim-ts-context-commentstring",
      config = function()
        require("plugins.configs.comment").setup()
      end,
    }
    use {
      "JoosepAlviste/nvim-ts-context-commentstring",
      requires = "nvim-treesitter/nvim-treesitter",
      after = "nvim-treesitter",
      config = function()
        require("plugins.configs.miscs").setup_context_commentstring()
      end,
    }
    use {
      "windwp/nvim-ts-autotag",
      requires = "nvim-treesitter/nvim-treesitter",
      after = "nvim-treesitter",
      config = function()
        require("plugins.configs.miscs").setup_autotag()
      end,
    }
    use {
      "windwp/nvim-autopairs",
      config = function()
        require("plugins.configs.autopairs").setup()
      end,
    }
    use {
      "kana/vim-textobj-entire",
      requires = "kana/vim-textobj-user",
    }
    use {
      "lukas-reineke/indent-blankline.nvim",
      config = function()
        require("plugins.configs.indent_blankline").setup()
      end,
    }
    use {
      "machakann/vim-sandwich",
      config = function()
        require("plugins.configs.vim_sandwich").setup()
      end,
    }
    use {
      "machakann/vim-highlightedyank",
      config = function()
        require("plugins.configs.highlightedyank").setup()
      end,
    }

    -- Easy motions
    use "rlane/pounce.nvim"
    use "mrjones2014/smart-splits.nvim"
    use {
      "https://gitlab.com/yorickpeterse/nvim-window.git",
      config = function()
        require("plugins.configs.nvim_window").setup()
      end,
    }

    -- Buffers management
    use "Asheq/close-buffers.vim"

    -- Markdown
    use "ellisonleao/glow.nvim"
    use "davidgranstrom/nvim-markdown-preview"

    -- Miscs
    use "matze/vim-move"
    use "haya14busa/is.vim"
    use "PeterRincker/vim-searchlight"
    use "ntpeters/vim-better-whitespace"
    use "lewis6991/impatient.nvim"
    use "tpope/vim-sleuth"
    use "nathom/filetype.nvim"
    use "junegunn/vim-easy-align"
    use {
      "norcalli/nvim-colorizer.lua",
      config = function()
        require("plugins.configs.nvim_colorizer").setup()
      end,
    }
    use {
      "sunjon/shade.nvim",
      config = function()
        require("plugins.configs.shade").setup()
      end,
    }
  end,
}
