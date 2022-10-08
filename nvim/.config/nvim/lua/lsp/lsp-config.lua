local M = {}

M.setup = function()
  local lspconfig_ok, lspconfig = pcall(require, 'lspconfig')
  if not lspconfig_ok then
    return
  end

  vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
      border = 'single',
      source = 'always',
    },
  })

  vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'single' })
  vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'single' })
  vim.lsp.handlers['textDocument/publishDiagnostics'] = function(_, result, ctx, ...)
    local client = vim.lsp.get_client_by_id(ctx.client_id)
    if client and client.name == 'tsserver' then
      result.diagnostics = vim.tbl_filter(function(diagnostic)
        return not diagnostic.message:find('is declared but its value is never read')
      end, result.diagnostics)
      -- result.diagnostics = {}
    end
    return vim.lsp.diagnostic.on_publish_diagnostics(nil, result, ctx, ...)
  end

  -- on_attach
  local illuminate_ok, illuminate = pcall(require, 'illuminate')
  local navic_ok, navic = pcall(require, 'nvim-navic')
  if not (illuminate_ok and navic_ok) then
    return
  end

  local kind_icons = require('lsp.icons').kind_icons
  navic.setup({
    icons = kind_icons,
    separator = ' ❯ ',
  })

  local navic_clients = { 'sumneko_lua', 'tsserver' }
  local on_attach = function(client, bufnr)
    illuminate.on_attach(client)
    if vim.tbl_contains(navic_clients, client.name) then
      navic.attach(client, bufnr)
    end
  end

  -- Capabilities
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

  lspconfig.tsserver.setup({
    capabilities = capabilities,
    on_attach = on_attach,
  })

  lspconfig.emmet_ls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { 'html', 'typescriptreact', 'javascriptreact' },
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
