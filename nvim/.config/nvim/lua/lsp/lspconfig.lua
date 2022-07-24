local M = {}

M.setup = function()
  local ok, lspconfig = pcall(require, 'lspconfig')
  if not ok then
    return
  end

  vim.diagnostic.config({
    update_in_insert = true,
  })

  local on_attach = function(client)
    local illuminate_ok, illuminate = pcall(require, 'illuminate')
    if not illuminate_ok then
      return
    end
    illuminate.on_attach(client)
  end

  -- capabilities
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
  capabilities.textDocument.completion.completionItem.snippetSupport = true

  -- Lsp configs
  lspconfig.sumneko_lua.setup({
    capabilities = capabilities,
    on_attach = on_attach,
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

  lspconfig.emmet_ls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { 'html', 'typescriptreact', 'javascriptreact' },
  })

  lspconfig.tsserver.setup({
    capabilities = capabilities,
    on_attach = on_attach,
  })

  lspconfig.html.setup({
    capabilities = capabilities,
    on_attach = on_attach,
  })

  lspconfig.cssls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
  })
end

return M
