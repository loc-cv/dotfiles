local M = {}

M.setup = function()
  local ok, lsp_installer = pcall(require, 'nvim-lsp-installer')
  if not ok then
    return
  end

  lsp_installer.setup({
    ensure_installed = {},
    automatic_installation = true,

    ui = {
      check_outdated_servers_on_open = true,
      border = 'single',

      icons = {
        server_installed = '✓',
        server_pending = '➜',
        server_uninstalled = '✗',
      },

      keymaps = {
        toggle_server_expand = '<CR>',
        install_server = 'i',
        update_server = 'u',
        update_all_servers = 'U',
        check_server_version = 'c',
        check_outdated_servers = 'C',
        uninstall_server = 'X',
      },
    },
  })
end

return M
