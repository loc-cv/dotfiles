local hi = require("core.utils").hi

return {
  { "nvim-tree/nvim-web-devicons", lazy = true },

  -- {
  --   "mcchrish/zenbones.nvim",
  --   dependencies = "rktjmp/lush.nvim",
  --   init = function()
  --     vim.g.zenwritten = {
  --       -- lightness = "bright",
  --       darken_comments = 60,
  --       italic_comments = false,
  --       darken_noncurrent_window = true,
  --       darken_cursor_line = 5,
  --       darken_non_text = 50,
  --       colorize_diagnostic_underline_text = true,
  --     }
  --   end,
  --   config = function()
  --     vim.opt["background"] = "light"
  --     vim.cmd({ cmd = "colorscheme", args = { "zenwritten" } })
  --   end
  -- },

  {
    "Mofiqul/vscode.nvim",
    init = function()
      vim.g.vscode_disable_nvim_tree_bg = 1
    end,
    config = function()
      require("vscode").setup()
      vim.cmd({ cmd = "colorscheme", args = { "vscode" } })

      local colors = {
        -- Cursorline
        CursorLine = { bg = "#303030" },
        NvimTreeCursorLine = { link = "Cursorline" },

        -- Fold
        Folded = { bg = "#252526", fg = "#3F3F46", underline = false },

        -- Tabline
        TabLineFill = { bg = "#282828", fg = "#d4d4d4" },
        TabLineSel = { bg = "#f5f5f5", fg = "#343434" },
        TabLine = { bg = "#373737", fg = "#ffffff" },

        -- Statusline
        StatusLine = { bg = "#1e1e1e" },
        StatusLineNC = { bg = "#1e1e10" },

        -- vim-floaterm
        FloatermBorder = { bg = "#1e1e1e" },

        -- vim-highlightedyank
        HighlightedyankRegion = { bg = "#4f4f4f" },

        -- indent-blankline.nvim
        IblScope = { fg = "#d4d4d4" },

        -- vim-better-whitespace
        ExtraWhitespace = { bg = "#808080" },

        -- telescope.nvim
        TelescopeResultsBorder = { link = "Normal" },
        TelescopePromptBorder = { link = "Normal" },
        TelescopePreviewBorder = { link = "Normal" },

        -- coc.nvim
        CocErrorSign = { fg = "#db4b4b" },
        CocErrorVirtualText = { fg = "#db4b4b" },
        CocErrorHighlight = { fg = "#db4b4b", underline = true },
        CocWarningSign = { fg = "#e0af68" },
        CocWarningVirtualText = { fg = "#e0af68" },
        CocWarningHighlight = { fg = "#e0af68", underline = true },
        CocInfoSign = { fg = "#0db9d7" },
        CocInfoVirtualText = { fg = "#0db9d7" },
        CocInfoHighlight = { fg = "#0db9d7", underline = true },
        CocHintSign = { fg = "#10b981" },
        CocHintVirtualText = { fg = "#10b981" },
        CocHintHighlight = { fg = "#10b981", underline = true },
        CocFadeOut = { fg = "#808080", underline = true },
        CocHighlightText = { bg = "#282828", underline = true },
        CocSearch = { fg = "#18a2fe" },
        CocSymbolLineSeparator = { link = "Normal" },

        -- vim-sandwich
        OperatorSandwichChange = { link = "Visual" },
        OperatorSandwichAdd = { link = "Visual" },
        OperatorSandwichDelete = { link = "Visual" },
      }

      for group, conf in pairs(colors) do
        hi(group, conf)
      end
    end,
  },

  {
    "echasnovski/mini.indentscope",
    version = false,
    config = function()
      local mini_indentscope = require("mini.indentscope")
      mini_indentscope.setup({
        draw = {
          animation = mini_indentscope.gen_animation.none(),
        },
        symbol = "▏",
        options = {
          indent_at_cursor = false,
        },
      })
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      indent = {
        char = "▏",
        smart_indent_cap = true,
      },
      whitespace = {
        remove_blankline_trail = true,
      },
      scope = {
        enabled = false,
        show_start = false,
        show_end = false,
      },
      exclude = {
        filetypes = {
          "help",
          "terminal",
          "TelescopePrompt",
          "TelescopeResults",
          "fugitive",
          "coc-explorer",
          "packer",
          "tutor",
          "startuptime",
          "NeogitStatus",
          "DiffviewFiles",
          "lsp-installer",
          "lspinfo",
          "Trouble",
          "neo-tree",
          "neo-tree-popup",
          "NvimTree",
          "mason",
          "",
          "coctree",
          "ccc-ui",
          "git",
          "lazy",
          "fzf",
        },
        buftypes = { "terminal " },
      },
    },
    config = function(_, opts)
      require("ibl").setup(opts)
    end,
  },
}
