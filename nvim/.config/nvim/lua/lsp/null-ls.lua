local M = {}

M.setup = function()
  local ok, null_ls = pcall(require, 'null-ls')
  if not ok then
    return
  end

  -- Avoid LSP formatting conflicts & format on save
  local lsp_formatting = function(bufnr)
    vim.lsp.buf.format({
      filter = function(client)
        return client.name == 'null-ls'
      end,
      bufnr = bufnr,
    })
  end

  local lspFormattingAuGrp = vim.api.nvim_create_augroup('LspFormatting', {})

  null_ls.setup({
    on_attach = function(client, bufnr)
      if client.supports_method('textDocument/formatting') then
        vim.api.nvim_clear_autocmds({ group = lspFormattingAuGrp, buffer = bufnr })
        vim.api.nvim_create_autocmd('BufWritePre', {
          group = lspFormattingAuGrp,
          buffer = bufnr,
          callback = function()
            lsp_formatting(bufnr)
            -- vim.lsp.buf.format({ bufnr = bufnr })
          end,
        })
      end
    end,

    sources = {
      -- formatting
      null_ls.builtins.formatting.stylua.with({
        extra_args = { '--config-path', vim.fn.expand('~/.config/nvim/stylua.toml') },
      }),
      null_ls.builtins.formatting.prettierd,
      null_ls.builtins.diagnostics.eslint_d,
      null_ls.builtins.code_actions.eslint_d,
    },
  })
end

return M
