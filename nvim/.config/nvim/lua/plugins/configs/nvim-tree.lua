local M = {}

M.setup = function()
  local ok, nvimtree = pcall(require, 'nvim-tree')
  if not ok then
    return
  end

  local mappings = {
    { key = { 'l', 'o', '<CR>' }, action = 'edit' },
    { key = 'h', action = 'close_node' },
    { key = '<C-v>', action = 'vsplit' },
    { key = '<C-s>', action = 'split' },
    { key = '<C-t>', action = 'tabnew' },
    { key = 'P', action = 'preview' },
    { key = 'K', action = 'first_sibling' },
    { key = 'J', action = 'last_sibling' },
    { key = 'R', action = 'refresh' },
    { key = 'a', action = 'create' },
    { key = 'dF', action = 'remove' },
    { key = 'df', action = 'trash' },
    { key = 'r', action = 'rename' },
    { key = '<C-r>', action = 'full_rename' },
    { key = 'dd', action = 'cut' },
    { key = 'yy', action = 'copy' },
    { key = 'yn', action = 'copy_name' },
    { key = 'yp', action = 'copy_path' },
    { key = 'yP', action = 'copy_absolute_path' },
    { key = 'p', action = 'paste' },
    { key = '<BS>', action = 'dir_up' },
    { key = 's', action = 'system_open' },
    { key = 'f', action = 'live_filter' },
    { key = 'F', action = 'clear_live_filter' },
    { key = 'q', action = 'close' },
    { key = '<C-k>', action = 'toggle_file_info' },
    { key = '?', action = 'toggle_help' },
    { key = 'm', action = 'toggle_mark' },
    { key = 'bm', action = 'bulk_move' },
  }

  nvimtree.setup({
    hijack_cursor = true,
    view = {
      adaptive_size = true,
      width = 35,
      centralize_selection = false,
      mappings = {
        custom_only = true,
        list = mappings,
      },
    },
    renderer = {
      group_empty = true,
      highlight_opened_files = 'none',
      indent_markers = {
        enable = true,
      },
      icons = {
        show = {
          folder_arrow = false,
        },
        glyphs = {
          folder = {
            arrow_closed = '',
            arrow_open = '',
            default = '',
            open = '',
            empty = '',
            empty_open = '',
            symlink = '',
            symlink_open = '',
          },
        },
      },
    },
    diagnostics = {
      enable = false,
    },
    git = {
      enable = false,
    },
    update_focused_file = {
      enable = true,
      update_root = true,
    },
  })
end

return M
