local M = {}

M.setup = function()
  require('lsp.lsp-installer').setup()

  local ok, lspconfig = pcall(require, 'lspconfig')
  if not ok then
    return
  end

  -- Add additional capabilities supported by nvim-cmp
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

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

  lspconfig.tsserver.setup({})
  lspconfig.eslint.setup({})
end

return M
