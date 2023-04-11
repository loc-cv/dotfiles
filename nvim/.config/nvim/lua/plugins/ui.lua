local hi = require("core.utils").hi

return {
  { "kyazdani42/nvim-web-devicons", lazy = true },

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
        IndentBlanklineContextChar = { fg = "#d4d4d4" },
        IndentBlanklineContextStart = { fg = "NONE", sp = "#d4d4d4", underline = true },

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
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      char = "▏",
      context_char = "▏",
      -- context_char = '▎',
      show_current_context = true,
      show_current_context_start = false,
      show_trailing_blankline_indent = false,
      show_current_context_start_oncurrent_line = true,
      filetype_exclude = {
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
      },
      buftype_exclude = { "terminal" },
    },
    config = function(_, opts)
      require("indent_blankline").setup(opts)
    end,
  },
}