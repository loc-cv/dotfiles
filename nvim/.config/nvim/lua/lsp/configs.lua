local M = {}

M.setup = function()
  require('nvim-lsp-installer').setup({
    ensure_installed = {},
    automatic_installation = false,

    ui = {
      check_outdated_servers_on_open = true,
      border = 'single',

      icons = {
        server_installed = '✓',
        server_pending = '➜',
        server_uninstalled = '✗',
      },

      keymaps = {
        -- expand a server in the UI
        toggle_server_expand = '<CR>',

        -- install the server under the current cursor position
        install_server = 'i',

        -- reinstall/update the server under the current cursor position
        update_server = 'u',

        -- check for new version for the server under the current cursor position
        check_server_version = 'c',

        -- update all installed servers
        update_all_servers = 'U',

        -- check which installed servers are outdated
        check_outdated_servers = 'C',

        -- uninstall a server
        uninstall_server = 'X',
      },
    },
  })

  local lspconfig = require('lspconfig')

  -- Add additional capabilities supported by nvim-cmp
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

  lspconfig.sumneko_lua.setup({
    capabilities = capabilities,
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = 'LuaJIT',
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = { 'vim' },
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file('', true),
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        },
      },
    },
  })

  lspconfig.tsserver.setup({})
  lspconfig.eslint.setup({})
end

return M
