local M = {}

M.setup = function()
  local ok, telescope = pcall(require, "telescope")
  if not ok then
    return
  end

  local actions = require "telescope.actions"

  telescope.setup {
    defaults = {
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--hidden",
        "--glob=!.git/",
      },
      file_ignore_patterns = {
        "node_modules",
        "*%.min%.*",
        "dotbot",
        "^.git/",
      },
      mappings = {
        i = {
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          ["<M-c>"] = actions.close,
          ["<M-w>"] = actions.delete_buffer,
          -- ["<esc>"] = actions.close,
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
      media_files = {
        filetypes = { "png", "webp", "jpg", "jpeg", "webm", "pdf", "mp4" },
      },
    },
  }

  -- Loading extensions
  local extensions = { "fzf", "media_files", "emoji" }
  for _, ext in ipairs(extensions) do
    telescope.load_extension(ext)
  end
end

return M
