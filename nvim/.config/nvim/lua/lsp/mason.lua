local M = {}

M.setup = function()
  local mason_ok, mason = pcall(require, 'mason')
  local mason_tool_installer_ok, mason_tool_installer = pcall(require, 'mason-tool-installer')
  if not (mason_ok and mason_tool_installer_ok) then
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

  mason_tool_installer.setup({
    ensure_installed = {
      -- Formatter
      'stylua',
      'prettierd',

      -- Linter
      'eslint_d',

      -- Lsp
      'css-lsp',
      'emmet-ls',
      'html-lsp',
      'lua-language-server',
      'typescript-language-server',
    },
  })
end

return M
