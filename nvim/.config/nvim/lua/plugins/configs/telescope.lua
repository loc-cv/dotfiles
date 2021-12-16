local telescope = require "telescope"
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
    },
    file_ignore_patterns = {
      "%.png",
      "%.jpg",
      "%.jpeg",
      "%.webp",
      "node_modules",
      "*%.min%.*",
      "dotbot",
      "^.git/",
    },
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.close,
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
  extensions = {},
}

-- Loading extensions
local extensions = { "fzf", "media_files", "emoji" }
for _, ext in ipairs(extensions) do
  telescope.load_extension(ext)
end
