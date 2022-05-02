local M = {}
local map = require("core.utils").map

local plugins = {
  -- CoC
  coc = function()
    -- coc-explorer
    map("n", "<C-n>", "<cmd>CocCommand explorer<cr><cmd>sleep 50ms<cr><C-w>=")

    -- coc-snippet
    vim.g.coc_snippet_next = "<Tab>"
    vim.g.coc_snippet_prev = "<S-Tab>"

    -- Use <C-space> to trigger completion
    map("i", "<C-space>", "coc#refresh()", { expr = true })

    -- Make <CR> auto-select the first completion item and notify coc.nvim to ...
    -- ... format on enter, <CR> could be remapped by other vim plugin
    _G.CR = function()
      local _, autopairs = pcall(require, "nvim-autopairs")
      if vim.fn.pumvisible() ~= 0 then
        return vim.fn["coc#_select_confirm"]()
      else
        return autopairs.autopairs_cr()
      end
    end
    map("i", "<cr>", "v:lua.CR()", { expr = true })

    -- Use <C-j> and <C-k> to navigate the completion list
    map("i", "<C-j>", 'pumvisible() ? "<C-n>" : "<Tab>"', { expr = true })
    map("i", "<C-k>", 'pumvisible() ? "<C-p>" : "<S-Tab>"', { expr = true })

    -- Use `[d` and `]d` to navigate diagnostics
    map("n", "[d", "<Plug>(coc-diagnostic-prev)")
    map("n", "]d", "<Plug>(coc-diagnostic-next)")

    -- GOTO code navigation
    map("n", "gd", "<Plug>(coc-definition)")
    map("n", "gy", "<Plug>(coc-type-definition)")
    map("n", "gi", "<Plug>(coc-implementation)")
    map("n", "gr", "<Plug>(coc-references)")

    -- Use gh to show documentation in preview window
    map("n", "gh", function()
      local cw = vim.fn.expand "<cword>"
      if vim.fn.index({ "vim", "help" }, vim.bo.filetype) >= 0 then
        vim.cmd("h " .. cw)
      elseif vim.api.nvim_eval "coc#rpc#ready()" then
        vim.fn.CocActionAsync "doHover"
      else
        vim.cmd("!" .. vim.o.keywordprg .. " " .. cw)
      end
    end)

    -- Symbol renaming
    map("n", "<space>rn", "<Plug>(coc-rename)")

    -- Formatting selected code
    map({ "x", "n" }, "<space>fm", "<Plug>(coc-format-selected)")

    -- Applying code action to the selected region
    map({ "x", "n" }, "<space>ac", "<Plug>(coc-codeaction-selected)")

    -- Applying code action to the current buffer
    map("n", "<space>A", "<Plug>(coc-codeaction)")

    -- Apply autofix to problem on the current line
    map("n", "<space>qf", "<Plug>(coc-fix-current)")

    -- Run the Code Lens action on the current line
    map("n", "<space>al", "<Plug>(coc-codelens-action)")

    -- Map function and class text objects
    -- NOTE: Requires 'textDocument.documentSymbol' support from the language server
    map({ "x", "o" }, "if", "<Plug>(coc-funcobj-i)")
    map({ "x", "o" }, "af", "<Plug>(coc-funcobj-a)")
    map({ "x", "o" }, "ic", "<Plug>(coc-classobj-i)")
    map({ "x", "o" }, "ac", "<Plug>(coc-classobj-a)")

    -- Remap <C-d> and <C-u> for scroll float windows/popups
    map({ "n", "v" }, "<C-d>", "coc#float#has_scroll() ? coc#float#scroll(1) : '<C-d>'", { expr = true, nowait = true })
    map({ "n", "v" }, "<C-u>", "coc#float#has_scroll() ? coc#float#scroll(0) : '<C-u>'", { expr = true, nowait = true })
    map(
      "i",
      "<C-d>",
      "coc#float#has_scroll() ? '<C-r>=coc#float#scroll(1)<cr>' : '<C-d>'",
      { expr = true, nowait = true }
    )
    map("i", "<C-u>", "coc#float#has_scroll() ? '<C-r>=coc#float#scroll(0)<cr>' : '<C-u>'", {
      expr = true,
      nowait = true,
    })

    -- Use ctrl-s for selections ranges
    map({ "n", "x" }, "<C-s>", "<Plug>(coc-range-select)")

    -- Mappings for CoCList
    map("n", "<space><space>", "<cmd>CocFzfList<cr>")
    map("n", "<space>e", "<cmd>CocFzfList extensions<cr>")
    map("n", "<space>D", "<cmd>CocFzfList diagnostics<cr>")
    map("n", "<space>d", "<cmd>CocFzfList diagnostics --current-buf<cr>")
    map("n", "<space>c", "<cmd>CocFzfList commands<cr>")
    map("n", "<space>l", "<cmd>CocFzfList location<cr>")
    map("n", "<space>s", "<cmd>CocFzfList symbols<cr>")
    map("n", "<space>o", "<cmd>CocFzfList outline<cr>")
    map("n", "<space>p", "<cmd>CocFzfListResume<cr>")
  end,

  -- Easy-align
  easy_align = function()
    map({ "n", "x" }, "ga", "<Plug>(EasyAlign)")
  end,

  -- Floaterm
  floaterm = function()
    map("n", "<C-q>c", [[<cmd>FloatermNew<cr>]])
    map("t", "<C-q>c", [[<C-\><C-n><cmd>FloatermNew<cr>]])
    map("n", "<C-q>p", [[<cmd>FloatermPrev<cr>]])
    map("t", "<C-q>p", [[<C-\><C-n><cmd>FloatermPrev<cr>]])
    map("n", "<C-q>n", [[<cmd>FloatermNext<cr>]])
    map("t", "<C-q>n", [[<C-\><C-n><cmd>FloatermNext<cr>]])
    map("n", "<C-q>t", [[<cmd>FloatermToggle<cr>]])
    map("t", "<C-q>t", [[<C-\><C-n><cmd>FloatermToggle<cr>]])
    map("n", "<C-q>h", [[<cmd>FloatermShow<cr><C-\><C-n><cmd>FloatermHide<cr>]])
    map("t", "<C-q>h", [[<C-\><C-n><cmd>FloatermHide<cr>]])
    map("n", "<C-q>k", [[<cmd>FloatermKill<cr><cmd>FloatermShow!<cr>]])
    map("t", "<C-q>k", [[<C-\><C-n><cmd>FloatermKill<cr><cmd>FloatermShow!<cr>]])
    map("t", "<C-h>", [[<C-\><C-n><C-w>h]])

    -- Clear terminal
    map(
      "t",
      "<C-l>",
      [[<C-\><C-n><cmd>set scrollback=1<cr><cmd>sleep 10ms<cr><cmd>set scrollback=10000<cr>i<C-l><C-\><C-n><cmd>FloatermHide<cr><cmd>FloatermShow<cr><C-l>]]
    )
  end,

  -- Nvim_window
  nvim_window = function()
    map("n", "<space>w", function()
      require("nvim-window").pick()
    end)
  end,

  -- Pounce
  pounce = function()
    map({ "n", "v", "o" }, "z/", [[<cmd>Pounce<cr>]])
  end,

  -- Smart-splits
  smart_splits = function()
    -- resizing splits
    map("n", "<A-H>", function()
      require("smart-splits").resize_left()
    end)
    map("n", "<A-J>", function()
      require("smart-splits").resize_down()
    end)
    map("n", "<A-K>", function()
      require("smart-splits").resize_up()
    end)
    map("n", "<A-L>", function()
      require("smart-splits").resize_right()
    end)

    -- moving between splits
    map("n", "<C-h>", function()
      require("smart-splits").move_cursor_left()
    end)
    map("n", "<C-j>", function()
      require("smart-splits").move_cursor_down()
    end)
    map("n", "<C-k>", function()
      require("smart-splits").move_cursor_up()
    end)
    map("n", "<C-l>", function()
      require("smart-splits").move_cursor_right()
    end)
  end,

  -- Telescope
  telescope = function()
    map("n", "<C-p>t", function()
      require("telescope.builtin").builtin()
    end)
    map("n", "<C-p>f", function()
      require("telescope.builtin").find_files()
    end)
    map("n", "<C-p>b", function()
      require("telescope.builtin").buffers()
    end)
    map("n", "<C-p>r", function()
      require("telescope.builtin").live_grep()
    end)
    map("n", "<C-p>h", function()
      require("telescope.builtin").help_tags()
    end)
    map("n", "<C-p>i", [[<cmd>Telescope media_files<cr>]])
  end,
}

M.init = function()
  -- Better indenting in visual mode
  map("v", "<", "<gv")
  map("v", ">", ">gv")

  -- Make <C-w> work as expected in prompt window
  map("i", "<C-W>", "<C-S-W>")

  -- Better movement between wrapped lines
  map("n", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
  map("n", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })

  -- Don't copy the replaced text after pasting in visual mode
  map("v", "p", '"_dP')

  -- Load plugins mappings
  for _, plugin in pairs(plugins) do
    plugin()
  end
end

return M
