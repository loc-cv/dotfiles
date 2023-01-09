local M = {}
M.setup = function()
  local ok, telescope = pcall(require, 'telescope')
  if not ok then
    return
  end

  -- Loading extensions
  local extensions = {
    'fzf',
    'media_files',
    'coc',
  }
  for _, ext in ipairs(extensions) do
    telescope.load_extension(ext)
  end

  local actions = require('telescope.actions')
  local actions_layout = require('telescope.actions.layout')

  telescope.setup({
    defaults = {
      layout_strategy = 'vertical',
      previewer = true,
      layout_config = {
        prompt_position = 'bottom',
        scroll_speed = 1,
        preview_cutoff = 0,
      },
      vimgrep_arguments = {
        'rg',
        '--no-heading',
        '--with-filename',
        '--line-number',
        '--column',
        '--color=never',
        '--smart-case',
        '--hidden',
        '--glob=!.git/',
        '--glob=!.yarn/',
      },
      file_ignore_patterns = {
        'node_modules',
        '%.git/',
        '%.yarn/',
      },
      mappings = {
        i = {
          ['<C-j>'] = actions.move_selection_next,
          ['<C-k>'] = actions.move_selection_previous,
          ['<C-y>'] = actions.preview_scrolling_up,
          ['<C-e>'] = actions.preview_scrolling_down,
          ['<C-v>'] = actions.select_vertical,
          ['<C-s>'] = actions.select_horizontal,
          ['<C-t>'] = actions.select_tab,
          ['<esc>'] = actions.close,
          -- ['<C-u>'] = false,
          ['<M-p>'] = actions_layout.toggle_preview,
        },
      },
      borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
    },
    pickers = {
      find_files = {
        hidden = true,
      },
    },
    extensions = {
      media_files = {
        filetypes = { 'png', 'webp', 'jpg', 'jpeg', 'webm', 'pdf', 'mp4' },
      },
      coc = {
        prefer_locations = true,
      },
    },
  })
end

return M
