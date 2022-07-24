local M = {}

M.setup = function()
  local ok, neotree = pcall(require, 'neo-tree')
  if not ok then
    return
  end

  vim.g.neo_tree_remove_legacy_commands = 1

  neotree.setup({
    popup_border_style = 'single',
    enable_git_status = true,
    enable_diagnostics = true,

    default_component_configs = {
      icon = {
        folder_closed = '',
        folder_open = '',
        folder_empty = '',
      },

      modified = {
        symbol = '✚',
        highlight = 'NeoTreeModified',
      },

      name = {
        use_git_status_colors = true,
      },

      git_status = {
        symbols = {
          -- Change type
          added = 'A',
          modified = 'M',
          deleted = 'D', -- this can only be used in the git_status source
          renamed = 'R', -- this can only be used in the git_status source
          -- Status type
          untracked = '?',
          ignored = 'I',
          unstaged = 'M',
          staged = 'A',
          conflict = 'U',
        },
      },
    },

    window = {
      mappings = {
        ['o'] = 'toggle_node',
        ['l'] = 'open',
        ['<C-s>'] = 'open_split',
        ['<C-v>'] = 'open_vsplit',
        -- ["S"] = "split_with_window_picker",
        -- ["s"] = "vsplit_with_window_picker",
        ['<C-t>'] = 'open_tabnew',
        ['w'] = 'open_with_window_picker',
        ['h'] = 'close_node',
        -- ['z'] = 'close_all_nodes',
        -- ['Z'] = 'expand_all_nodes',
        ['a'] = 'add',
        ['A'] = 'add_directory',
        ['d'] = 'delete',
        ['r'] = 'rename',
        ['y'] = 'copy_to_clipboard',
        ['x'] = 'cut_to_clipboard',
        ['p'] = 'paste_from_clipboard',
        ['q'] = 'close_window',
        ['R'] = 'refresh',
        ['?'] = 'show_help',
      },
    },

    filesystem = {
      filtered_items = {
        visible = false,
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_hidden = false,
      },
      follow_current_file = true,
      group_empty_dirs = true,
      use_libuv_file_watcher = false,
      window = {
        mappings = {
          ['<bs>'] = 'navigate_up',
          ['.'] = 'set_root',
          ['I'] = 'toggle_hidden',
          ['/'] = 'fuzzy_finder',
          ['D'] = 'fuzzy_finder_directory',
          ['f'] = 'filter_on_submit',
          ['<c-x>'] = 'clear_filter',
          ['[g'] = 'prev_git_modified',
          [']g'] = 'next_git_modified',
        },
      },
    },
  })
end

return M
