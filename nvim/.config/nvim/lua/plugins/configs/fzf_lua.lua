local M = {}

M.setup = function()
  local ok, fzf_lua = pcall(require, "fzf-lua")
  if not ok then
    return
  end

  local actions = require "fzf-lua.actions"
  fzf_lua.setup {
    winopts = {
      height = 0.85,
      width = 0.80,
      row = 0.35,
      col = 0.50,
      border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
      fullscreen = false,
      preview = {
        wrap = "nowrap",
        hidden = "nohidden",
        vertical = "up:55%",
        horizontal = "right:60%",
        layout = "vertical",
        delay = 0,
        winopts = {
          number = true,
          relativenumber = false,
          cursorline = true,
          cursorlineopt = "both",
          cursorcolumn = false,
          signcolumn = "yes",
          list = false,
          foldenable = false,
          foldmethod = "manual",
        },
      },
    },

    keymap = {
      builtin = {
        ["<C-h>"] = "toggle-help",
        ["<C-f>"] = "toggle-fullscreen",
        ["?"] = "toggle-preview",
        ["/"] = "toggle-preview-wrap",
        ["<C-n>"] = "toggle-preview-cw",
        ["<C-p>"] = "toggle-preview-ccw",
        ["<C-d>"] = "preview-page-down",
        ["<C-u>"] = "preview-page-up",
        ["<C-r>"] = "preview-page-reset",
      },
    },

    actions = {
      files = {
        ["default"] = actions.file_edit_or_qf,
        ["ctrl-x"] = actions.file_split,
        ["ctrl-v"] = actions.file_vsplit,
        ["ctrl-t"] = actions.file_tabedit,
        ["alt-q"] = actions.file_sel_to_qf,
      },
      buffers = {
        ["default"] = actions.buf_edit,
        ["ctrl-x"] = actions.buf_split,
        ["ctrl-v"] = actions.buf_vsplit,
        ["ctrl-t"] = actions.buf_tabedit,
      },
    },

    previewers = {
      builtin = {
        extensions = {
          ["jpg"] = { "ueberzug" },
          ["jpeg"] = { "ueberzug" },
          ["png"] = { "ueberzug" },
          ["webp"] = { "ueberzug" },
          ["webm"] = { "ueberzug" },
          ["pdf"] = { "ueberzug" },
          ["mp4"] = { "ueberzug" },
        },
        ueberzug_scaler = "cover",
      },
    },

    -- provider setup
    grep = {
      cmd = "rg --column --line-number --no-heading --color=always --smart-case --hidden --with-filename --glob=!.git/",
    },
  }
end

return M
