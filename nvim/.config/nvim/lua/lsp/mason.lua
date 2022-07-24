local M = {}

local setup_mason = function()
  local ok, mason = pcall(require, 'mason')
  if not ok then
    return
  end

  mason.setup({
    ui = {
      border = 'single',

      icons = {
        package_installed = '✓',
        package_pending = '➜',
        package_uninstalled = '✗',
      },

      keymaps = {
        toggle_package_expand = '<Tab>',
        install_package = 'i',
        update_package = 'u',
        check_package_version = 'c',
        update_all_packages = 'U',
        check_outdated_packages = 'C',
        uninstall_package = 'X',
        cancel_installation = '<C-c>',
        apply_language_filter = '<C-f>',
      },
    },
  })
end

local setup_mason_lspconfig = function()
  local ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
  if not ok then
    return
  end

  mason_lspconfig.setup({
    ensure_installed = { 'sumneko_lua', 'tsserver', 'html', 'cssls', 'emmet_ls' },
  })
end

M.setup = function()
  setup_mason()
  setup_mason_lspconfig()
end

return M
