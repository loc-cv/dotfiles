local M = {}

M.setup = function()
  local ok, tmux = pcall(require, 'tmux')
  if not ok then
    return
  end

  tmux.setup({
    copy_sync = {
      -- enables copy sync. by default, all registers are synchronized.
      -- to control which registers are synced, see the `sync_*` options.
      enable = false,
    },
    navigation = {
      -- cycles to opposite pane while navigating into the border
      cycle_navigation = false,

      -- enables default keybindings (C-hjkl) for normal mode
      enable_default_keybindings = true,

      -- prevents unzoom tmux when navigating beyond vim border
      persist_zoom = true,
    },
    resize = {
      -- enables default keybindings (A-hjkl) for normal mode
      enable_default_keybindings = false,

      -- sets resize steps for x axis
      resize_step_x = 2,

      -- sets resize steps for y axis
      resize_step_y = 2,
    },
  })
end

return M
