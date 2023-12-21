local map = require("core.utils").map

return {
  {
    "neoclide/coc.nvim",
    branch = "release",
    init = function()
      vim.g.coc_max_treeview_width = 100
      vim.g.coc_global_extensions = {
        "coc-symbol-line",
        "coc-html",
        "coc-css",
        "coc-emmet",
        "coc-tsserver",
        "coc-json",
        "coc-prettier",
        "coc-eslint",
        "coc-sumneko-lua",
        "coc-snippets",
        "https://github.com/rafamadriz/friendly-snippets@main",
        "coc-docker",
        "coc-solargraph",
        "coc-markdownlint",
        "@yaegassy/coc-volar",
        "@yaegassy/coc-volar-tools",
        "coc-go",
        "coc-deno",
        "@yaegassy/coc-ansible",
        "@yaegassy/coc-black-formatter",
        "coc-pyright",

        -- "@yaegassy/coc-tailwindcss3",
      }
    end,
    config = function()
      -- USERCMDS --
      --------------
      -- Add `:Format` command to format current buffer.
      vim.api.nvim_create_user_command("Format", "call CocActionAsync('format')", { nargs = 0, bang = true })

      -- Add `:Fold` command to fold current buffer.
      vim.api.nvim_create_user_command("Fold", "call CocAction('fold', <f-args>)", { nargs = "?", bang = true })

      -- Add `:OR` command for organize imports of the current buffer.
      vim.api.nvim_create_user_command(
        "OR",
        "call CocActionAsync('runCommand', 'editor.action.organizeImport')",
        { nargs = 0, bang = true }
      )

      -- Add `:Prettier` command
      vim.api.nvim_create_user_command(
        "Prettier",
        "CocCommand prettier.forceFormatDocument",
        { nargs = 0, bang = true }
      )

      -- AUTOCMDS --
      --------------
      local cocaugroup = vim.api.nvim_create_augroup("coc", { clear = true })

      -- setup formatexpr specified filetype(s)
      vim.api.nvim_create_autocmd("filetype", {
        group = cocaugroup,
        pattern = { "typescript", "json" },
        command = "setl formatexpr=cocaction('formatselected')",
        desc = "setup formatexpr specified filetype(s)",
      })

      -- update signature help on jump placeholder
      vim.api.nvim_create_autocmd("user", {
        group = cocaugroup,
        pattern = "cocjumpplaceholder",
        command = "call cocactionasync('showsignaturehelp')",
        desc = "update signature help on jump placeholder",
      })

      -- Highlight the symbol and its references when holding the cursor
      vim.api.nvim_create_autocmd("CursorHold", {
        group = cocaugroup,
        command = "silent call CocActionAsync('highlight')",
        desc = "Highlight symbol under cursor on CursorHold",
      })

      -- MAPPINGS --
      --------------
      vim.g.coc_snippet_next = "<M-f>"
      vim.g.coc_snippet_prev = "<M-b>"

      -- Use <C-space> to trigger completion
      map("i", "<C-space>", function()
        return vim.fn["coc#refresh"]()
      end, { expr = true })

      -- Make <CR> auto-select the first completion item and notify coc.nvim to ...
      -- ... format on enter, <CR> could be remapped by other vim plugin
      _G.CR = function()
        local _, autopairs = pcall(require, "nvim-autopairs")
        if vim.fn["coc#pum#visible"]() ~= 0 then
          return vim.fn["coc#pum#confirm"]()
        else
          return autopairs.autopairs_cr()
        end
      end
      map("i", "<CR>", "v:lua.CR()", { expr = true, replace_keycodes = false })

      -- Use <C-j> and <C-k> to navigate the completion list
      map("i", "<C-j>", "coc#pum#visible() ? coc#pum#next(1) : '<C-j>'", { expr = true, replace_keycodes = false })
      map("i", "<C-k>", "coc#pum#visible() ? coc#pum#prev(1) : '<C-k>'", { expr = true, replace_keycodes = false })

      -- Use `[d` and `]d` to navigate diagnostics
      map("n", "[d", "<Plug>(coc-diagnostic-prev)")
      map("n", "]d", "<Plug>(coc-diagnostic-next)")

      -- GOTO code navigation
      -- map('n', 'gd', '<Plug>(coc-definition)')
      -- map('n', 'gy', '<Plug>(coc-type-definition)')
      -- map('n', 'gi', '<Plug>(coc-implementation)')
      -- map('n', 'gr', '<Plug>(coc-references)')

      -- Use K to show documentation in preview window
      function _G.show_docs()
        local cw = vim.fn.expand("<cword>")
        if vim.fn.index({ "vim", "help" }, vim.bo.filetype) >= 0 then
          vim.api.nvim_command("h " .. cw)
        elseif vim.api.nvim_eval("coc#rpc#ready()") then
          vim.fn.CocActionAsync("doHover")
        else
          vim.api.nvim_command("!" .. vim.o.keywordprg .. " " .. cw)
        end
      end

      map("n", "K", "<CMD>lua _G.show_docs()<CR>")

      -- Symbol renaming
      map("n", "<leader>lrn", "<Plug>(coc-rename)")

      -- Format selected code
      map({ "x", "n" }, "<leader>lfm", "<Plug>(coc-format-selected)")

      -- Apply code action to the selected region
      map({ "x", "n" }, "<leader>lca", "<Plug>(coc-codeaction-selected)")

      -- Apply code action to the current buffer
      map("n", "<leader>lcA", "<Plug>(coc-codeaction-source)")

      -- Apply autofix to problem on the current line
      map("n", "<leader>laf", "<Plug>(coc-fix-current)")

      -- Run the Code Lens action on the current line
      map("n", "<leader>lcl", "<Plug>(coc-codelens-action)")

      -- Apply refactor code actions
      map({ "x", "n" }, "<leader>lrf", "<Plug>(coc-codeaction-refactor-selected)")
      map("n", "<leader>lrF", "<Plug>(coc-codeaction-refactor)")

      -- Map function and class text objects
      -- NOTE: Requires 'textDocument.documentSymbol' support from the language server
      -- map({ 'x', 'o' }, 'if', '<Plug>(coc-funcobj-i)')
      -- map({ 'x', 'o' }, 'af', '<Plug>(coc-funcobj-a)')
      -- map({ 'x', 'o' }, 'ic', '<Plug>(coc-classobj-i)')
      -- map({ 'x', 'o' }, 'ac', '<Plug>(coc-classobj-a)')

      -- Remap <C-e> and <C-y> for scroll float windows/popups
      map(
        { "n", "v" },
        "<C-e>",
        "coc#float#has_scroll() ? coc#float#scroll(1) : '<C-e>'",
        { expr = true, nowait = true }
      )
      map(
        { "n", "v" },
        "<C-y>",
        "coc#float#has_scroll() ? coc#float#scroll(0) : '<C-y>'",
        { expr = true, nowait = true }
      )
      map("i", "<C-e>", "coc#float#has_scroll() ? '<C-r>=coc#float#scroll(1)<cr>' : '<C-e>'", {
        expr = true,
        nowait = true,
      })
      map("i", "<C-y>", "coc#float#has_scroll() ? '<C-r>=coc#float#scroll(0)<cr>' : '<C-y>'", {
        expr = true,
        nowait = true,
      })

      -- Use <C-q> to close coc floating window/popup in insert mode
      map(
        "i",
        "<C-q>",
        "coc#float#has_float() ? '<C-r>=coc#float#close_all()<BS><cr>' : '<C-q>'",
        { expr = true, nowait = true }
      )

      -- Use ctrl-s for selections ranges
      map({ "n", "x" }, "<C-s>", "<Plug>(coc-range-select)")

      -- Use ctrl-s in insert mode to trigger signature help
      map("i", "<C-s>", "<C-r>=CocActionAsync('showSignatureHelp')<CR>")

      -- Mappings for CoCList
      map("n", "<leader>lli", "<CMD>CocList<CR>", { nowait = true })
      map("n", "<leader>lex", "<CMD>CocList extensions<CR>", { nowait = true })

      local toggleOutline = function()
        for _, win in ipairs(vim.api.nvim_list_wins()) do
          local buf = vim.api.nvim_win_get_buf(win)
          local buf_ft = vim.api.nvim_buf_get_option(buf, "filetype")
          if buf_ft == "coctree" then
            vim.fn.CocAction("hideOutline")
            return
          end
        end
        vim.fn.CocAction("showOutline")
      end
      map("n", "<leader>lol", toggleOutline, { nowait = true })

      -- ansible
      vim.g.coc_filetype_map = {
        ["yaml.ansible"] = "ansible",
      }
    end,
  },

  {
    "xiyaowong/coc-symbol-line",
    config = function()
      function _G.coc_symbol_line()
        local bufnr = vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
        local ok, line = pcall(vim.api.nvim_buf_get_var, bufnr, "coc_symbol_line")
        return ok and "%#CocSymbolLine# " .. line or ""
      end

      if vim.fn.exists("&winbar") then
        vim.api.nvim_create_autocmd({ "CursorHold", "WinEnter", "BufWinEnter" }, {
          pattern = "*",
          callback = function()
            ---@diagnostic disable-next-line: undefined-field
            if vim.b.coc_symbol_line and vim.bo.buftype == "" then
              if vim.opt_local.winbar:get() == "" then
                vim.opt_local.winbar = "%!v:lua.coc_symbol_line()"
              end
            else
              vim.opt_local.winbar = ""
            end
          end,
        })
      end
    end,
  },
}
