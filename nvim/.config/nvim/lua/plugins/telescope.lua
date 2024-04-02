local map = require("core.utils").map

return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      { "fannheyward/telescope-coc.nvim" },
      { "mollerhoj/telescope-recent-files.nvim" },
    },
    keys = {
      -- telescope-coc.nvim
      { "gd", [[<Cmd>Telescope coc definitions<cr>]] },
      { "gy", [[<cmd>Telescope coc type_definitions<cr>]] },
      { "gi", [[<cmd>Telescope coc implementations<cr>]] },
      { "gr", [[<CMD>Telescope coc references<CR>]] },
      { "gD", [[<cmd>Telescope coc declarations<cr>]] },
      { "<leader>lcm", [[<cmd>Telescope coc commands<cr>]] },
      { "<leader>lda", [[<cmd>Telescope coc diagnostics<cr>]] },
      { "<leader>ldA", [[<cmd>Telescope coc workspace_diagnostics<cr>]] },
      { "<leader>llo", [[<cmd>Telescope coc locations<cr>]] },
      { "<leader>lds", [[<cmd>Telescope coc document_symbols<cr>]] },
      { "<leader>lws", [[<cmd>Telescope coc workspace_symbols<cr>]] },

      -- telescope.nvim
      { "<leader>fp", [[<CMD>Telescope builtin<CR>]] },
      { "<leader>ff", [[<CMD>Telescope find_files<CR>]] },
      { "<leader>fb", [[<CMD>Telescope buffers<CR>]] },
      { "<leader>fr", [[<CMD>Telescope live_grep<CR>]] },
      { "<leader>fh", [[<CMD>Telescope help_tags<CR>]] },
      { "<leader>fq", [[<CMD>Telescope quickfix<CR>]] },
      { "<leader>fw", [[<CMD>Telescope current_buffer_fuzzy_find<CR>]] },
    },
    config = function()
      local ok, telescope = pcall(require, "telescope")
      if not ok then
        return
      end

      -- telescope-recent-files.nvim
      map("n", "<leader>fj", function()
        require("telescope").extensions["recent-files"].recent_files({})
      end)

      -- Autocmds
      vim.api.nvim_create_autocmd("User", {
        group = vim.api.nvim_create_augroup("Telescope", { clear = true }),
        pattern = "TelescopePreviewerLoaded",
        command = "setlocal number",
      })

      -- Loading extensions
      local extensions = { "fzf", "coc", "recent-files" }
      for _, ext in ipairs(extensions) do
        telescope.load_extension(ext)
      end

      local actions = require("telescope.actions")
      local actions_layout = require("telescope.actions.layout")

      telescope.setup({
        defaults = {
          -- layout_strategy = "vertical",
          previewer = true,
          winblend = 0,
          layout_config = {
            prompt_position = "bottom",
            scroll_speed = 1,
            preview_cutoff = 0,
            width = 0.9,
            height = 0.9,
            preview_width = 0.5,
          },
          vimgrep_arguments = {
            "rg",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--color=never",
            "--smart-case",
            "--hidden",
            "--glob=!.git/",
            "--glob=!.yarn/",
            "--glob=!package-lock.json",
          },
          file_ignore_patterns = {
            "node_modules",
            "%.git/",
            "%.yarn/",
          },
          mappings = {
            i = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-y>"] = actions.preview_scrolling_up,
              ["<C-e>"] = actions.preview_scrolling_down,
              ["<M-v>"] = actions.select_vertical,
              ["<M-s>"] = actions.select_horizontal,
              ["<M-t>"] = actions.select_tab,
              ["<esc>"] = actions.close,
              -- ['<C-u>'] = false,
              ["<C-p>"] = actions_layout.toggle_preview,
              ["<Tab>"] = actions.toggle_selection,
              ["<M-q>"] = actions.send_selected_to_qflist,
              ["<C-q>"] = actions.send_to_qflist,
            },
          },
          borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        },
        pickers = {
          find_files = {
            hidden = true,
          },
        },
        extensions = {
          coc = {
            prefer_locations = true,
          },
        },
      })
    end,
  },
}
