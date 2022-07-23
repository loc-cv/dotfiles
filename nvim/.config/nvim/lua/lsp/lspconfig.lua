local M = {}

M.setup = function()
  require('lsp.lsp-installer').setup()

  local ok, lspconfig = pcall(require, 'lspconfig')
  if not ok then
    return
  end

  local fn = vim.fn
  fn.sign_define('DiagnosticSignError', { text = ' ', texthl = 'DiagnosticSignError' })
  fn.sign_define('DiagnosticSignWarn', { text = ' ', texthl = 'DiagnosticSignWarn' })
  fn.sign_define('DiagnosticSignInfo', { text = ' ', texthl = 'DiagnosticSignInfo' })
  fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })

  -- Add additional capabilities supported by nvim-cmp
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

  -- Lsp configs
  lspconfig.sumneko_lua.setup({
    capabilities = capabilities,
    settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
        },
        diagnostics = {
          globals = { 'vim' },
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file('', true),
        },
        telemetry = {
          enable = false,
        },
      },
    },
  })

  lspconfig.tsserver.setup({
    capabilities = capabilities,
  })
end

return M
